#include "usm_entete.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

#define fichier "test"


int main(int argc, char *argv[]) {

struct stat statbuf;
// Ouvre un fichier pour le mappage
int fd = open(fichier,  O_RDONLY);
    if (fd == -1) {
        perror("open");
        return -1;
    }
    
    // Connexion au serveur
    struct usm_return_connect *connecter = usm_connect(SOCKET, 8095);

    if (connecter == NULL) {
        fprintf(stderr, "Error : connexion au serveur\n");
        return -1;
    }

    size_t size = 4096; // Taille de chaque allocation en octets
    int num_allocations = 10;

    char *request; // Allocate on the stack instead of using malloc
    request = (char*)malloc(1024);

    bzero(request, 1024);

    void *addr = mmap(NULL, size*num_allocations, PROT_READ | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS, fd, 0);
    sprintf(request, "%c;%d;%p", 'A', num_allocations, (void *)addr);

    printf("je suis\n");

    char *data = usm_send(request, strlen(request), *connecter);

        if (data == NULL) {
            perror("usm_send");
            return -1;
        }
  
    printf("Valeur retour est : %s\n", data);
    
    for (int i = 0; i < num_allocations; i++) {
        // Appel à mmap pour allouer une zone de mémoire virtuelle
        
        if (addr == MAP_FAILED) {
            perror("Error : mmap\n");
            return -1;
        }
        else
        {
           // Accès à la mémoire mappée (lecture seule)
            printf("Contenu du fichier mappé : %s\n", (char*)addr);
            
            //getchar();
            if (munmap(addr, size) == -1) {
                perror("munmap");
                return -1;
            }
        }
        
        addr = addr + 4096;
    }    

    // Libérer la mémoire et fermer la connexion

    free(request);
    free(data);
    
    usm_close(connecter);

    return 0;
}




