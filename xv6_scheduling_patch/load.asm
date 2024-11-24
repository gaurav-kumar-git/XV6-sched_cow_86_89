
_load:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}



int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp

  if (argc != 3)
  13:	83 39 03             	cmpl   $0x3,(%ecx)
{
  16:	8b 71 04             	mov    0x4(%ecx),%esi
  if (argc != 3)
  19:	74 13                	je     2e <main+0x2e>
  {
    printf(1, "Usage <Test Type Number> <Number of Procs>\n");
  1b:	52                   	push   %edx
  1c:	52                   	push   %edx
  1d:	68 e0 08 00 00       	push   $0x8e0
  22:	6a 01                	push   $0x1
  24:	e8 77 05 00 00       	call   5a0 <printf>
    exit();
  29:	e8 05 04 00 00       	call   433 <exit>
  }
  int n = atoi(argv[2]);
  2e:	83 ec 0c             	sub    $0xc,%esp
  31:	ff 76 08             	push   0x8(%esi)
  34:	e8 87 03 00 00       	call   3c0 <atoi>
  39:	89 c3                	mov    %eax,%ebx
  int test = atoi(argv[1]);
  3b:	58                   	pop    %eax
  3c:	ff 76 04             	push   0x4(%esi)
  3f:	e8 7c 03 00 00       	call   3c0 <atoi>
  switch (test)
  44:	83 c4 10             	add    $0x10,%esp
  47:	83 f8 02             	cmp    $0x2,%eax
  4a:	74 0f                	je     5b <main+0x5b>
  4c:	83 f8 03             	cmp    $0x3,%eax
  4f:	74 26                	je     77 <main+0x77>
  51:	83 e8 01             	sub    $0x1,%eax
  54:	74 13                	je     69 <main+0x69>
    cpuBound_FCFS(n); // A modified version of given Benchmark
    break;
  
  }

  exit();
  56:	e8 d8 03 00 00       	call   433 <exit>
    IoBound(n); //n IO Bound Processes
  5b:	83 ec 0c             	sub    $0xc,%esp
  5e:	53                   	push   %ebx
  5f:	e8 dc 00 00 00       	call   140 <IoBound>
    break;
  64:	83 c4 10             	add    $0x10,%esp
  67:	eb ed                	jmp    56 <main+0x56>
    cpuBound(n); //benchmark for n CPU Bound Processes
  69:	83 ec 0c             	sub    $0xc,%esp
  6c:	53                   	push   %ebx
  6d:	e8 1e 00 00 00       	call   90 <cpuBound>
    break;
  72:	83 c4 10             	add    $0x10,%esp
  75:	eb df                	jmp    56 <main+0x56>
    cpuBound_FCFS(n); // A modified version of given Benchmark
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	53                   	push   %ebx
  7b:	e8 70 00 00 00       	call   f0 <cpuBound_FCFS>
    break;
  80:	83 c4 10             	add    $0x10,%esp
  83:	eb d1                	jmp    56 <main+0x56>
  85:	66 90                	xchg   %ax,%ax
  87:	66 90                	xchg   %ax,%ax
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <cpuBound>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	8b 75 08             	mov    0x8(%ebp),%esi
  97:	53                   	push   %ebx
  for (int i = 0; i < n; i++)
  98:	85 f6                	test   %esi,%esi
  9a:	7e 14                	jle    b0 <cpuBound+0x20>
  9c:	31 db                	xor    %ebx,%ebx
  9e:	66 90                	xchg   %ax,%ax
    int pid = fork();
  a0:	e8 86 03 00 00       	call   42b <fork>
    if (pid == 0)
  a5:	85 c0                	test   %eax,%eax
  a7:	74 18                	je     c1 <cpuBound+0x31>
  for (int i = 0; i < n; i++)
  a9:	83 c3 01             	add    $0x1,%ebx
  ac:	39 de                	cmp    %ebx,%esi
  ae:	75 f0                	jne    a0 <cpuBound+0x10>
  while (wait() != -1)
  b0:	e8 86 03 00 00       	call   43b <wait>
  b5:	83 f8 ff             	cmp    $0xffffffff,%eax
  b8:	75 f6                	jne    b0 <cpuBound+0x20>
}
  ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  bd:	5b                   	pop    %ebx
  be:	5e                   	pop    %esi
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    
      for (double z = 0; z < 1000000.0; z += 0.01)
  c1:	d9 ee                	fldz   
  c3:	dd 05 10 09 00 00    	fldl   0x910
  c9:	dc c1                	fadd   %st,%st(1)
  cb:	d9 05 18 09 00 00    	flds   0x918
  d1:	df f2                	fcomip %st(2),%st
  d3:	77 f4                	ja     c9 <cpuBound+0x39>
  d5:	dd d8                	fstp   %st(0)
  d7:	dd d8                	fstp   %st(0)
        printf(1, "Process: %d Finished\n", i);
  d9:	83 ec 04             	sub    $0x4,%esp
  dc:	53                   	push   %ebx
  dd:	68 c8 08 00 00       	push   $0x8c8
  e2:	6a 01                	push   $0x1
  e4:	e8 b7 04 00 00       	call   5a0 <printf>
      exit(); //bye bye
  e9:	e8 45 03 00 00       	call   433 <exit>
  ee:	66 90                	xchg   %ax,%ax

