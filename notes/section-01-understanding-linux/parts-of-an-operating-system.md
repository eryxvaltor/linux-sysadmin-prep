# Various Parts of an Operating System

UNIX and "UNIX-like" operating systems (such as Linux) consist of a **kernel** and some **system programs**. There are also **application programs** for doing work.

## Kernel vs Operating System

The kernel is the heart of the OS. It is often mistakenly considered to be the operating system itself, but it is not. An OS provides many more services than a plain kernel.

The OS:

- Keeps track of files on the disk
- Starts programs and runs them concurrently
- Assigns memory and other resources to processes
- Receives packets from and sends packets to the network

The kernel does very little by itself, but provides the **tools** with which all services are built. The tools are used via **system calls**.

It also prevents anyone from accessing the hardware directly, forcing everyone to use its tools. This gives users some protection from each other.

## System Programs vs Application Programs

System programs use the tools the kernel provides to implement the services an OS needs. System programs and all other programs run **on top of the kernel**, in what is called **user mode**.

|Type|Intent|Example|
|---|---|---|
|Application program|Getting useful things done (or playing, if it's a game)|Word processor|
|System program|Needed to get the system working|`mount`|

The difference is often blurry and matters only to "compulsive categorizers".

An OS can also contain:

- Compilers and their libraries (GCC and the C library under Linux), though not all programming languages need to be part of the OS
- Documentation
- Sometimes even games

## Important Parts of the Kernel

|Part|
|---|
|Process management|
|Memory management|
|Hardware device drivers|
|Filesystem drivers|
|Network management|
|Various other bits and pieces|

### Kernel Structure

```
User level programs                         (normal programs)
─────────────────────────────────────────────────────────────
System call interface                       (kernel)
   │
   ├── Virtual filesystem management ──► Various filesystem drivers
   │                                         ├── IDE hard disk driver ──► IDE hard disk
   │                                         └── Floppy disk driver  ──► Floppy disk
   ├── Memory manager
   ├── Process manager
   └── Abstract network services (sockets) ──► TCP/IP protocol drivers
                                                  └── Ethernet card driver ──► Ethernet card
─────────────────────────────────────────────────────────────
Hardware
```

### Memory and Process Management

Probably the most important parts: nothing else works without them.

|Part|What it does|
|---|---|
|Memory management|Assigns memory areas and swap space areas to processes, parts of the kernel, and the buffer cache|
|Process management|Creates processes and implements multitasking by switching the active process on the processor|

### Hardware Device Drivers

At the lowest level, the kernel has a **device driver for each kind of hardware** it supports. The world has many kinds of hardware, so there are many drivers.

Similar hardware often differs only in how software controls it. So drivers are grouped into **general classes**:

- Each member of a class has the **same interface** to the rest of the kernel
- Each member differs in what it needs to do to implement the operations

Example: all disk drivers look alike to the rest of the kernel. They all have operations like:

|Operation|
|---|
|Initialize the drive|
|Read sector N|
|Write sector N|
