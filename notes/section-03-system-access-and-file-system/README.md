# System Access and File System

## Some Basic Info

- Linux has a super-user account called **root**. It is the most powerful account: it can create, modify and delete accounts and change system configuration files
- Linux is **case sensitive**: `ABC` is not the same as `abc`
- Avoid spaces when creating files and directories
- The Linux kernel is not the whole operating system. It is the small software inside Linux that takes commands from users and passes them to hardware or peripherals
- Linux is mostly CLI, not GUI
- Linux is very flexible compared to other operating systems

## Linux Structure

Linux is a layered operating system.

```
User programs
     │  system calls
     ▼
Kernel
     ▼
Hardware
```

- The innermost layer is the hardware
- The kernel interacts directly with the hardware and provides services to user programs
- User programs don't need to know anything about the hardware, only how to talk to the kernel
- Well-written user programs are independent of the hardware, so they port easily to new systems

### System Calls

User programs request kernel services through standard **system calls**. Examples:

- Open, close, read, write, link or execute a file
- Start or update accounting records
- Change ownership of a file or directory
- Change to a new directory
- Create, suspend or kill a process
- Enable access to hardware devices
- Set limits on system resources

### Multi-user, Multi-tasking

- Many users can be logged in at the same time, each running many programs
- The kernel keeps each process and user separate
- The kernel regulates access to CPU, memory, disk and other I/O devices

## Linux vs Windows (just a comparison for win user)

Which is better depends on your needs. The OS on your desktop has nothing to do with the OS your web host runs.

|Area|Linux|Windows|
|---|---|---|
|Stability|Handles high server load better, seldom needs reboots, very high uptime|Needs reboots more often|
|Performance|Comparable under low load, superior under high load|Comparable under low load|
|Scalability|Both adapt. Windows hosting is more easily made compatible with Linux-based features like PHP and MySQL|Better for .NET and VB development|
|Compatibility|Sites built for Linux can easily be hosted on Windows|Sites built for Windows are not always hosted on Linux|
|Price|Free to download, install and operate|Licenses for the OS and apps like SQL Server cost a lot|

Conclusion from the source: Linux hosting is more stable, faster and more compatible. Windows hosting is only needed for .NET, Visual Basic or similar tools. These are the source author's own experience-based claims.

## Access to a Linux System

There are two types of access.

|Type|Description|
|---|---|
|Console|Direct access to the OS through a connected display (VGA, HDMI, DVI etc.)|
|Remote|Connect to the OS over the network|

### Remote Access Methods

|Method|Notes|
|---|---|
|SSH|Linux to Linux, or from Windows 10+ and Mac using the built-in client|
|PuTTY|Windows to Linux client. Not needed on Windows 10 or newer, which has a built-in SSH client|
|RDP, sharing|Other remote options shown in the slide|

```bash
ssh 192.168.1.5
ssh -l username 192.168.1.5
```

- On a Mac, open Terminal and run `ssh -l iafzal 192.168.1.5`
- In PuTTY, enter the Linux machine's IP address (e.g. 192.168.1.5) and connect

### Finding the IP Address

- Newer CentOS may not have `ifconfig`, so use `ip addr`
- To get `ifconfig` on CentOS 7.5 or later: `yum install net-tools`

```bash
ip addr
yum install net-tools
```

## Command Prompts

A command prompt (prompt) is a short text at the start of the command line, followed by a prompt symbol.

```
username@hostname $
```

|Part|Meaning|
|---|---|
|username|Current user|
|hostname|Machine name|
|Prompt symbol|`$` or `%` for a normal user. Ready to accept commands|

To get your prompt back: `Ctrl + c`

## Logging On to the System

- You need a valid username and password before you can use the system
- The system administrator usually assigns the username and initial password
- The username (userid) is unique and should not change
- Initial passwords can be anything and should be changed after the first login

### To Log In

- Type your username at the login prompt, then press Enter. Linux is case sensitive: if the username is `kellyk`, don't type `KellyK`
- Type your password at the prompt. It is never displayed on screen and is case sensitive
- After login, many systems show a login banner or "message of the day". Read it, it may hold important system information
- Other systems configure your environment automatically and open windows for you
- You will see a shell prompt, usually `%` or `$`

### If Login Fails

