#include "../../../include/usm/usm.h"

#include "../../../../ums_bibiotheque/usm_entete.h"
#include <arpa/inet.h> 



#define PORT 8090

#define SEUIL_MAX_PAGES 5
/*
    Basic allocation functions serving as examples. One is required to take a lock whe(r|n)ever touching structures, as those are shared between threads.
        Per page locking proposed through -DPLock compilation option, but really not recommended.
    optEludeList can be changed to any type one'd like, but the related placeholder's quite needed (or any other method one deems wanted) to efficiently mark freed pages as such.
    The same goes for any related point. One has unlimited freedom, just with some logic in linked matters in the API we recommend to read.
*/

/*
    pthread_t internalLocks; -> to initialize in defined usm_setup....
*/

/*
    If you really don't want to use the position pointer, or add more in the case of multiple levels implied, feel free to modify usm's proposed page structure in usm.h.
    Just try not to heavify it too much.
*/




/*
    One dumb idea : reserving pools through defined functions appointed to different policies mapped to processes through the config. file (x set of functions treats of one portion of USM's memory and the other ones the rest of the latter)...

*/


#define PAGE_SIZE 4096  // Taille de la page en octets


struct optEludeList {
    struct page * usmPage;      // no pointer needed..
    struct list_head iulist;
};

struct list_head freeList;
struct list_head usedList;
struct list_head freeListNonZero;


pthread_mutex_t policiesSet1lock;



struct optAdrrList
{
    unsigned long adrr;
    struct list_head adrrList;
};
struct list_head mylist_Adrr;

struct optEludeList *firstPage;
struct optAdrrList *adrr_find ;


bool executed = false;

struct usm_ops dev_usm_ops;         // just one for now but can be greater, i.e. multiple USM instances per arbitrary policies....

LIST_HEAD(usedList);
LIST_HEAD(freeList);
LIST_HEAD(freeListNonZero);
LIST_HEAD(mylist_Adrr);

int n = 0;


////////////////////////////////////////////////////////////////////////////


void *zero_out_pages_thread() {

    struct optEludeList *entry, *tmp;

    list_for_each_entry_safe(entry, tmp, &freeListNonZero, iulist) {
         
        memset((void*)entry->usmPage->data, 0, 4096);
        list_move(&entry->iulist, &freeList);
    }
  
  printf("le nombre element dans la liste est actuel dans le thread : %ld\n", list_count_nodes(&freeListNonZero));
   
}


// Fonction pour vérifier si un élément est présent dans la liste
int element_in_list(struct list_head *head, struct optAdrrList *element_to_find) {

    struct optAdrrList* current;

    list_for_each_entry(current, head, adrrList)
    {
        // Vérification si l'élément est présent
        if (current->adrr == element_to_find->adrr)
        {
            printf("L'élément est présent.\n");
            return 1;
        }
    
    }
    
    // L'élément n'est pas trouvé dans la liste
    return 0;
}


// Fonction pour vérifier si un élément est présent dans la liste
int page_in_list(struct list_head *head, struct optEludeList *page_to_find) {
    
    struct optEludeList* current;

    list_for_each_entry(current, head, iulist)
    {
        // Vérification si l'élément est présent
        if (current->usmPage == page_to_find->usmPage)
        {
            printf("La page est présente.\n");
            return 1;
        }
    
    }
    
    // L'élément n'est pas trouvé dans la liste
    return 0;
}



