# Lab: Organize Project Files into Directories

## Scenario

- Create a proper directory structure for a project
- Different types of documents, reports, and images get stored in their own places
- Create the directories and a few sample files
- Place the files into the correct directories
- Commands used: `mkdir`, `touch`, `cp`, `mv`

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
| `cp` | Copy files |
| `mv` | Move or rename files |
| `ls` | List directory contents |
| `tree` | Show directory structure (if installed) |

## Task 1: Create the main project directory

- Set up the main location for the project files
- Create a directory named `project_lab` inside the home directory
- Run `ls` on the home directory to confirm `project_lab` exists

Script: [`task_1.sh`](scripts/task_1.sh)

## Task 2: Create subdirectories for organization

- Make separate directories inside `project_lab`
- Files get stored in an organized way
- Create three directories named `docs`, `reports`, and `images`
- Use `mkdir` with the full path of `project_lab` and the directory names
- Use `ls` with the path of `project_lab`
- Confirm the three directories now exist inside it

Script: [`task_2.sh`](scripts/task_2.sh)

## Task 3: Create sample files in the directories

- Use `touch` to create empty files
- In `docs`, create `notes.txt`
- In `reports`, create `summary.txt`
- In `images`, create `photo.jpg`
- Use `ls` with the `-l` option
- Confirm the files have been created

Script: [`task_3.sh`](scripts/task_3.sh)

## Task 4: Copy files into the correct directories

- Practice copying files
- Use `cp` to copy `notes.txt` from `docs` into `reports`
- Copy `summary.txt` from `reports` into `docs`
- After copying, use `ls` on both directories
- Confirm the files are present in both locations

Script: [`task_4.sh`](scripts/task_4.sh)

## Task 5: Move files and verify the project structure

- Practice moving and renaming files
- Use `mv` so the entire project structure is correct
- Rename `photo.jpg` in `images` to `project_photo.jpg`
- Use `tree` if it is available on the system
- Run `ls -R ~/project_lab` to list all files and directories under `project_lab`
- Verify that all directories and files are in the right place

Script: [`task_5.sh`](scripts/task_5.sh)

## Problems and Fixes

- None yet