- Typing error in the username or password
- Caps Lock is on
- Expired or invalid username or password, or security settings changed
- System problems

### Example Login

```
login: kellyk
kellyk's Password:
*****************************************
* Welcome to the Linux Systems Training Class
* System maintenance is scheduled today from 2:00
* until 4:00 pm EST
*****************************************
```

### Home Directory

- Each user has a unique home directory, the part of the file system reserved for your files
- After login you are placed in it automatically
- You control the files there and their access permissions
- Generally only you can create, delete or modify files in it. Others may be given read or execute permission
- On most systems you can move outside your home directory, depending on permissions set by others or the system administrator

## What is Root?

There are three meanings of "root" on a Linux system.

|Root|Meaning|
|---|---|
|Root account|Username on the machine. Most powerful account with access to all commands and files|
|Root as `/`|The very first directory in Linux, the root directory|
|Root home directory|`/root`, the home directory of the root account|

## Passwords

### Changing a Password

Change your initial password as soon as you log in. The command is `passwd`.

```bash
$ passwd
(current) LINUX password:
Enter new LINUX password:
Retype new LINUX password:
passwd: password updated successfully
```

- Typed characters are not displayed
- The new password is asked twice to catch typing errors
- If the old password is wrong or the two new entries differ, the password is not changed
- Some admins run checks that can reject a password that is too weak
- The encrypted password is stored in `/etc/shadow`

### Changing Another User's Password

Log in as root:

```bash
# passwd vivek
# passwd tom
```

## Filesystem

A filesystem is a system used by an operating system to manage files. It controls how data is saved and retrieved.

- The OS stores files and directories in an organized structure
- Example: system configuration files in one folder, user files in another, logs in another, commands and scripts in another
- There are many filesystem types, each improved over time and given a new name: ext3, ext4, xfs, NTFS, FAT etc.

## Linux File System

- A **file system** is a logical collection of files on a partition or disk
- A **partition** is a container for information. It can span an entire hard drive
- A partition usually contains one file system, e.g. one for `/` and another for `/home`
- One file system per partition makes maintenance and management easier
- **Everything in Linux is a file**, including DVD-ROMs, USB devices and floppy drives

### Directory Structure

Linux uses a hierarchical structure like an upside-down tree, with root (`/`) at the base.

A Linux filesystem:

- Has a root directory (`/`) that contains other files and directories
- Identifies each file or directory by its name, its directory and a unique identifier called an **inode**
- By convention, root has inode number 2 and `lost+found` has inode number 3. Inode numbers 0 and 1 are not used
- Shows inode numbers with `ls -i`
- Is self-contained, with no dependencies on any other filesystem

## Filesystem Details

### What is a Filesystem?

- The methods and data structures an OS uses to keep track of files on a disk or partition
- The word is also used for the partition or disk that stores files, or for the filesystem type
- A disk or partition and the filesystem it contains are different things
- Programs that create filesystems work on raw sectors and will destroy or corrupt any existing filesystem there
- Most programs work on a filesystem and won't work on a partition without one
- Before use, a partition needs to be initialized and bookkeeping structures written. This is called **making a filesystem**

### Filesystem Structure

Most Linux filesystem types share the same central concepts.

|Concept|Role|
|---|---|
|Superblock|Information about the filesystem as a whole, such as its size|
|Inode|All information about a file except its name|
|Data block|Stores the file's data|
|Directory block|Holds directory entries: a filename plus the inode number|
|Indirection block|Extra pointers to data blocks when the inode runs out of space|

- The file name is stored in the directory with the inode number
- The inode holds the numbers of several data blocks
- If more are needed, more pointer space is allocated dynamically. Those are indirect blocks, so you look up the block number in the indirect block first
- Linux filesystems usually allow **holes** in files (created with `lseek()`): a region treated as zero bytes with no disk sectors reserved. Common in small binaries, shared libraries and some databases

### Comparing Filesystem Features

