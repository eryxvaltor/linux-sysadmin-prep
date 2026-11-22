# Case Study: Support Project Files and Links

## Summary

| Item | Detail |
| --- | --- |
| Type | Course case study, hands-on workspace record |
| Module | 03: System Access and File System |
| System | Azure VM, SSH login with a private key |
| Account | Normal user `linuxsysadmin` (not root) |
| Data | Sample files only |

## Contents

1. [Plan the workspace](#1-plan-the-workspace)
2. [Create and copy files](#2-create-and-copy-files)
3. [Find your files](#3-find-your-files)
4. [Test links](#4-test-links)
5. [Workspace record](#5-workspace-record)

## 1. Plan the workspace

I made the workspace in my home directory with my normal account. I did not use root because I did not need admin rights.

| Item | Record |
| --- | --- |
| User | `linuxsysadmin` |
| Current directory | `/home/linuxsysadmin/support-project` |
| Login method | Azure VM login using SSH with a private key |

| Folder | Purpose |
| --- | --- |
| `config` | Configuration files |
| `notes` | Documentation |
| `logs` | Application logs |
| `archive` | Backup copies |

```bash
whoami
pwd
who
cd ~
mkdir support-project
cd support-project/
mkdir config notes logs archive
ls -l
```

```text
support-project/
├── archive
├── config
├── logs
└── notes
```

## 2. Create and copy files

Sample text files in the four folders:

```bash
echo "Application port: 8080" > config/settings.txt
echo "Server maintenance notes" > notes/server.txt
echo "Network troubleshooting notes" > notes/network.txt
echo "Application started successfully" > logs/app.log
```

A filename with a space needs quotes:

```bash
echo "Daily support activities" > "notes/daily report.txt"
```

Copy the whole `notes` folder into `archive`. `-r` copies the folder and everything inside it:

```bash
cp -r notes archive/
```

Move between folders:

- **Absolute path:** starts from the root directory, so it works from anywhere.
- **Relative path:** starts from the current folder.

```bash
cd /home/linuxsysadmin/support-project/config    # absolute
cd ../notes/                                      # relative
```

Resulting tree:

```text
.
├── archive
│   └── notes
│       ├── daily report.txt
│       ├── network.txt
│       └── server.txt
├── config
│   └── settings.txt
├── logs
│   └── app.log
└── notes
    ├── daily report.txt
    ├── network.txt
    └── server.txt
```

## 3. Find your files

Create `app.conf` in the `config` folder and check it:

```bash
touch config/app.conf
ls -R config/
```

Find it with `find`, first by exact name and then with patterns:

```bash
find . -name "app.conf"
find . -name "*.conf"
find . -name "app.*"
find . -name "[abc]pp.co??"
find . -name "???.????"
find . -name "app.c*"
```

| Pattern | Meaning |
| --- | --- |
| `*` | Any number of characters |
| `?` | Exactly one character |
| `[abc]` | One character from the list |

Compare with `locate`. It reads a database, so the database must be updated first (this needs admin rights):

```bash
sudo updatedb
locate app.conf
```

- `find` searches the folders live, so it sees new files at once.
- `locate` is usually faster, but it only knows files that were there when the database was last updated.

**Safety habit:** before using a wildcard with a command that changes files, such as `cp`, I list the matches with `ls` first, so I can see exactly which files the pattern picks.

## 4. Test links

Make a sample file in the project folder:

```bash
echo "I am Shadow" > shadow.txt
```

Create a hard link and a symbolic link in `config`. Both stay on the same filesystem:

```bash
cd config/
ln /home/linuxsysadmin/support-project/shadow.txt shadow_hard
ln -s /home/linuxsysadmin/support-project/shadow.txt shadow_soft
```

Check file types and inode numbers (`-i` shows the inode):

```bash
ls -lrti /home/linuxsysadmin/support-project/shadow.txt
ls -lrti shadow_hard shadow_soft
```

```text
140 -rw-r--r--. 2 linuxsysadmin linuxsysadmin 12 Nov 22 17:39 /home/linuxsysadmin/support-project/shadow.txt

140 -rw-r--r--. 2 linuxsysadmin linuxsysadmin 12 Nov 22 17:39 shadow_hard
524745 lrwxrwxrwx. 1 linuxsysadmin linuxsysadmin 46 Nov 22 17:40 shadow_soft -> /home/linuxsysadmin/support-project/shadow.txt
```

Remove only the source name, then test each link:

```bash
cd ../
rm shadow.txt
cd config/
cat shadow_hard
cat shadow_soft
```

| Link | Result after removing `shadow.txt` |
| --- | --- |
| `shadow_hard` | Still readable |
| `shadow_soft` | `cat: shadow_soft: No such file or directory` |

- The original file and the hard link share inode `140`, so the data stays as long as one name points to it.
- The symbolic link has its own inode (`524745`) and points to a path. When the path no longer exists, the link breaks.

## 5. Workspace record

Folder tree:

```bash
cd ~/support-project
tree
```

```text
├── archive
│   └── notes
│       ├── daily report.txt
│       ├── network.txt
│       └── server.txt
├── config
│   ├── app.conf
│   ├── settings.txt
│   ├── shadow_hard
│   └── shadow_soft -> /home/linuxsysadmin/support-project/shadow.txt
├── logs
│   └── app.log
└── notes
    ├── daily report.txt
    ├── network.txt
    └── server.txt
```

Check that the copied files hold the right data. `diff -r` prints nothing when the folders are the same:

```bash
diff -r notes archive/notes
cat notes/server.txt
cat archive/notes/server.txt
```

**Surprise:** the hard link still worked after I removed the original filename, but the symbolic link broke. The hard link points to the file's data (inode), and the symbolic link points to a name.

**Remove only this project:** `-r` removes the folder and its contents, and `-i` asks before each removal.

```bash
rm -ri ~/support-project
```