000000f0 <cpuBound_FCFS>:
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	56                   	push   %esi
  f4:	8b 75 08             	mov    0x8(%ebp),%esi
  f7:	53                   	push   %ebx
  for (int i = 0; i < n; i++)
  f8:	85 f6                	test   %esi,%esi
  fa:	7e 14                	jle    110 <cpuBound_FCFS+0x20>
  fc:	31 db                	xor    %ebx,%ebx
  fe:	66 90                	xchg   %ax,%ax
    int pid = fork();
 100:	e8 26 03 00 00       	call   42b <fork>
    if (pid == 0)
 105:	85 c0                	test   %eax,%eax
 107:	74 15                	je     11e <cpuBound_FCFS+0x2e>
  for (int i = 0; i < n; i++)
 109:	83 c3 01             	add    $0x1,%ebx
 10c:	39 de                	cmp    %ebx,%esi
 10e:	75 f0                	jne    100 <cpuBound_FCFS+0x10>
  while (wait() != -1)
 110:	e8 26 03 00 00       	call   43b <wait>
 115:	83 f8 ff             	cmp    $0xffffffff,%eax
 118:	75 f6                	jne    110 <cpuBound_FCFS+0x20>
}
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    
      for (double z = 0; z < 1000000.0; z += 0.01)
 11e:	d9 ee                	fldz   
 120:	dd 05 10 09 00 00    	fldl   0x910
 126:	dc c1                	fadd   %st,%st(1)
 128:	d9 05 18 09 00 00    	flds   0x918
 12e:	df f2                	fcomip %st(2),%st
 130:	77 f4                	ja     126 <cpuBound_FCFS+0x36>
 132:	dd d8                	fstp   %st(0)
 134:	dd d8                	fstp   %st(0)
      exit(); //bye bye
 136:	e8 f8 02 00 00       	call   433 <exit>
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <IoBound>:
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	83 ec 1c             	sub    $0x1c,%esp
 149:	8b 75 08             	mov    0x8(%ebp),%esi
  for (int i = 0; i < n; i++)
 14c:	85 f6                	test   %esi,%esi
 14e:	7e 20                	jle    170 <IoBound+0x30>
 150:	31 ff                	xor    %edi,%edi
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int pid = fork();
 158:	e8 ce 02 00 00       	call   42b <fork>
 15d:	89 c3                	mov    %eax,%ebx
    if (pid == 0)
 15f:	85 c0                	test   %eax,%eax
 161:	74 1f                	je     182 <IoBound+0x42>
  for (int i = 0; i < n; i++)
 163:	83 c7 01             	add    $0x1,%edi
 166:	39 fe                	cmp    %edi,%esi
 168:	75 ee                	jne    158 <IoBound+0x18>
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while (wait() != -1)
 170:	e8 c6 02 00 00       	call   43b <wait>
 175:	83 f8 ff             	cmp    $0xffffffff,%eax
 178:	75 f6                	jne    170 <IoBound+0x30>
}
 17a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17d:	5b                   	pop    %ebx
 17e:	5e                   	pop    %esi
 17f:	5f                   	pop    %edi
 180:	5d                   	pop    %ebp
 181:	c3                   	ret    
        sleep((10 * (n - i)) % 3 + 1);
 182:	29 fe                	sub    %edi,%esi
 184:	ba 56 55 55 55       	mov    $0x55555556,%edx
 189:	8d 34 b6             	lea    (%esi,%esi,4),%esi
 18c:	01 f6                	add    %esi,%esi
 18e:	89 f0                	mov    %esi,%eax
 190:	89 f1                	mov    %esi,%ecx
 192:	f7 ea                	imul   %edx
 194:	c1 f9 1f             	sar    $0x1f,%ecx
 197:	89 d0                	mov    %edx,%eax
 199:	29 c8                	sub    %ecx,%eax
 19b:	8d 04 40             	lea    (%eax,%eax,2),%eax
 19e:	29 c6                	sub    %eax,%esi
      for (int k = 0; k < i * 100 + 1; k++)
 1a0:	6b c7 64             	imul   $0x64,%edi,%eax
        sleep((10 * (n - i)) % 3 + 1);
 1a3:	83 c6 01             	add    $0x1,%esi
 1a6:	83 c0 01             	add    $0x1,%eax
 1a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1ac:	83 ec 0c             	sub    $0xc,%esp
      for (int k = 0; k < i * 100 + 1; k++)
 1af:	83 c3 01             	add    $0x1,%ebx
        sleep((10 * (n - i)) % 3 + 1);
 1b2:	56                   	push   %esi
 1b3:	e8 1b 03 00 00       	call   4d3 <sleep>
      for (int k = 0; k < i * 100 + 1; k++)
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
 1be:	75 ec                	jne    1ac <IoBound+0x6c>
       printf(1, "Process: %d Finished\n", i);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	57                   	push   %edi
 1c4:	68 c8 08 00 00       	push   $0x8c8
 1c9:	6a 01                	push   $0x1
 1cb:	e8 d0 03 00 00       	call   5a0 <printf>
      exit(); //bye bye
 1d0:	e8 5e 02 00 00       	call   433 <exit>
 1d5:	66 90                	xchg   %ax,%ax
 1d7:	66 90                	xchg   %ax,%ax
 1d9:	66 90                	xchg   %ax,%ax
 1db:	66 90                	xchg   %ax,%ax
 1dd:	66 90                	xchg   %ax,%ax
 1df:	90                   	nop