static inline int kernel_zeroize_alloc(struct usm_event *event)
{
    pthread_mutex_lock(&policiesSet1lock);
   
    if (list_empty(&freeList)) {
        pthread_mutex_unlock(&policiesSet1lock);       // func...
        return 1;
    }

     adrr_find->adrr = event->vaddr;

    if (element_in_list(&mylist_Adrr, adrr_find))
    {
        //event->write = 1;
        printf("il ya adresse : oui\n");

        struct optEludeList * freeListNode = list_first_entry(&freeList, struct optEludeList, iulist);

        usedMemory+=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
        list_move(&(freeListNode->iulist),&usedList);
        pthread_mutex_unlock(&policiesSet1lock);
        if(freeListNode->usmPage == NULL) {
        #ifdef DEBUG
                printf("[devPolicies/Mayday] NULL page..! Aborting.\n");
                getchar();
                exit(1);
        #endif
                return 1;
        }

    usmSetUsedListNode(freeListNode->usmPage, freeListNode); // freeListNode->usmPage->usedListPositionPointer=freeListNode;
    event->paddr=freeListNode->usmPage->physicalAddress;            // we'd need the last one... buffer adding?
    
    #ifdef DEBUG
        printf("[devPolicies] Chosen addr.:%lu\n",event->paddr);
        if (event->paddr==0)
            getchar();
    #endif
        //retry:
        if(usmSubmitAllocEvent(event)) {                // will be multiple, i.e. multiplicity proposed by event, and directly applied by usmSubmitAllocEvent

    #ifdef DEBUG
            printf("[devPolicies/Mayday] Unapplied allocation\n");
            getchar();
    #endif
            pthread_mutex_lock(&policiesSet1lock);
            list_move(&(freeListNode->iulist),&freeList);
            usedMemory-=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
            pthread_mutex_unlock(&policiesSet1lock);
            return 1;
            //goto retry; // some number of times...
        }

        
        usmLinkPage(freeListNode->usmPage,event);
        /*freeListNode->usmPage->virtualAddress=event->vaddr;
        freeListNode->usmPage->process=event->origin;*/
        increaseProcessAllocatedMemory(event->origin, globalPageSize);
        // ... if recognized pattern.. multiple submits.. and so on....             + VMAs list and size on the way! -> no needless long checks if applicable!
        // free(adrr_find);
        // free(firstPage);

        return 0;
    }
    else

    {   
        //pthread_mutex_unlock(&policiesSet1lock);
        printf("Element pas trouve\n");
    
        #ifdef DEBUG
            printf("[devPolicies] Chosen addr.:%lu\n",event->paddr);
            if (event->paddr==0)
                getchar();
        #endif
        //retry:
        if(usmSubmitAllocEvent(event)) {                // will be multiple, i.e. multiplicity proposed by event, and directly applied by usmSubmitAllocEvent

    #ifdef DEBUG
            printf("[devPolicies/Mayday] Unapplied allocation\n");
            getchar();
    #endif
           
            usedMemory-=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
            return 1;
            //goto retry; // some number of times...
        }

        usedMemory+=globalPageSize;

        increaseProcessAllocatedMemory(event->origin, globalPageSize);
        // ... if recognized pattern.. multiple submits.. and so on....             + VMAs list and size on the way! -> no needless long checks if applicable!          
        //pthread_mutex_lock(&policiesSet1lock);

        // Si l'élément n'est pas présent, l'ajouter à la liste
        list_add(&adrr_find->adrrList, &mylist_Adrr);
        printf("valeur de la liste : %ld\n", list_count_nodes(&mylist_Adrr));
        //printf("valeur de la newNOde de la liste : %ld\n", newNode->data.adrr);

        pthread_mutex_unlock(&policiesSet1lock);

        return 0;
    }
}


