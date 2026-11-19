# Introduction to Linux

## What is an Operating System?

**As per Wikipedia:** system software that manages computer hardware and software resources, and provides common services for computer programs.

**In simple words:** software that acts as a middleman or bridge between computer hardware and the computer user. It provides a user interface and controls the hardware so that software can function.

### Types of Operating Systems

|Type|Examples|
|---|---|
|Desktop|Microsoft Windows, macOS, Linux such as Ubuntu|
|Server|Windows Server, Linux distributions like CentOS, Red Hat Enterprise Linux|
|Mobile|Android, iOS, Windows Mobile|
|Embedded|Devices like routers, smart TVs, automobiles, home appliances|
|Real-Time (RTOS)|Critical systems like medical equipment, car ECUs, aerospace, defense, network firewalls, home security systems|

## What is Linux?

- A free and open-source operating system
- Similar to Windows and macOS, but different in several ways
- Very popular for stability, security and flexibility
- Can be modified and distributed by anyone, which led to many versions called **distributions**, each tailored for different uses
- Open-source nature means a community of developers and users contribute to its development

## Linux vs Unix

|Aspect|Unix|Linux|
|---|---|---|
|Origin|1970s at AT&T's Bell Labs, by Ken Thompson, Dennis Ritchie and others|Early 1990s, by Linus Torvalds. Free and open-source, so its source code can be used, modified and distributed by anyone|
|Distributions|Solaris, HP-UX, AIX, BSD etc.|Red Hat, CentOS, Fedora, Ubuntu, SUSE, Kali etc.|
|Licensing and cost|Generally requires a paid license, especially for commercial use|Free to use, modify and distribute|
|Community and development|Development and updates controlled by the owning organization|Maintained and developed by a global community of developers|
|Hardware support|Traditionally supports less hardware variety|Broad hardware support, from traditional PCs and servers to embedded devices|

## Linux Flavors

"Linux flavors" = "Linux distributions" = "distros" for short.

|Distros|
|---|
|Ubuntu|
|Fedora|
|Debian|
|Red Hat Enterprise Linux (RHEL)|
|CentOS|
|Arch Linux|
|openSUSE|
|Linux Mint|
|Gentoo|
|Slackware|
|Alpine Linux|
|Kali Linux|

## Linux Users

Linux is used by a wide range of users and organizations because of its versatility, stability and open-source nature.

|Users|
|---|
|Developers|
|Educational institutions|
|Government agencies|
|Enterprise and businesses|
|Tech companies|
|Cloud and web servers|
|Supercomputers and research facilities|
|Telecommunications and networking|
|Media and entertainment|

## Linux vs Windows

|Feature|Linux|Windows|
|---|---|---|
|Price|Free|Paid ($$$)|
|Ease|Not user-friendly|User friendly|
|Reliability|Very reliable, often runs for months or years|Often requires reboot|
|Software|Mostly enterprise-level software|Much larger selection, e.g. office, games, utilities|
|Multi-tasking|Best for multi-tasking|Available, but with very high CPU or memory resources|
|Security|Very secure|Somewhat secure|
|Open source|Open to public|Not an open source OS|

# History of Unix/Linux

## Timeline Tree

```
Unix
│
├── 1965 — Multics
│   ├── Bell Laboratories joins MIT and General Electric
│   └── Goal: multi-user, multi-processor, multi-level (hierarchical) file system
│
├── 1969 — Unix is born
│   ├── AT&T drops out of Multics, unhappy with progress
│   ├── Ken Thompson, Dennis Ritchie, Rudd Canaday, Doug McIlroy
│   ├── First Unix File System on a PDP-7, plus a few utilities
│   └── Named UNIX by Brian Kernighan, a pun on Multics
│
├── 1971 — Unix on PDP-11
│   ├── 16 KB memory (8 KB for user programs), 512 KB disk
│   └── First real use: text processing for the Bell Labs patent department
│
├── 1973 — Rewritten in C
│   ├── C developed by Dennis Ritchie
│   └── High-level language greatly reduced the effort to port to new machines
│
├── 1974 — ACM paper
│   ├── Thompson and Ritchie publish in Communications of the ACM
│   ├── Enthusiasm in academia, seen as a great teaching tool
│   └── AT&T blocked from marketing it (1956 Consent Decree), so it licenses to universities and commercial entities
│
├── 1977 — About 500 Unix sites worldwide
│
├── 1980 — BSD 4.1 (Berkeley Software Development)
│
├── 1983 — SunOS, BSD 4.2, SysV
│
├── 1984 — About 100,000 Unix sites on many different hardware platforms
│
├── 1988 — System V Release 4 (SVR4)
│   ├── Jointly developed by AT&T and Sun Microsystems
│   └── Later became UnixWare and Solaris 2
│
├── 1993 — Novell buys UNIX from AT&T
│
├── 1994 — Novell gives the name "UNIX" to X/OPEN
│
├── 1995 — Santa Cruz Operations buys UnixWare from Novell
│   └── SCO and Hewlett-Packard announce a joint 64-bit Unix
│
└── 1996 — IDC forecasts 3 million Unix systems shipped worldwide in 1997
```

