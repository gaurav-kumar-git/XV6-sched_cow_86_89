# Copy-On-Write (COW) Patch for xv6

## Team Members
- **Gaurav Kumar**
- **Kakadiya Omi Anilbhai**

---

## Overview

This project implements the **Copy-On-Write (COW)** mechanism in the xv6 operating system. COW optimizes memory usage by delaying the copying of pages until a write operation is performed. This allows multiple processes to share the same memory pages initially, copying them only when necessary, reducing memory overhead.

---

## How Copy-On-Write Works

1. **Process Forking**:  
   When a process forks, instead of duplicating all its memory pages, the parent and child processes share the same pages marked as **read-only**.

2. **Write Operation**:  
   If either process attempts to modify a shared page, a **page fault** is triggered. The operating system then creates a private copy of the page for the process that initiated the write.

3. **Benefits**:  
   - Reduces memory usage during process forking.
   - Improves performance by avoiding unnecessary page copying.
   - Pages are only copied when a write operation occurs, following a lazy evaluation approach.

---

## Steps to Run the COW Patch

1. make clean
2. make qemu-nox