static inline int basic_alloc(struct usm_event *event) {
    
    pthread_mutex_lock(&policiesSet1lock);
   
    if (list_empty(&freeList)) {
        pthread_mutex_unlock(&policiesSet1lock);       // func...
        return 1;
    }

    adrr_find = malloc(sizeof(struct optAdrrList));
    
    if (adrr_find == NULL)
    {
        printf("Erreur lors de l'allocation de mémoire.\n");
        return -1;
    }
    
    adrr_find->adrr = event->vaddr;

    if (element_in_list(&mylist_Adrr, adrr_find))
    {
        event->write = 1;
        printf("il ya adresse : oui\n");

        struct optEludeList * freeListNode = list_first_entry(&freeList, struct optEludeList, iulist);

        usedMemory+=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
        list_move(&(freeListNode->iulist),&usedList);
        pthread_mutex_unlock(&policiesSet1lock);
        if(freeListNode->usmPage == NULL) {
        #ifdef DEBUG
                printf("[devPolicies/Mayday] NULL page..! Aborting.\n");
                getchar();
                exit(1);
        #endif
                return 1;
        }

    usmSetUsedListNode(freeListNode->usmPage, freeListNode); // freeListNode->usmPage->usedListPositionPointer=freeListNode;
    event->paddr=freeListNode->usmPage->physicalAddress;            // we'd need the last one... buffer adding?
    
    #ifdef DEBUG
        printf("[devPolicies] Chosen addr.:%lu\n",event->paddr);
        if (event->paddr==0)
            getchar();
    #endif
        //retry:
        if(usmSubmitAllocEvent(event)) {                // will be multiple, i.e. multiplicity proposed by event, and directly applied by usmSubmitAllocEvent


    #ifdef DEBUG
            printf("[devPolicies/Mayday] Unapplied allocation\n");
            getchar();
    #endif
            pthread_mutex_lock(&policiesSet1lock);
            list_move(&(freeListNode->iulist),&freeList);
            usedMemory-=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
            pthread_mutex_unlock(&policiesSet1lock);
            return 1;
            //goto retry; // some number of times...
        }

        
        usmLinkPage(freeListNode->usmPage,event);
        /*freeListNode->usmPage->virtualAddress=event->vaddr;
        freeListNode->usmPage->process=event->origin;*/
        increaseProcessAllocatedMemory(event->origin, globalPageSize);
        // ... if recognized pattern.. multiple submits.. and so on....             + VMAs list and size on the way! -> no needless long checks if applicable!
        // free(adrr_find);
        // free(firstPage);

        return 0;
    }
    else

    {   
        //pthread_mutex_unlock(&policiesSet1lock);
        printf("Element pas trouve\n");
       
        usmSetUsedListNode(firstPage->usmPage, firstPage); 
        event->paddr = firstPage->usmPage->physicalAddress;
        event->write = 0;
        usedMemory+=globalPageSize;

        #ifdef DEBUG
            printf("[devPolicies] Chosen addr.:%lu\n",event->paddr);
            if (event->paddr==0)
                getchar();
        #endif
        //retry:
        if(usmSubmitAllocEvent(event)) {                // will be multiple, i.e. multiplicity proposed by event, and directly applied by usmSubmitAllocEvent

    #ifdef DEBUG
            printf("[devPolicies/Mayday] Unapplied allocation\n");
            getchar();
    #endif
           
            usedMemory-=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
            return 1;
            //goto retry; // some number of times...
        }
       
        usmLinkPage(firstPage->usmPage,event);
        /*freeListNode->usmPage->virtualAddress=event->vaddr;
        freeListNode->usmPage->process=event->origin;*/
        increaseProcessAllocatedMemory(event->origin, globalPageSize);
        // ... if recognized pattern.. multiple submits.. and so on....             + VMAs list and size on the way! -> no needless long checks if applicable!          
        //pthread_mutex_lock(&policiesSet1lock);

        // Si l'élément n'est pas présent, l'ajouter à la liste
        list_add(&adrr_find->adrrList, &mylist_Adrr);
        printf("valeur de la liste : %ld\n", list_count_nodes(&mylist_Adrr));
        //printf("valeur de la newNOde de la liste : %ld\n", newNode->data.adrr);

        pthread_mutex_unlock(&policiesSet1lock);

        return 0;
    }
}