|FS|Year|Original OS|Max file size|Max FS size|Journaling|
|---|---|---|---|---|---|
|FAT16|1983|MS-DOS v2|4 GB|16 MB to 8 GB|No|
|FAT32|1997|Windows 95|4 GB|8 GB to 2 TB|No|
|HPFS|1988|OS/2|4 GB|2 TB|No|
|NTFS|1993|Windows NT|16 EB|16 EB|Yes|
|HFS+|1998|Mac OS|8 EB|?|No|
|UFS2|2002|FreeBSD|512 GB to 32 PB|1 YB|No|
|ext2|1993|Linux|16 GB to 2 TB|2 TB to 32 TB|No|
|ext3|1999|Linux|16 GB to 2 TB|2 TB to 32 TB|Yes|
|ReiserFS3|2001|Linux|8 TB|16 TB|Yes|
|ReiserFS4|2005|Linux|?|?|Yes|
|XFS|1994|IRIX|9 EB|9 EB|Yes|
|JFS|?|AIX|8 EB|512 TB to 4 PB|Yes|
|VxFS|1991|SVR4.0|16 EB|?|Yes|
|ZFS|2004|Solaris 10|1 YB|16 EB|No|

### FHS and the Directory Tree

- The layout is loosely based on the Filesystem Hierarchy Standard (FHS)
- No authority forces compliance, but many distributions support it. Don't break from it without a strong reason
- Benefit: software is easier to write or port, and machines are easier to administer
- The tree can be split into parts, each on its own disk or partition, to fit disk size limits and ease backups
- Major parts: root (`/`), `/usr`, `/var`, `/home`

|Part|Role|
|---|---|
|Root filesystem|Machine-specific. Files needed to boot and reach a state where other filesystems can be mounted. Enough for single-user mode. Has repair and recovery tools|
|`/usr`|Commands, libraries, manual pages and other unchanging files. Nothing machine-specific, not modified in normal use. Can be shared over the network or mounted read-only|
|`/var`|Files that change: spool directories, logs, formatted manual pages, temp files|
|`/home`|Users' home directories, all the real data. Separating it makes backups easier|

- These parts don't have to be separate filesystems. On a small single-user system they can all be in one
- What matters is that the standard names work, e.g. `/usr/lib/libc.a` and `/var/log/messages`, even if `/var` is a symlink to `/usr/var`
- Files are grouped by **purpose** (all commands together, all data together), not by program. This makes sharing and finding files easier
- The root filesystem should be small. A small, rarely changed filesystem is less likely to get corrupted, and a corrupted root usually means an unbootable system
- The root directory generally holds no files. Older systems kept the boot image `/vmlinuz` there, now moved to `/boot`

## File System Structure and Description

|Directory|Description|
|---|---|
|`/`|Root. Every file and directory starts here. Only root can write here. Not the same as `/root`|
|`/boot`|Files used by the boot loader (`grub.cfg`), kernel, initrd, vmlinuz|
|`/root`|Home directory of the root user|
|`/dev`|Device files: disk, cdrom, speakers, flash drive, keyboard, terminals, USB|
|`/etc`|Configuration files, plus startup and shutdown scripts. e.g. `/etc/resolv.conf`|
|`/bin` → `/usr/bin`|Everyday user commands: ps, ls, ping, grep, cp|
|`/sbin` → `/usr/sbin`|System and filesystem commands for admins: iptables, reboot, fdisk, ifconfig, swapon|
|`/opt`|Optional add-on applications, not part of the OS|
|`/proc`|Running processes. Virtual filesystem that exists only in memory. `/proc/{pid}`, `/proc/uptime`|
|`/lib` → `/usr/lib`|Libraries needed by commands and apps (`ld*` or `lib*.so.*`). Try `strace -e open pwd`|
|`/tmp`|Temporary files. Deleted on reboot|
|`/home`|Home directories for users, e.g. `/home/john`|
|`/var`|Variable files that grow: logs (`/var/log`), packages and databases (`/var/lib`), mail (`/var/mail`), print queues (`/var/spool`), lock files (`/var/lock`), temp files kept across reboots (`/var/tmp`)|
|`/run`|Daemons that start very early (systemd, udev) store runtime files like PID files|
|`/mnt`|Temporary mount point where admins mount filesystems (e.g. NFS)|
|`/media`|Removable media, e.g. `/media/cdrom`|
|`/srv`|Data for services the server provides, e.g. `/srv/cvs`|
|`/usr`|Second-level programs: `/usr/bin`, `/usr/sbin`, `/usr/lib`, `/usr/local` (programs installed from source, e.g. `/usr/local/apache2`)|

