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
