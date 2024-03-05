#include "usm_entete.h"
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <bits/socket.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <errno.h>

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>



#include <syscall.h>
#include <unistd.h>
#include <x86gprintrin.h>


#ifndef __x86_64__
# error This test is 64-bit only
#endif

#ifndef __NR_uintr_register_handler
#define __NR_uintr_register_handler     471
#define __NR_uintr_unregister_handler   472
#define __NR_uintr_vector_fd            473
#define __NR_uintr_register_sender      474
#define __NR_uintr_unregister_sender    475
#define __NR_uintr_wait                 476
#endif

#define uintr_register_handler(handler, flags)  syscall(__NR_uintr_register_handler, handler, flags)
#define uintr_unregister_handler(flags)         syscall(__NR_uintr_unregister_handler, flags)
#define uintr_vector_fd(vector, flags)          syscall(__NR_uintr_vector_fd, vector, flags)
#define uintr_register_sender(fd, flags)        syscall(__NR_uintr_register_sender, fd, flags)
#define uintr_unregister_sender(ipi_idx, flags) syscall(__NR_uintr_unregister_sender, ipi_idx, flags)
#define uintr_wait(usec, flags)                 syscall(__NR_uintr_wait, usec, flags)




#define CONFIG_FILE "/home/jocelyn/Bureau/flusm-devBugs/Userspace/APIv/examples/project-2/alloc/config"
#define BUFFER_SIZE 1024

#define SHM_SIZE 1024 // Taille de la mémoire partagée

#define SERVER_IP "127.0.0.1"
#define PORT 8090
#define MAX_PATH 1024
#define BUF_SIZE 1024


int *fd_int;

// shared memory
key_t key = 1234; // Clé pour la mémoire partagée
int shmid;
char *shm_ptr;

int globalSocket = 0;
struct usm_return_connect *ep;



// Fonction pour lire le fichier de configuration et extraire l'adresse IP et le port du serveur
void read_server_config() {
    FILE *file = fopen(CONFIG_FILE, "r");
    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier de configuration");
        exit(EXIT_FAILURE);
    }

    char line[BUFFER_SIZE];

    while (fgets(line, sizeof(line), file)) {
        char *key = strtok(line, "=");
        char *value = strtok(NULL, "=");
        if (strcmp(key, "fd_int") == 0) {
            *fd_int = atoi(value);
        }
    }

    fclose(file);
    if (*fd_int == -1) {
        fprintf(stderr, "Port non trouvé dans le fichier de configuration\n");
        exit(EXIT_FAILURE);
    }
}


char* getProcessNameFromPID(int pid) {
    char path[MAX_PATH];
    char buffer[MAX_PATH];
    FILE* fp;
    char* processName = NULL;

    // Construction du chemin vers le fichier stat du processus
    snprintf(path, MAX_PATH, "/proc/%d/stat", pid);

    // Ouverture du fichier stat du processus
    fp = fopen(path, "r");
    if (fp == NULL) {
        perror("Error : ouverture du fichier");
        fprintf(stderr, "Error: ouverture du fichier %s\n", path);
        return NULL;
    }

    // Lecture du contenu du fichier stat
    if (fgets(buffer, sizeof(buffer), fp) != NULL) {

        // Extraction du nom du processus (le deuxième champ dans le fichier stat)
        char* token = strtok(buffer, " "); // Premier champ
        token = strtok(NULL, " "); // Deuxième champ
        if (token != NULL) {
            // Suppression des parenthèses entourant le nom du processus
            token = strtok(token, "(");
            processName = strdup(token);
        }

        char* closeParenthse = strchr(token, ')');
            if (closeParenthse != NULL) {
                *closeParenthse = '\0';
            }
            // affectation du nom de processus a la variable
            processName = strdup(token);
    }

    fclose(fp);
    return processName;
}

int create_and_connect_socket(int port)
{
    int SocketClient = socket(AF_INET, SOCK_STREAM, 0);

    if (SocketClient < 0)
    {
       perror("Erreur de la creation du socket client\n");
       return -1;  
    }

    struct sockaddr_in server_add ;

    server_add.sin_family = AF_INET;
    if (inet_pton(AF_INET, "127.0.0.1", &(server_add.sin_addr)) <= 0)
    {
        perror("Erreur lors de la conversion de l'adresse IP\n");
        return -1;
    }
    
    server_add.sin_port = htons(port);

    printf("valeur du port : %d\n", port);  

    if (connect(SocketClient, (struct sockaddr *)&server_add, sizeof(server_add)) < 0)
    {
        perror("connexion au serveur a echoué\n");
        close(SocketClient); 
       return -1;
    }

    return SocketClient;
    
}