## Navigating the File System

|Command|Meaning|
|---|---|
|`cd`|Change directory. Main way to move around|
|`pwd`|Print working directory. Shows your current location|
|`ls`|List files and directories in the current directory|

Use the **Tab** key to auto-complete.

## File and Directory Properties

Each file or directory has details shown by `ls -l`.

|Type and permissions|Links|Owner|Group|Size|Month|Day|Time|Name|
|---|---|---|---|---|---|---|---|---|
|`drwxr-xr-x.`|21|root|root|4096|Feb|27|13:33|var|
|`lrwxrwxrwx.`|1|root|root|7|Feb|27|13:15|bin|
|`-rw-r--r--`|1|root|root|0|Mar|2|11:15|testfile|

The second column is the number of hard links. For a directory, it is the number of immediate subdirectories plus its parent directory and itself.

### File Types

The first character of the listing shows the type.

|Symbol|Meaning|
|---|---|
|`-`|Regular file|
|`d`|Directory|
|`l`|Link|
|`c`|Special file or device file|
|`s`|Socket|
|`p`|Named pipe|
|`b`|Block device|

## File Names

- Most characters are allowed, but avoid spaces, tabs and characters with special meaning to the shell: `& ; ( ) | ? \ ' "` [ ] { } < > $ - ! /`
- **Case sensitive:** `NOVEMBER`, `November` and `november` are three different files
- **Length:** up to 256 characters
- **Uniqueness:** no two files in the same directory can share a name. Files in different directories can

### Extensions

Extensions are optional and help identify file types.

|Name|Type|
|---|---|
|`libc.a`|Archive, library file|
|`program.c`|C source file|
|`alpha2.f`|Fortran source file|
|`xwd2ps.o`|Object/executable code|
|`mygames.Z`|Compressed file|

### Hidden Files

Names start with a dot: `.cshrc`, `.login`, `.mailrc`, `.mwmrc`

### Reserved Names

|Name|Meaning|
|---|---|
|`/`|Root directory|
|`.`|Current directory|
|`..`|Parent directory|
|`~`|Your home directory|

## File System Paths

|Path|Starts with|Example|
|---|---|---|
|Absolute|`/`, starts at the root directory|`cd /var/log/httpd`|
|Relative|No `/`, relative to current location|`cd var` then `cd log`, `cd httpd`|

```bash
cd /var/log/httpd

cd /var
cd log
cd httpd
```

## Creating Files and Directories

|Item|Commands|
|---|---|
|Files|`touch`, `cp`, `vi`|
|Directories|`mkdir`|

## Copying Directories

Use `cp` with `-R` (recursive) and give the source and destination.

```bash
cp -R <source_folder> <destination_folder>
```

## Finding Files and Directories

Two main commands: `find` and `locate`.

```bash
# find / -name data.txt
# locate data.txt
# updatedb
```

|Point|find|locate|
|---|---|---|
|How it works|Walks the filesystem looking for files|Reads a prebuilt database (a cache)|
|Speed|Can take minutes on a large filesystem|Much faster|
|Accuracy|Always current, many options to narrow the search|Can be stale|

- `updatedb` takes a snapshot of the system files, run automatically once a day
- Files added or removed within the last 24 hours are unknown to `locate` until the database is updated
- If the database isn't updated, `locate` won't show the output. Run `updatedb` to sync it

## Wildcards

A wildcard is a character that substitutes for a class of characters in a search. Used in shell commands, regular expressions and programming languages.

|Wildcard|Represents|
|---|---|
|`*`|Zero or more characters|
|`?`|Exactly one character|
|`[]`|Any one character in the brackets, or a range|

### Star

```bash
file *            # info about every object in current directory
ls *.html *.txt   # all files with .html or .txt extension
rm *xxx*          # delete all files with xxx in the name
```

- `*.jpg` matches every object ending in `.jpg`
- `a*` matches every object starting with lowercase a
- If there are no matches, an error like `*: can't stat '*'` is returned

### Question Mark

```bash
file ???       # names exactly 3 characters long
file ? ?? ???  # names 1, 2 or 3 characters long
file a????     # starts with a, 5 characters long
ls *.???       # 3-character extension
```

