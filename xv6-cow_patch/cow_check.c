#include "types.h"
#include "stat.h"
#include "user.h"

#define ARRAY_SIZE 102400 // Large array size to trigger ~100 page faults

int shared_array[ARRAY_SIZE]; // Shared array between parent and child

int main(void) {
    int pid;
    int numInitialFreePageParent = getfreepages(); // Get initial free pages in parent
    printf(1, "Parent: Initial number of free pages: %d\n", numInitialFreePageParent);

    // Initialize the shared array
    for (int i = 0; i < ARRAY_SIZE; i++) {
        shared_array[i] = i;
    }

    for (int i = 0; i < 2; i++) {
        pid = fork();
        if (pid == 0) {
            // Child process
            int numInitialFreePageChild = getfreepages(); // Free pages count before modifying shared memory
            printf(1, "Child %d: Initial free pages before write: %d\n", i, numInitialFreePageChild);

            // Modify the shared array to trigger COW page faults
            for (int j = 0; j < ARRAY_SIZE; j++) {
                shared_array[j] = shared_array[j] * 2;
            }

            int numFinalFreePageChild = getfreepages(); // Free pages count after modifying shared memory
            printf(1, "Child %d: Final free pages after write: %d\n", i, numFinalFreePageChild);

            int pagesAllocated = numInitialFreePageChild - numFinalFreePageChild;
            if (pagesAllocated > 0) {
                printf(1, "Child %d: Number of pages allocated due to COW: %d\n", i, pagesAllocated);
            } else {
                printf(1, "Child %d: Error: No decrease in number of free pages\n", i);
            }
            exit();
        }
        else {
            wait();
        }
    }

    int numFinalFreePageParent = getfreepages();
    printf(1, "Parent: Final number of free pages after reaping children: %d\n", numFinalFreePageParent);

    int changeInFreePages = numFinalFreePageParent - numInitialFreePageParent;
    printf(1, "Parent: Change in number of free pages after reaping child processes: %d\n", changeInFreePages);

    exit();
}