static inline int usm_zeroize_alloc(struct usm_event *event) {
    pthread_mutex_lock(&policiesSet1lock);
    if (list_empty(&freeList)) {
        pthread_mutex_unlock(&policiesSet1lock);       // func...
        return 1;
    }
    struct optEludeList * freeListNode = list_first_entry(&freeList, struct optEludeList, iulist);
    usedMemory+=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
    list_move(&(freeListNode->iulist),&usedList);
    pthread_mutex_unlock(&policiesSet1lock);
    if(freeListNode->usmPage == NULL) {
#ifdef DEBUG
        printf("[devPolicies/Mayday] NULL page..! Aborting.\n");
        getchar();
        exit(1);
#endif
        return 1;
    }

    //Mettre à zéro les données de la page
    memset((void*)(freeListNode->usmPage->data), 0, 4096);
    usmSetUsedListNode(freeListNode->usmPage, freeListNode); // freeListNode->usmPage->usedListPositionPointer=freeListNode;
    event->paddr=freeListNode->usmPage->physicalAddress;            // we'd need the last one... buffer adding?
#ifdef DEBUG
    printf("[devPolicies] Chosen addr.:%lu\n",event->paddr);
    if (event->paddr==0)
        getchar();
#endif
    //retry:
    if(usmSubmitAllocEvent(event)) {                // will be multiple, i.e. multiplicity proposed by event, and directly applied by usmSubmitAllocEvent
#ifdef DEBUG
        printf("[devPolicies/Mayday] Unapplied allocation\n");
        getchar();
#endif
        pthread_mutex_lock(&policiesSet1lock);
        list_move(&(freeListNode->iulist),&freeList);
        usedMemory-=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
        pthread_mutex_unlock(&policiesSet1lock);
        return 1;
        //goto retry; // some number of times...
    }
    usmLinkPage(freeListNode->usmPage,event);
    /*freeListNode->usmPage->virtualAddress=event->vaddr;
    freeListNode->usmPage->process=event->origin;*/
    increaseProcessAllocatedMemory(event->origin, globalPageSize);
    // ... if recognized pattern.. multiple submits.. and so on....             + VMAs list and size on the way! -> no needless long checks if applicable!
    return 0;
}



static inline int usm_alloc_zeroize(struct usm_event *event) {
    pthread_mutex_lock(&policiesSet1lock);
    if (list_empty(&freeList))
    {
        if(list_count_nodes(&freeListNonZero) > 0)
        {
            pthread_t tid;
            pthread_create(&tid, NULL, zero_out_pages_thread, NULL);
            pthread_join(tid, NULL);

        } else
        {
            pthread_mutex_unlock(&policiesSet1lock);
            return 1;
        }  
    }

    printf("%ld\n", event->vaddr);

    struct optEludeList * freeListNode = list_first_entry(&freeList, struct optEludeList, iulist);
    usedMemory+=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
    list_move(&(freeListNode->iulist),&usedList);
    pthread_mutex_unlock(&policiesSet1lock);
    if(freeListNode->usmPage == NULL) {
#ifdef DEBUG
        printf("[devPolicies/Mayday] NULL page..! Aborting.\n");
        getchar();
        exit(1);
#endif
        return 1;
    }

    usmSetUsedListNode(freeListNode->usmPage, freeListNode); // freeListNode->usmPage->usedListPositionPointer=freeListNode;
    event->paddr=freeListNode->usmPage->physicalAddress;            // we'd need the last one... buffer adding?
#ifdef DEBUG
    printf("[devPolicies] Chosen addr.:%lu\n",event->paddr);
    if (event->paddr==0)
        getchar();
#endif
    //retry:
    if(usmSubmitAllocEvent(event)) {                // will be multiple, i.e. multiplicity proposed by event, and directly applied by usmSubmitAllocEvent

#ifdef DEBUG
        printf("[devPolicies/Mayday] Unapplied allocation\n");
        getchar();
#endif
        pthread_mutex_lock(&policiesSet1lock);
        list_move(&(freeListNode->iulist),&freeList);
        usedMemory-=globalPageSize;         // though.. if we just simply let the leveraging of differently defined page sizes to developers... it shouldn't be gud.. so we'll just call their functions a number globalPageSize/SYS_PAGE_SIZE of times from USM.. TODO
        pthread_mutex_unlock(&policiesSet1lock);
        return 1;
        //goto retry; // some number of times...
    }
   
    usmLinkPage(freeListNode->usmPage,event);
    /*freeListNode->usmPage->virtualAddress=event->vaddr;
    freeListNode->usmPage->process=event->origin;*/
    increaseProcessAllocatedMemory(event->origin, globalPageSize);
    // ... if recognized pattern.. multiple submits.. and so on....             + VMAs list and size on the way! -> no needless long checks if applicable!
    
    return 0;
}