### Square Brackets

```bash
file *[xyz]*        # names containing x, y or z
ls *.[xyz]*         # extension starts with x, y or z
file [a-f]*         # names starting with a to f
file *[0-9]*        # names containing a digit
file [a-cst]*       # start with a to c, or s, or t
file [a-cx-z]*      # start with a to c, or x to z
ls jones[0-9][0-9][0-9]   # jones followed by 3 digits
```

A hyphen between two characters means an inclusive range. Ranges and lists can be combined.

### Other Special Characters

|Character|Meaning|
|---|---|
|`\`|Escape character, protects the next special character. `\\` searches for a backslash|
|`^`|Beginning of the line. `^a` finds lines starting with a|
|`$`|End of the line. `a$` finds lines ending with a|

```bash
cat myfile | grep '^s*n$'
```

## Soft and Hard Links

|Term|Meaning|
|---|---|
|inode|Pointer or number of a file on the hard disk|
|Hard link|Points to the inode (the contents). Deleting, renaming or moving the original does not affect it|
|Soft link|Points to the file name. Breaks if the original is removed or renamed|

```bash
ln blah1 blah1-hard       # hard link
ln -s blah2 blah2-soft    # soft link
```

### Example

```bash
$ touch blah1
$ touch blah2
$ echo "Cat" > blah1
$ echo "Dog" > blah2

$ ln blah1 blah1-hard
$ ln -s blah2 blah2-soft
$ ls -l
blah1
blah1-hard
blah2
blah2-soft -> blah2
```

Rename the originals:

```bash
$ mv blah1 blah1-new
$ cat blah1-hard
Cat

$ mv blah2 blah2-new
$ cat blah2-soft
cat: blah2-soft: No such file or directory
```

- `blah1-hard` still works because it points to the inode, which didn't change
- `blah2-soft` fails because it points to the name, which changed
- If `blah1` is deleted, `blah1-hard` still holds the contents
- If `blah2` is deleted, `blah2-soft` is a link to a non-existing file

## Listing Folders and Files with ls

`ls` lists directory contents. Help: `ls --version`, `ls --help`, `info ls`, `man ls`.

### Options

|Option|Effect|
|---|---|
|`-r`, `--reverse`|Reverse the sort order|
|`-l`|Long listing format|
|`-t`|Sort by modification time, newest first|
|`-i`, `--inode`|Print the inode number of each file|
|`-a`, `--all`|Do not ignore entries starting with `.`|
|`-d`, `--directory`|List directories themselves, not their contents|
|`-p`|Append `/` to directories|
|`--group-directories-first`|Group directories before files|

Pipe any of these to `wc -l` to count instead of list:

```bash
ls -d */ | wc -l
```

### Folders Only

|Goal|Command|
|---|---|
|Non-hidden folders|`ls -d */`|
|Non-hidden, detailed|`ls -dl */` or `ls -l \| grep ^d`|
|Non-hidden, newest first|`ls -dt */`|
|Non-hidden, oldest first|`ls -dtr */`|
|Non-hidden, with inodes|`ls -di */`|
|Hidden folders|`ls -d .*/`|
|Hidden and non-hidden|`ls -d */ .*/`|

### Files Only

| Goal                                         | Command                                        |
| -------------------------------------------- | ---------------------------------------------- |
| Non-hidden files                             | `ls -p \| grep -v /`                           |
| Non-hidden, detailed                         | `ls -pl \| grep -v /` or `ls -l \| grep -v ^d` |
| Non-hidden, newest first                     | `ls -pt \| grep -v /`                          |
| Hidden and non-hidden, detailed, with inodes | `ls -plai \| grep -v /`                        |

### Folders and Files Together

|Goal|Command|
|---|---|
|Everything, non-hidden|`ls`|
|Folders first, then files|`ls --group-directories-first`|
|Detailed|`ls -l`|
|Hidden only|`ls -d .*` or `ls -d .[^.]*`|
|Hidden, folders first|`ls -d .* --group-directories-first`|

- `.[^.]*` skips `.` and `..` but returns an error if no hidden entries exist
- Add `r` to reverse any listing (`-lr`), `t` to sort by time (`-lt`), `i` to show inodes (`-li`). Flags combine, e.g. `ls -dltri */`