## Multics

Started in 1965 by Bell Laboratories, MIT and General Electric.

Planned forward-looking features:

|Feature|Meaning|
|---|---|
|Multi-user|Many users on the same system|
|Multi-processor|Support for more than one processor|
|Multi-level file system|Hierarchical file system|

AT&T was unhappy with progress and dropped out in 1969.

## Birth of Unix

|Item|Detail|
|---|---|
|Year|1969|
|Creators|Ken Thompson, Dennis Ritchie, Rudd Canaday, Doug McIlroy|
|Hardware|PDP-7|
|First version|Unix File System plus a few utilities|
|Name given by|Brian Kernighan, a pun on Multics|

## Early Growth

|Year|Event|
|---|---|
|1971|Runs on a PDP-11 with 16 KB memory (8 KB for user programs) and a 512 KB disk|
|1971|First real use: text processing for the Bell Labs patent department, which justified further R&D|
|1973|Rewritten mostly in C by Dennis Ritchie, making porting far easier|
|1974|ACM paper by Thompson and Ritchie sparks interest in academia|

## The reason for Unix Caught On

Unix caught on among programmers because it was designed with these features:

|Feature|
|---|
|Programmer's environment|
|Simple user interface|
|Simple utilities that can be combined to perform powerful functions|
|Hierarchical file system|
|Simple interface to devices, consistent with file format|
|Multi-user, multi-process system|
|Architecture independent and transparent to the user|

## Licensing

AT&T was prevented from marketing the product because of the **1956 Consent Decree**. So it licensed Unix to **universities for educational purposes** and to **commercial entities**.

## Spread and Variants

|Year|Event|
|---|---|
|1977|About 500 Unix sites worldwide|
|1980|BSD 4.1|
|1983|SunOS, BSD 4.2, SysV|
|1984|About 100,000 sites on many hardware platforms of vastly different capabilities|
|1988|SVR4, jointly by AT&T and Sun, later UnixWare and Solaris 2|

## Ownership Changes

|Year|Event|
|---|---|
|1993|Novell buys UNIX from AT&T|
|1994|Novell gives the name "UNIX" to X/OPEN|
|1995|Santa Cruz Operations buys UnixWare from Novell|
|1995|SCO and Hewlett-Packard announce joint development of a 64-bit Unix|
|1996|IDC forecasts 3 million Unix systems shipped worldwide in 1997|

# Operating System

## What is an OS?

An operating system (OS) is a software program that lets the computer hardware communicate and operate with the computer software. Without one, a computer and its software programs would be useless.

It is the program that, after being loaded into the computer by a boot program, **manages all the other programs** in the computer. Those other programs are called **applications** or application programs.

```
User
  │   command language or GUI
  ▼
Applications
  │   requests through an API
  ▼
Operating System
  │
  ▼
Hardware
```

|Term|Meaning|
|---|---|
|Application programs|Programs managed by the OS|
|API (application program interface)|Defined way for applications to request services from the OS|
|User interface|Way for users to interact directly with the OS: a command language or a GUI|

## Services an OS Provides

|Service|What it does|
|---|---|
|Scheduling|In a multitasking OS, decides which applications run in what order and how much time each gets before the next one has a turn|
|Memory management|Manages the sharing of internal memory among multiple applications|
|Input/output|Handles input and output to and from attached hardware such as hard disks, printers and dial-up ports|
|Status and errors|Sends messages to each application or interactive user (or system operator) about the status of operation and any errors|
|Batch jobs|Can offload the management of batch jobs (for example printing) so the initiating application is freed from that work|
|Parallel processing|On computers that support it, manages how to divide a program so it runs on more than one processor at a time|