static inline int double_alloc(struct usm_event *event) {
    if (basic_alloc(event))
        return 1;
    event->vaddr+=SYS_PAGE_SIZE;        // spatial distrib. file could tell the next vaddr to allocate!
    if (basic_alloc(event)) {         // second one's not obliged to work... i.e. VMA's full..&Co.
        pthread_mutex_lock(&policiesSet1lock);
        list_move(&((struct optEludeList *)usmPfnToUsedListNode(usmPfnToPageIndex(event->paddr)))->iulist,&freeList); //list_move(&((struct optEludeList *)usmPageToUsedListNode(usmEventToPage(event)))->iulist,&freeList);
        pthread_mutex_unlock(&policiesSet1lock);
        usmResetUsedListNode(usmEventToPage(event)); //pagesList[usmPfnToPageIndex(event->paddr)].usedListPositionPointer=NULL;
#ifdef DEBUG
        printf("[devPolicies/Sys] Unapplied allocation.. though not mandatory.\n");
        getchar();
#endif
    }
    return 0;
}



int reverse_alloc(struct usm_event *event) {
#ifdef DEBUG
    printf("[devPolicies]Reversing!\n");
    //getchar();
#endif
    pthread_mutex_lock(&policiesSet1lock);
    if (list_empty(&freeList)) {
        pthread_mutex_unlock(&policiesSet1lock);
        return 1;
    }
    struct optEludeList * freeListNode = list_entry(freeList.prev, struct optEludeList, iulist);
    usedMemory+=globalPageSize;
    freeListNode->usmPage->usedListPositionPointer=freeListNode;
    list_move(&(freeListNode->iulist),&usedList);
    pthread_mutex_unlock(&policiesSet1lock);
    event->paddr=freeListNode->usmPage->physicalAddress;
#ifdef DEBUG
    printf("[devPolicies]Chosen addr.:%lu\n",event->paddr);
    if(event->paddr==0)
        getchar();
#endif
    if(usmSubmitAllocEvent(event)) {
#ifdef DEBUG
        printf("[devPolicies/Mayday] Unapplied allocation\n");
        getchar();
#endif
        pthread_mutex_lock(&policiesSet1lock);
        list_move(&(freeListNode->iulist),&freeList);
        usedMemory-=globalPageSize;
        pthread_mutex_unlock(&policiesSet1lock);
        return 1;
    }
    increaseProcessAllocatedMemory(event->origin, globalPageSize);
    freeListNode->usmPage->virtualAddress=event->vaddr;
    freeListNode->usmPage->process=event->origin;
    return 0;
}

static inline int basic_free(struct usm_event * event) {
    int ret = 0;
    struct optEludeList * tempEntry;
    list_for_each_entry(tempEntry,&usedList,iulist) {                       // per process.... DI.
        if (tempEntry->usmPage->virtualAddress==event->vaddr)
            break;
    }
    if(&tempEntry->iulist==&usedList) {
        printf("[devPolicies/Mayday] Corresponding page not found!\n");
        ret=1;
        goto out;
    }
    pthread_mutex_lock(&policiesSet1lock);
    list_move(&tempEntry->iulist,&freeList);
    usedMemory-=SYS_PAGE_SIZE;
    pthread_mutex_unlock(&policiesSet1lock);
    memset((void*)((tempEntry->usmPage)->data), 0, 4096);
#ifdef DEBUG
    printf("\t%lu | %lu\n", event->vaddr, ((struct page *) (tempEntry->usmPage))->physicalAddress);
#endif
    tempEntry->usmPage->virtualAddress=0;
    decreaseProcessAllocatedMemory(tempEntry->usmPage->process, SYS_PAGE_SIZE);
    tempEntry->usmPage->process=0;
    tempEntry->usmPage->usedListPositionPointer=NULL;
out:
    return ret;
}


