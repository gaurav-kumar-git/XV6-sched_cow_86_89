#include "types.h"
#include "user.h"
#include "Info_req.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "param.h"
#include "fcntl.h"


void cpuBound(int n)
{

  for (int i = 0; i < n; i++)
  {
    int pid = fork();
    if (pid == 0)
    {

      for (double z = 0; z < 1000000.0; z += 0.01)
      {
        double x = x + 3.14 * 89.64; // useless calculations to consume CPU time
      }
      if (!PLOT){
        printf(1, "Process: %d Finished\n", i);
      }
      exit(); //bye bye
    }

    continue;
  }

  while (wait() != -1)
    ;
}

void cpuBound_FCFS(int n)
{

  for (int i = 0; i < n; i++)
  {
    int pid = fork();
    if (pid == 0)
    {

      for (double z = 0; z < 1000000.0; z += 0.01)
      {
        double x = x + 3.14 * 89.64; // useless calculations to consume CPU time
      }
      exit(); //bye bye
    }
    
    continue;
  }

  while (wait() != -1)
    ;
}

void IoBound(int n)
{
  for (int i = 0; i < n; i++)
  {
    int pid = fork();
    if (pid == 0)
    {
      for (int k = 0; k < i * 100 + 1; k++)
      {
        sleep((10 * (n - i)) % 3 + 1);
      }
      if (!PLOT){
       printf(1, "Process: %d Finished\n", i);
      }
      exit(); //bye bye
    }

    continue;
  }

  while (wait() != -1)
    ;
}



int main(int argc, char *argv[])
{

  if (argc != 3)
  {
    printf(1, "Usage <Test Type Number> <Number of Procs>\n");
    exit();
  }
  int n = atoi(argv[2]);
  int test = atoi(argv[1]);
  switch (test)
  {
  
  case 1:
    cpuBound(n); //benchmark for n CPU Bound Processes
    break;

  case 2:
    IoBound(n); //n IO Bound Processes
    break;

  
  case 3:
    cpuBound_FCFS(n); // A modified version of given Benchmark
    break;
  
  }

  exit();
}