## Examples of Operating Systems

|OS|Notes|
|---|---|
|Red Hat|Very popular Linux operating system from Red Hat|
|Microsoft Windows|PC and IBM-compatible OS, the most commonly found and used OS on PCs|
|Apple macOS|Apple computer operating system, the only one for Apple computers|
|Ubuntu Linux|Popular Linux variant used with PC and IBM-compatible computers|
|Google Android|OS used with Android-compatible phones|
|iOS|OS used with the Apple iPhone|

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

# Inside Linux: Kernel, Shell and Utilities

```
User
  │
  ▼
Utilities (commands)  ──►  Shell (command interpreter)  ──►  Kernel  ──►  Hardware
```

## Kernel

The core of the UNIX system.

- Loaded at system start up (boot)
- A memory-resident control program
- Manages the entire resources of the system and presents them to you and every other user as a coherent system
- Provides services to user applications, such as device management and process scheduling

### Example Kernel Functions

|Function|What it does|
|---|---|
|Memory management|Manages the machine's memory and allocates it to each process|
|CPU scheduling|Schedules the CPU's work so each user's work is carried out as efficiently as possible|
|Data transfer|Moves data from one part of the machine to another|
|Shell instructions|Interprets and executes instructions from the shell|
|File permissions|Enforces file access permissions|

You don't need to know anything about the kernel to use a UNIX system. These details are for information only.

## Shell

Whenever you log in to a Unix system you are placed in a shell program. The shell's prompt is usually visible at the cursor's position on screen. You enter commands at this prompt to get your work done.

The shell is a **command interpreter**:

1. Takes each command
2. Passes it to the operating system kernel to be acted on
3. Displays the results on your screen

### Shell Choices

- Several shells are usually available on any UNIX system, each with its own strengths and weaknesses
- Different users may use different shells
- The system administrator supplies a default shell at first, which can be overridden or changed

|Shell|Command|
|---|---|
|Bourne shell|`sh`|
|C shell|`csh`|
|Korn shell|`ksh`|
|TC shell|`tcsh`|
|Bourne Again shell|`bash`|

### Shell Scripts

Each shell includes its own programming language. Command files, called **shell scripts**, are used to accomplish a series of tasks.

## Utilities

UNIX provides several hundred utility programs, often called **commands**.

They accomplish universal functions:

|Function|
|---|
|Editing|
|File maintenance|
|Printing|
|Sorting|
|Programming support|
|Online info|
|etc.|

Utilities are **modular**: single functions can be grouped to perform more complex tasks.

# Virtual Memory

## What is Virtual Memory?

Linux supports virtual memory: using a **disk as an extension of RAM**, so the effective size of usable memory grows.

How it works:

1. The kernel writes the contents of a currently unused block of memory to the hard disk
2. That memory can now be used for another purpose
3. When the original contents are needed again, they are read back into memory

All of this is **transparent to the user**. Programs only see the larger amount of memory and don't notice that parts of them sometimes reside on disk.

### Trade-off

Reading and writing the hard disk is on the order of **a thousand times slower** than real memory, so programs don't run as fast.

## Swap Space

The part of the hard disk used as virtual memory is called **swap space**.

Linux can use either:

|Option|Notes|
|---|---|
|Swap partition|Faster|
|Swap file (a normal file in the filesystem)|Easier to change the size, no need to repartition the whole disk and possibly reinstall everything|

### Which to Choose

|Situation|Choice|
|---|---|
|You know how much swap you need|Swap partition|
|You're uncertain|Start with a swap file, use the system for a while to get a feel for the amount, then make a swap partition once you're confident about the size|

### Multiple Swap Areas

Linux allows several swap partitions and/or swap files **at the same time**.

If you only occasionally need an unusual amount of swap, set up an extra swap file at such times instead of keeping the whole amount allocated all the time.

## Swapping vs Paging

Operating system terminology distinguishes two things:

|Term|Meaning|
|---|---|
|Swapping|Writing the **whole process** out to swap space|
|Paging|Writing only **fixed-size parts**, usually a few kilobytes, at a time|

Paging is usually more efficient, and that's what Linux does. Traditional Linux terminology still says "swapping" anyway.
