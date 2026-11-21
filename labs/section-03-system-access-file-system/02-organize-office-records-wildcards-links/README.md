# Lab: Organize Office Records with Wildcards and Links

## Scenario

- Files are difficult to locate
- Identify file types and manage links
- Practice Linux commands:
  - Search for files
  - Compare methods of finding
  - Wildcards for quick matching
  - Check file types
  - Soft and hard links
  - Managing files

## Environment

| Item | Setup |
| --- | --- |
| OS | RHEL 9.4 |
| Host | Microsoft Azure VM |
| Access | SSH key from Kali Linux |

## Commands Used

| Command | Purpose |
| --- | --- |
| `mkdir` | Create directories |
| `touch` | Create empty files |
| `find` | Search for files |
| `ls` | List files, match patterns, inspect file types |
| `ln` | Create hard links |
| `ln -s` | Create soft links |

## Task 1: Set up the initial project structure

- Prepare a base environment for the search and linking commands
- Create a main directory named `search_lab` inside the home directory
- Create these files inside it:

| Directory | File |
| --- | --- |
| `docs` | `notes.txt` |
| `reports` | `summary.log` |
| `images` | `photo.jpg` |

Script: [`task_1.sh`](scripts/task_1.sh)

## Task 2: Find and locate files

- Use the `find` command
- Look for all `.txt` files inside the `search_lab` directory
- Use `find` again
- Search for the file `summary.log`

Script: [`task_2.sh`](scripts/task_2.sh)

## Task 3: Use wildcards for quick searches

- Work inside the `search_lab` directory
- Use `ls` with patterns:
  - `ls *.txt` to list text files
  - `ls *.log` to list log files
  - `ls p*` to match any file starting with the letter `p`
- Handle groups of files at once

Script: [`task_3.sh`](scripts/task_3.sh)

## Task 4: Check file types and create links

- Use `ls -l` to inspect the files inside `search_lab`
- In the home directory:
  - Create a soft link to `notes.txt`
  - Create a hard link to `summary.log`

| Link type | What it is |
| --- | --- |
| Soft link | A shortcut that points to the file's path |
| Hard link | Another name for the same file data, not an independent copy |

Script: [`task_4.sh`](scripts/task_4.sh)

## Problems and Fixes

- None yet