static inline int pindex_free(struct usm_event * event) {

    struct page * usmPage = usmEventToPage(event);
    if(unlikely(!usmPage)) {
    #ifdef DEBUG
            printf("[devPolicies/Mayday] Event corresponding to no page\n");
    #endif
        return 1;
    }

    if (unlikely(!usmPageToUsedListNode(usmPage))) {
        printf("[devPolicies/Sys] Calling basic free!\n");
        getchar();
        event->vaddr=usmPage->virtualAddress;
        return basic_free(event);
    }
    memset((void*)(usmPage->data), 0, 4096);
    #ifdef DEBUG
        printf("\t[devPolicies]Collecting freed %lu\n", usmPage->physicalAddress);
    #endif
    pthread_mutex_lock(&policiesSet1lock);

    // if ((struct optEludeList *)usmPage->physicalAddress != (struct optEludeList *)firstPage->usmPage->physicalAddress)
    // {
        //list_move(&((struct optEludeList *)usmPageToUsedListNode(usmPage))->iulist,&freeList);
    //}
    
    //list_move_tail(&((struct optEludeList *)usmPageToUsedListNode(usmPage))->iulist,&freeList);
    //list_move(&(firstPage->iulist),&freeListNonZero);
    //printf("parfait top bro\n");
    usmPage->virtualAddress=0;
    decreaseProcessAllocatedMemory(usmPage->process, SYS_PAGE_SIZE);     // can and will always only be of SYS_PAGE_SIZE...
    usmPage->process=0;
    usedMemory-=SYS_PAGE_SIZE;
    pthread_mutex_unlock(&policiesSet1lock);
    return 0;
}

static inline int usm_pindex_free_zeroize (struct usm_event * event) {

    struct page * usmPage = usmEventToPage(event);
    if(unlikely(!usmPage)) {
        #ifdef DEBUG
                printf("[devPolicies/Mayday] Event corresponding to no page\n");
        #endif
            return 1;
    }

    if (unlikely(!usmPageToUsedListNode(usmPage))) {
        printf("[devPolicies/Sys] Calling basic free!\n");
        getchar();
        event->vaddr=usmPage->virtualAddress;
        return basic_free(event); 
    }

    //memset((void*)(usmPage->data), 0, 4096);

    #ifdef DEBUG
        printf("\t[devPolicies]Collecting freed %lu\n", usmPage->physicalAddress);
    #endif
    pthread_mutex_lock(&policiesSet1lock);

    if (list_count_nodes(&freeListNonZero) == SEUIL_MAX_PAGES)
    {
        pthread_t tid;
        pthread_create(&tid, NULL, zero_out_pages_thread, NULL);
        //pthread_detach(tid);
        pthread_join(tid, NULL);
    }

    list_move(&((struct optEludeList *)usmPageToUsedListNode(usmPage))->iulist,&freeListNonZero);
   
    usmPage->virtualAddress=0;
    decreaseProcessAllocatedMemory(usmPage->process, SYS_PAGE_SIZE);     // can and will always only be of SYS_PAGE_SIZE...
    usmPage->process=0;
    usedMemory-=SYS_PAGE_SIZE;
    
    printf("le nombre element dans la liste est actuel : %ld\n", list_count_nodes(&freeListNonZero));

    pthread_mutex_unlock(&policiesSet1lock);
    return 0;

}


int jocelyn_hints_alloc (struct usm_event *event){

    int n=0;
    char value;
    void *temp;

    char *content = "HA!";

    sscanf(event->data, "%c;%d;%p", &value, &n, &temp);

    unsigned long adresse_virtuelle = (unsigned long)temp;

    event->type = ALLOC;

    // Utilisation de la valeur conve.rtie
    event->vaddr = adresse_virtuelle;

    int i;

    if (value == 'A')
    {
        for (int i = 0; i < n; i++)
        {
          
            if (basic_alloc(event)!=0) {
                //printf("Échec de l'allocation pour la page %d\n", i + 1);
                break;
                return -1;
            }

            event->vaddr = event->vaddr + 4096;

        }

        // memcpy((char*)event->vaddr, content, 4096);
       
        char *donnee = strdup("Tout s'est bien passé");
        event->taille=strlen(donnee);
        bzero(event->data,event->taille);
        strcpy(event->data,donnee);
        printf("event data : %s\n", event->data);
        printf("event taille : %d\n", event->taille);
        
        if(usmSubmitHintReturnEvent(event)) {
            printf("Retour du hint à l'utilisateur success %s\n", event->data);
            free(donnee);

            return 0;
        }
    
    }


    return 0;

}

