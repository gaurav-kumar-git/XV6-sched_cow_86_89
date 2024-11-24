# xv6 Scheduler README

## Team Members
- **Gaurav Kumar**
- **Kakadiya Omi Anilbhai**

---

## Overview

This project implements multiple scheduling algorithms in xv6. The scheduler can be switched by modifying the `SCHEDULER` variable in the `Makefile`. Below are the details on how to configure and run the xv6 kernel with the desired scheduler.

---

## Scheduler Variants

1. **First-Come-First-Serve (FCFS)**  
   - **What it does**: Executes processes in the order they arrive. Non-preemptive and simple to implement but may lead to the "convoy effect" where short processes are delayed by long processes.

2. **Round-Robin (RR)**  
   - **What it does**: Allocates a fixed time slice (quantum) to each process in a cyclic order. This ensures fairness and prevents any single process from monopolizing the CPU.

3. **Priority-Based Scheduling (PBS)**  
   - **What it does**: Processes are assigned a priority, and the scheduler always selects the process with the highest priority. If multiple processes have the same priority, they are scheduled in a round-robin manner.

4. **Multi-Level Feedback Queue (MLFQ)**  
   - **What it does**: Dynamically adjusts the priority of processes based on their behavior. Processes that use more CPU time are moved to lower-priority queues, while processes that wait for I/O are moved to higher-priority queues. This balances responsiveness and throughput.

---

## Steps to Initialize the Scheduler

1. Open the `Makefile` in the root directory of the xv6 source code.
2. Locate the line that defines the `SCHEDULER` variable. For example:
   ```makefile
   # SCHEDULER variable
   SCHEDULER = RR
3. make clean
4. make qemu-nox