000001e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1e1:	31 c0                	xor    %eax,%eax
{
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	53                   	push   %ebx
 1e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1f7:	83 c0 01             	add    $0x1,%eax
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strcpy+0x10>
    ;
  return os;
}
 1fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 201:	89 c8                	mov    %ecx,%eax
 203:	c9                   	leave  
 204:	c3                   	ret    
 205:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
 217:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 21a:	0f b6 02             	movzbl (%edx),%eax
 21d:	84 c0                	test   %al,%al
 21f:	75 17                	jne    238 <strcmp+0x28>
 221:	eb 3a                	jmp    25d <strcmp+0x4d>
 223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 227:	90                   	nop
 228:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 22c:	83 c2 01             	add    $0x1,%edx
 22f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 232:	84 c0                	test   %al,%al
 234:	74 1a                	je     250 <strcmp+0x40>
    p++, q++;
 236:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 238:	0f b6 19             	movzbl (%ecx),%ebx
 23b:	38 c3                	cmp    %al,%bl
 23d:	74 e9                	je     228 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 23f:	29 d8                	sub    %ebx,%eax
}
 241:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 244:	c9                   	leave  
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 250:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 254:	31 c0                	xor    %eax,%eax
 256:	29 d8                	sub    %ebx,%eax
}
 258:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 25b:	c9                   	leave  
 25c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 25d:	0f b6 19             	movzbl (%ecx),%ebx
 260:	31 c0                	xor    %eax,%eax
 262:	eb db                	jmp    23f <strcmp+0x2f>
 264:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 276:	80 3a 00             	cmpb   $0x0,(%edx)
 279:	74 15                	je     290 <strlen+0x20>
 27b:	31 c0                	xor    %eax,%eax
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c0 01             	add    $0x1,%eax
 283:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 287:	89 c1                	mov    %eax,%ecx
 289:	75 f5                	jne    280 <strlen+0x10>
    ;
  return n;
}
 28b:	89 c8                	mov    %ecx,%eax
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    
 28f:	90                   	nop
  for(n = 0; s[n]; n++)
 290:	31 c9                	xor    %ecx,%ecx
}
 292:	5d                   	pop    %ebp
 293:	89 c8                	mov    %ecx,%eax
 295:	c3                   	ret    
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi

000002a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld    
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2b5:	89 d0                	mov    %edx,%eax
 2b7:	c9                   	leave  
 2b8:	c3                   	ret    
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ca:	0f b6 10             	movzbl (%eax),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	75 12                	jne    2e3 <strchr+0x23>
 2d1:	eb 1d                	jmp    2f0 <strchr+0x30>
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2dc:	83 c0 01             	add    $0x1,%eax
 2df:	84 d2                	test   %dl,%dl
 2e1:	74 0d                	je     2f0 <strchr+0x30>
    if(*s == c)
 2e3:	38 d1                	cmp    %dl,%cl
 2e5:	75 f1                	jne    2d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2e7:	5d                   	pop    %ebp
 2e8:	c3                   	ret    
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2f0:	31 c0                	xor    %eax,%eax
}
 2f2:	5d                   	pop    %ebp
 2f3:	c3                   	ret    
 2f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <gets>:

char*
gets(char *buf, int max)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 305:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 308:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 309:	31 db                	xor    %ebx,%ebx
{
 30b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 30e:	eb 27                	jmp    337 <gets+0x37>
    cc = read(0, &c, 1);
 310:	83 ec 04             	sub    $0x4,%esp
 313:	6a 01                	push   $0x1
 315:	57                   	push   %edi
 316:	6a 00                	push   $0x0
 318:	e8 3e 01 00 00       	call   45b <read>
    if(cc < 1)
 31d:	83 c4 10             	add    $0x10,%esp
 320:	85 c0                	test   %eax,%eax
 322:	7e 1d                	jle    341 <gets+0x41>
      break;
    buf[i++] = c;
 324:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 328:	8b 55 08             	mov    0x8(%ebp),%edx
 32b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 32f:	3c 0a                	cmp    $0xa,%al
 331:	74 1d                	je     350 <gets+0x50>
 333:	3c 0d                	cmp    $0xd,%al
 335:	74 19                	je     350 <gets+0x50>
  for(i=0; i+1 < max; ){
 337:	89 de                	mov    %ebx,%esi
 339:	83 c3 01             	add    $0x1,%ebx
 33c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 33f:	7c cf                	jl     310 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 348:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34b:	5b                   	pop    %ebx
 34c:	5e                   	pop    %esi
 34d:	5f                   	pop    %edi
 34e:	5d                   	pop    %ebp
 34f:	c3                   	ret    
  buf[i] = '\0';
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	89 de                	mov    %ebx,%esi
 355:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 359:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35c:	5b                   	pop    %ebx
 35d:	5e                   	pop    %esi
 35e:	5f                   	pop    %edi
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	6a 00                	push   $0x0
 37a:	ff 75 08             	push   0x8(%ebp)
 37d:	e8 01 01 00 00       	call   483 <open>
  if(fd < 0)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	78 27                	js     3b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 389:	83 ec 08             	sub    $0x8,%esp
 38c:	ff 75 0c             	push   0xc(%ebp)
 38f:	89 c3                	mov    %eax,%ebx
 391:	50                   	push   %eax
 392:	e8 04 01 00 00       	call   49b <fstat>
  close(fd);
 397:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 39a:	89 c6                	mov    %eax,%esi
  close(fd);
 39c:	e8 ca 00 00 00       	call   46b <close>
  return r;
 3a1:	83 c4 10             	add    $0x10,%esp
}
 3a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a7:	89 f0                	mov    %esi,%eax
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b5:	eb ed                	jmp    3a4 <stat+0x34>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <atoi>:

int
atoi(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c7:	0f be 02             	movsbl (%edx),%eax
 3ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3d5:	77 1e                	ja     3f5 <atoi+0x35>
 3d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ea:	0f be 02             	movsbl (%edx),%eax
 3ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3f0:	80 fb 09             	cmp    $0x9,%bl
 3f3:	76 eb                	jbe    3e0 <atoi+0x20>
  return n;
}
 3f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f8:	89 c8                	mov    %ecx,%eax
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 45 10             	mov    0x10(%ebp),%eax
 407:	8b 55 08             	mov    0x8(%ebp),%edx
 40a:	56                   	push   %esi
 40b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 40e:	85 c0                	test   %eax,%eax
 410:	7e 13                	jle    425 <memmove+0x25>
 412:	01 d0                	add    %edx,%eax
  dst = vdst;
 414:	89 d7                	mov    %edx,%edi
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 420:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 421:	39 f8                	cmp    %edi,%eax
 423:	75 fb                	jne    420 <memmove+0x20>
  return vdst;
}
 425:	5e                   	pop    %esi
 426:	89 d0                	mov    %edx,%eax
 428:	5f                   	pop    %edi
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    