// etarblir une connexion avec USM
struct usm_return_connect* usm_connect(enum usm_connect_type connect_type, int usm_port)
{
    ep = (struct usm_return_connect*)malloc(sizeof(struct usm_return_connect));

    if(ep==NULL){
        perror("ERROR: Erreur d'allocation de ep\n");
        return NULL;
    }
    
    ep->type = connect_type;
    ep->usm_port = usm_port;

    if (ep->type == SOCKET)
    {
       int fd_socket = create_and_connect_socket(ep->usm_port);
       ep->usm_fd = fd_socket;

       return ep;
        
    }else if (ep->type == INTERRUPT)
    {
    
    read_server_config();
 
    int uipi_index;

    uipi_index = uintr_register_sender(&fd_int, 0);
    
    if (uipi_index < 0) {
                printf("[FAIL]\tErreur de registre de l'expéditeur\n");
                return NULL;
        }

    ep->usm_port = uipi_index;

    ep->usm_fd = -1;

        return ep;
    }

    return NULL;
   
}


char* usm_send(char *request, int length, struct usm_return_connect ret_connect)
{
    struct usm_hint_event * hint = (struct usm_hint_event*)malloc(sizeof(struct usm_hint_event));

    if (hint == NULL) {
        perror("Error: allocation de la memoire hint\n");
        return NULL;
    }

    hint->process_id = getpid();
    char *nom_processus = getProcessNameFromPID(hint->process_id);
    

    if (ret_connect.type == SOCKET)
    {
        
        printf("valeur de socket non : %d\n", ret_connect.usm_fd);

        hint->length = length;

        memcpy(hint->request, request, length);
        //strcpy(hint->request, request);
        memcpy(hint->nom_process, nom_processus, sizeof(hint->nom_process));
        printf("valeur de length : %d\n", hint->length);
        printf("voici le content : %s\n", hint->request);
        printf("pid de processus : %d\n", hint->process_id);
        printf("valeur associer de processus : %s\n", hint->nom_process);
        int totalSize = sizeof(hint->process_id) + sizeof(hint->nom_process) + length +sizeof(hint->length);

        // envoie la taille au serveur
        int sizeResult = send(ret_connect.usm_fd, &totalSize, sizeof(totalSize), 0);

        if(sizeResult < 0) {
            perror("**Erreur envoi taille**");
            return NULL;
        }

        int result = send(ret_connect.usm_fd, hint, totalSize, 0);

        if(result < 0)
        {
            perror("**Erreur envoi réponse**");
            return NULL;
        }
        else printf("Requete envoyée : %d\n", result);
        
        int receivedSize;

        int sizeHint = recv(ret_connect.usm_fd, &receivedSize, sizeof(receivedSize), 0);

        if (sizeHint < 0)
        {
            perror("**Erreur réception taille**");
            close(ret_connect.usm_fd);
            return NULL;
        }

        char * data = (char*)malloc(receivedSize);

        int dataResult = recv(ret_connect.usm_fd, data, receivedSize, 0);

        if (dataResult < 0)
        {
                perror("**Erreur réception données**");

                return NULL;
        }    

        free(hint);
        free(nom_processus);

        printf("valeur : %s\n", data);

        return data;
    }
    else if(ret_connect.type == INTERRUPT)
    {

        // Création de la mémoire partagée
        if ((shmid = shmget(key, SHM_SIZE, IPC_CREAT | 0666)) < 0) {
            perror("shmget");
            exit(1);
        }

        // Attache de la mémoire partagée au processus
        if ((shm_ptr = shmat(shmid, NULL, 0)) == (char *) -1) {
            perror("shmat");
            exit(1);
        }

        sprintf(shm_ptr, "%d", getpid());
        sprintf(shm_ptr, "%s", nom_processus);
        sprintf(shm_ptr, "%d", length);
        sprintf(shm_ptr, "%s", request);



        printf("\t Envoie de IPI\n");
       
       // _senduipi(ret_connect.usm_port);

        uintr_unregister_sender(&fd_int, 0);


         // Détachement de la mémoire partagée
        if (shmdt(shm_ptr) == -1) {
            perror("shmdt");
            exit(1);
        }

        return NULL;       
    }
    
        


}


void usm_close(struct usm_return_connect* ret_connect)
{
    if (ret_connect->type == SOCKET)
    {

        free(ep);
        
        close(ret_connect->usm_fd);
        printf("ok bien\n");
    }
    else
    {
        // a definir
    }
    
    
}