int jocelyn_init (){
   
    //initialise ta variable zero_page
    //la zeroizer

    firstPage = list_first_entry(&freeList, struct optEludeList, iulist);
    list_del(&firstPage->iulist);

    printf("je suis ici : %ld\n", firstPage->usmPage->physicalAddress);
    memset((void*)firstPage->usmPage->data, 0, 4096);

    return 0;
}

struct usm_alloc_policy_ops usm_basic_alloc_policy= {.kernel_zeroize_alloc=kernel_zeroize_alloc, .usm_zeroize_alloc=usm_zeroize_alloc,.usm_pindex_free_zeroize=usm_pindex_free_zeroize,.usm_alloc_zeroize= usm_alloc_zeroize, .usm_init=jocelyn_init, .usm_alloc=basic_alloc,.usm_pindex_free=pindex_free,.usm_free=basic_free, .usm_hints=jocelyn_hints_alloc};
struct usm_alloc_policy_ops alloc_policy_one= {.kernel_zeroize_alloc=kernel_zeroize_alloc,.usm_zeroize_alloc=usm_zeroize_alloc,.usm_pindex_free_zeroize=usm_pindex_free_zeroize,.usm_alloc_zeroize= usm_alloc_zeroize,.usm_init=jocelyn_init,.usm_alloc=reverse_alloc, .usm_pindex_free=pindex_free,.usm_free=basic_free, .usm_hints=jocelyn_hints_alloc};
struct usm_alloc_policy_ops alloc_policy_double= {.kernel_zeroize_alloc=kernel_zeroize_alloc,.usm_zeroize_alloc=usm_zeroize_alloc,.usm_pindex_free_zeroize=usm_pindex_free_zeroize, .usm_alloc_zeroize= usm_alloc_zeroize,.usm_init=jocelyn_init,.usm_alloc=double_alloc, .usm_pindex_free=pindex_free,.usm_free=basic_free, .usm_hints=jocelyn_hints_alloc};

int policiesSet1_setup(unsigned int pagesNumber) {         // alloc.* setup..
    for (int i = 0; i<pagesNumber; i++) {
        struct optEludeList *freeListNode=(struct optEludeList *)malloc(sizeof(struct optEludeList));
        freeListNode->usmPage=pagesList+i;  // param.
        INIT_LIST_HEAD(&(freeListNode->iulist));
        list_add(&(freeListNode->iulist),&freeList);
    }
    if(usm_register_alloc_policy(&alloc_policy_one,"policyOne",false))
        return 1;
    if(usm_register_alloc_policy(&usm_basic_alloc_policy,"basicPolicy",true))
        return 1;
    if(usm_register_alloc_policy(&alloc_policy_double,"doublePolicy",false))
        return 1;
    pthread_mutex_init(&policiesSet1lock,NULL);
    // pthread_create... of any policy/locally defined thread doing anything upon live stat.s proposed by USM
    return 0;
}

void pol_structs_free() {
    struct list_head *listIterator, *tempLstIterator;
    list_for_each_safe(listIterator,tempLstIterator,&(freeList)) {
        struct optEludeList * listNode=list_entry(listIterator, struct optEludeList, iulist);
        list_del(listIterator);
        free(listNode->usmPage);
        free(listNode);
    }
    list_for_each_safe(listIterator,tempLstIterator,&(usedList)) {
        struct optEludeList * listNode=list_entry(listIterator, struct optEludeList, iulist);
        list_del(listIterator);
        free(listNode->usmPage);
        free(listNode);
    }


    free(adrr_find);
    // pthread_join.. of the aforedefined ones.
}

struct usm_ops dev_usm_ops= {
usm_setup:
    policiesSet1_setup,
usm_free:
    pol_structs_free
};













