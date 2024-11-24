#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
    int num_processes = 10; // Number of processes to create

    for (int i = 0; i < num_processes; i++)
    {
        int pid = fork();
        if (pid < 0)
        {
            printf(1, "Fork failed for process %d\n", i);
            exit();
        }

        if (pid == 0)
        {
            // Child process
            int priority = 100 - i; // Lower priority value = Higher priority
            if (set_priority(priority, getpid()) < 0)
            {
                printf(1, "Failed to set priority for process %d\n", i);
                exit();
            }

            // Simulate work
            printf(1, "Priority %d process started\n",priority);
            for (double z = 0; z < 1000000.0; z += 0.01)
            {
                double x = x + 3.14 * 89.64; // useless calculations to consume CPU time
            }
            // Busy loop to simulate work
            // printf(1, "Process %d (Priority %d) finished\n", i, priority);
            exit();
        }
    }

    // Parent process: wait for all children
    for (int i = 0; i < num_processes; i++)
    {
        wait();
    }

    // printf(1, "All processes finished\n");
    exit();
}