0000042b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42b:	b8 01 00 00 00       	mov    $0x1,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <exit>:
SYSCALL(exit)
 433:	b8 02 00 00 00       	mov    $0x2,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <wait>:
SYSCALL(wait)
 43b:	b8 03 00 00 00       	mov    $0x3,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <waitx>:
SYSCALL(waitx)
 443:	b8 16 00 00 00       	mov    $0x16,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <getprocstable>:
SYSCALL(getprocstable)
 44b:	b8 18 00 00 00       	mov    $0x18,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <pipe>:
SYSCALL(pipe)
 453:	b8 04 00 00 00       	mov    $0x4,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <read>:
SYSCALL(read)
 45b:	b8 05 00 00 00       	mov    $0x5,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <write>:
SYSCALL(write)
 463:	b8 10 00 00 00       	mov    $0x10,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <close>:
SYSCALL(close)
 46b:	b8 15 00 00 00       	mov    $0x15,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <kill>:
SYSCALL(kill)
 473:	b8 06 00 00 00       	mov    $0x6,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <exec>:
SYSCALL(exec)
 47b:	b8 07 00 00 00       	mov    $0x7,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <open>:
SYSCALL(open)
 483:	b8 0f 00 00 00       	mov    $0xf,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <mknod>:
SYSCALL(mknod)
 48b:	b8 11 00 00 00       	mov    $0x11,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <unlink>:
SYSCALL(unlink)
 493:	b8 12 00 00 00       	mov    $0x12,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <fstat>:
SYSCALL(fstat)
 49b:	b8 08 00 00 00       	mov    $0x8,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <link>:
SYSCALL(link)
 4a3:	b8 13 00 00 00       	mov    $0x13,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <mkdir>:
SYSCALL(mkdir)
 4ab:	b8 14 00 00 00       	mov    $0x14,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <chdir>:
SYSCALL(chdir)
 4b3:	b8 09 00 00 00       	mov    $0x9,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <dup>:
SYSCALL(dup)
 4bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <getpid>:
SYSCALL(getpid)
 4c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <sbrk>:
SYSCALL(sbrk)
 4cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <sleep>:
SYSCALL(sleep)
 4d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <uptime>:
SYSCALL(uptime)
 4db:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <set_priority>:
SYSCALL(set_priority)
 4e3:	b8 17 00 00 00       	mov    $0x17,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    
 4eb:	66 90                	xchg   %ax,%ax
 4ed:	66 90                	xchg   %ax,%ax
 4ef:	90                   	nop

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
 4f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4fc:	89 d1                	mov    %edx,%ecx
{
 4fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 501:	85 d2                	test   %edx,%edx
 503:	0f 89 7f 00 00 00    	jns    588 <printint+0x98>
 509:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 50d:	74 79                	je     588 <printint+0x98>
    neg = 1;
 50f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 516:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 518:	31 db                	xor    %ebx,%ebx
 51a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 c8                	mov    %ecx,%eax
 522:	31 d2                	xor    %edx,%edx
 524:	89 cf                	mov    %ecx,%edi
 526:	f7 75 c4             	divl   -0x3c(%ebp)
 529:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 530:	89 45 c0             	mov    %eax,-0x40(%ebp)
 533:	89 d8                	mov    %ebx,%eax
 535:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 538:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 53b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 53e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 541:	76 dd                	jbe    520 <printint+0x30>
  if(neg)
 543:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 546:	85 c9                	test   %ecx,%ecx
 548:	74 0c                	je     556 <printint+0x66>
    buf[i++] = '-';
 54a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 54f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 551:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 556:	8b 7d b8             	mov    -0x48(%ebp),%edi
 559:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 55d:	eb 07                	jmp    566 <printint+0x76>
 55f:	90                   	nop
    putc(fd, buf[i]);
 560:	0f b6 13             	movzbl (%ebx),%edx
 563:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 566:	83 ec 04             	sub    $0x4,%esp
 569:	88 55 d7             	mov    %dl,-0x29(%ebp)
 56c:	6a 01                	push   $0x1
 56e:	56                   	push   %esi
 56f:	57                   	push   %edi
 570:	e8 ee fe ff ff       	call   463 <write>
  while(--i >= 0)
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 de                	cmp    %ebx,%esi
 57a:	75 e4                	jne    560 <printint+0x70>
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 58f:	eb 87                	jmp    518 <printint+0x28>
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 13             	movzbl (%ebx),%edx
 5b2:	84 d2                	test   %dl,%dl
 5b4:	74 6a                	je     620 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5b6:	8d 45 10             	lea    0x10(%ebp),%eax
 5b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c4:	eb 36                	jmp    5fc <printf+0x5c>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	74 15                	je     5f2 <printf+0x52>
  write(fd, &c, 1);
 5dd:	83 ec 04             	sub    $0x4,%esp
 5e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5e3:	6a 01                	push   $0x1
 5e5:	57                   	push   %edi
 5e6:	56                   	push   %esi
 5e7:	e8 77 fe ff ff       	call   463 <write>
 5ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5f2:	0f b6 13             	movzbl (%ebx),%edx
 5f5:	83 c3 01             	add    $0x1,%ebx
 5f8:	84 d2                	test   %dl,%dl
 5fa:	74 24                	je     620 <printf+0x80>
    c = fmt[i] & 0xff;
 5fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5ff:	85 c9                	test   %ecx,%ecx
 601:	74 cd                	je     5d0 <printf+0x30>
      }
    } else if(state == '%'){
 603:	83 f9 25             	cmp    $0x25,%ecx
 606:	75 ea                	jne    5f2 <printf+0x52>
      if(c == 'd'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	0f 84 07 01 00 00    	je     718 <printf+0x178>
 611:	83 e8 63             	sub    $0x63,%eax
 614:	83 f8 15             	cmp    $0x15,%eax
 617:	77 17                	ja     630 <printf+0x90>
 619:	ff 24 85 24 09 00 00 	jmp    *0x924(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret    
 628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 636:	6a 01                	push   $0x1
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63e:	e8 20 fe ff ff       	call   463 <write>
        putc(fd, c);
 643:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 647:	83 c4 0c             	add    $0xc,%esp
 64a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 64d:	6a 01                	push   $0x1
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	e8 0d fe ff ff       	call   463 <write>
        putc(fd, c);
 656:	83 c4 10             	add    $0x10,%esp
      state = 0;
 659:	31 c9                	xor    %ecx,%ecx
 65b:	eb 95                	jmp    5f2 <printf+0x52>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 66d:	8b 10                	mov    (%eax),%edx
 66f:	89 f0                	mov    %esi,%eax
 671:	e8 7a fe ff ff       	call   4f0 <printint>
        ap++;
 676:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 67a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67d:	31 c9                	xor    %ecx,%ecx
 67f:	e9 6e ff ff ff       	jmp    5f2 <printf+0x52>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68b:	8b 10                	mov    (%eax),%edx
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 693:	85 d2                	test   %edx,%edx
 695:	0f 84 8d 00 00 00    	je     728 <printf+0x188>
        while(*s != 0){
 69b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 69e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6a0:	84 c0                	test   %al,%al
 6a2:	0f 84 4a ff ff ff    	je     5f2 <printf+0x52>
 6a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6ab:	89 d3                	mov    %edx,%ebx
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6b3:	83 c3 01             	add    $0x1,%ebx
 6b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	57                   	push   %edi
 6bc:	56                   	push   %esi
 6bd:	e8 a1 fd ff ff       	call   463 <write>
        while(*s != 0){
 6c2:	0f b6 03             	movzbl (%ebx),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
      state = 0;
 6cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6cf:	31 c9                	xor    %ecx,%ecx
 6d1:	e9 1c ff ff ff       	jmp    5f2 <printf+0x52>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 7b ff ff ff       	jmp    66a <printf+0xca>
 6ef:	90                   	nop
        putc(fd, *ap);
 6f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
 6fa:	57                   	push   %edi
 6fb:	56                   	push   %esi
        putc(fd, *ap);
 6fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6ff:	e8 5f fd ff ff       	call   463 <write>
        ap++;
 704:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 708:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70b:	31 c9                	xor    %ecx,%ecx
 70d:	e9 e0 fe ff ff       	jmp    5f2 <printf+0x52>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 718:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 71b:	83 ec 04             	sub    $0x4,%esp
 71e:	e9 2a ff ff ff       	jmp    64d <printf+0xad>
 723:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 727:	90                   	nop
          s = "(null)";
 728:	ba 1c 09 00 00       	mov    $0x91c,%edx
        while(*s != 0){
 72d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 730:	b8 28 00 00 00       	mov    $0x28,%eax
 735:	89 d3                	mov    %edx,%ebx
 737:	e9 74 ff ff ff       	jmp    6b0 <printf+0x110>
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 b4 0c 00 00       	mov    0xcb4,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	89 c2                	mov    %eax,%edx
 75a:	8b 00                	mov    (%eax),%eax
 75c:	39 ca                	cmp    %ecx,%edx
 75e:	73 30                	jae    790 <free+0x50>
 760:	39 c1                	cmp    %eax,%ecx
 762:	72 04                	jb     768 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 764:	39 c2                	cmp    %eax,%edx
 766:	72 f0                	jb     758 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	74 30                	je     7a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 772:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 775:	8b 42 04             	mov    0x4(%edx),%eax
 778:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 77b:	39 f1                	cmp    %esi,%ecx
 77d:	74 3a                	je     7b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 77f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 781:	5b                   	pop    %ebx
  freep = p;
 782:	89 15 b4 0c 00 00    	mov    %edx,0xcb4
}
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 c2                	cmp    %eax,%edx
 792:	72 c4                	jb     758 <free+0x18>
 794:	39 c1                	cmp    %eax,%ecx
 796:	73 c0                	jae    758 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 f8                	cmp    %edi,%eax
 7a0:	75 d0                	jne    772 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7a2:	03 70 04             	add    0x4(%eax),%esi
 7a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	8b 02                	mov    (%edx),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7af:	8b 42 04             	mov    0x4(%edx),%eax
 7b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	75 c6                	jne    77f <free+0x3f>
    p->s.size += bp->s.size;
 7b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7bc:	89 15 b4 0c 00 00    	mov    %edx,0xcb4
    p->s.size += bp->s.size;
 7c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7c8:	89 0a                	mov    %ecx,(%edx)
}
 7ca:	5b                   	pop    %ebx
 7cb:	5e                   	pop    %esi
 7cc:	5f                   	pop    %edi
 7cd:	5d                   	pop    %ebp
 7ce:	c3                   	ret    
 7cf:	90                   	nop

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 3d b4 0c 00 00    	mov    0xcb4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 70 07             	lea    0x7(%eax),%esi
 7e5:	c1 ee 03             	shr    $0x3,%esi
 7e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7eb:	85 ff                	test   %edi,%edi
 7ed:	0f 84 9d 00 00 00    	je     890 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7f8:	39 f1                	cmp    %esi,%ecx
 7fa:	73 6a                	jae    866 <malloc+0x96>
 7fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 801:	39 de                	cmp    %ebx,%esi
 803:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 806:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 810:	eb 17                	jmp    829 <malloc+0x59>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 81a:	8b 48 04             	mov    0x4(%eax),%ecx
 81d:	39 f1                	cmp    %esi,%ecx
 81f:	73 4f                	jae    870 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 821:	8b 3d b4 0c 00 00    	mov    0xcb4,%edi
 827:	89 c2                	mov    %eax,%edx
 829:	39 d7                	cmp    %edx,%edi
 82b:	75 eb                	jne    818 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	ff 75 e4             	push   -0x1c(%ebp)
 833:	e8 93 fc ff ff       	call   4cb <sbrk>
  if(p == (char*)-1)
 838:	83 c4 10             	add    $0x10,%esp
 83b:	83 f8 ff             	cmp    $0xffffffff,%eax
 83e:	74 1c                	je     85c <malloc+0x8c>
  hp->s.size = nu;
 840:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 843:	83 ec 0c             	sub    $0xc,%esp
 846:	83 c0 08             	add    $0x8,%eax
 849:	50                   	push   %eax
 84a:	e8 f1 fe ff ff       	call   740 <free>
  return freep;
 84f:	8b 15 b4 0c 00 00    	mov    0xcb4,%edx
      if((p = morecore(nunits)) == 0)
 855:	83 c4 10             	add    $0x10,%esp
 858:	85 d2                	test   %edx,%edx
 85a:	75 bc                	jne    818 <malloc+0x48>
        return 0;
  }
}
 85c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 85f:	31 c0                	xor    %eax,%eax
}
 861:	5b                   	pop    %ebx
 862:	5e                   	pop    %esi
 863:	5f                   	pop    %edi
 864:	5d                   	pop    %ebp
 865:	c3                   	ret    
    if(p->s.size >= nunits){
 866:	89 d0                	mov    %edx,%eax
 868:	89 fa                	mov    %edi,%edx
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 870:	39 ce                	cmp    %ecx,%esi
 872:	74 4c                	je     8c0 <malloc+0xf0>
        p->s.size -= nunits;
 874:	29 f1                	sub    %esi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 87c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 87f:	89 15 b4 0c 00 00    	mov    %edx,0xcb4
}
 885:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 888:	83 c0 08             	add    $0x8,%eax
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 b4 0c 00 00 b8 	movl   $0xcb8,0xcb4
 897:	0c 00 00 
    base.s.size = 0;
 89a:	bf b8 0c 00 00       	mov    $0xcb8,%edi
    base.s.ptr = freep = prevp = &base;
 89f:	c7 05 b8 0c 00 00 b8 	movl   $0xcb8,0xcb8
 8a6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8ab:	c7 05 bc 0c 00 00 00 	movl   $0x0,0xcbc
 8b2:	00 00 00 
    if(p->s.size >= nunits){
 8b5:	e9 42 ff ff ff       	jmp    7fc <malloc+0x2c>
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b9                	jmp    87f <malloc+0xaf>
