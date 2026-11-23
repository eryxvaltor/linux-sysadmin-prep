# Lab: Secure Project Files with Permissions and Ownership

## Scenario

- Project files must be protected
- Control who can read, write and execute
- Practice Linux commands:
  - File permissions
  - Adjusting ownership
  - Stricter security rules
- Keep files secure and properly managed

## Environment

| Item | Setup |
|---|---|
| OS | RHEL 9.4 |
| Host | Microsoft Azure VM |
| Access | SSH key from Kali Linux |

## Commands Used

| Command | Purpose |
|---|---|
| `mkdir` | Create directories |
| `echo` | Add text to a file |
| `ls -l` | List file details, permissions, owner and group |
| `chmod` | Change file permissions |
| `groupadd` | Create a group |
| `chgrp` | Change group ownership |

## Task 1: Set up project files for testing

Prepare a safe environment

- Create a directory named `secure_lab`
- Add a file named `report.txt`

Script: [task_1.sh](https://github.com/eryxvaltor/linux-sysadmin-prep/blob/main/labs/section-04-linux-fundamentals/01-secure-project-files-permissions-ownership/scripts/task_1.sh)

## Task 2: Change file permissions

Use permissions on `report.txt`

| Who | Permission |
|---|---|
| Owner or user | Read and write |
| Group | Read |
| Others | No permission |

Script: [task_2.sh](https://github.com/eryxvaltor/linux-sysadmin-prep/blob/main/labs/section-04-linux-fundamentals/01-secure-project-files-permissions-ownership/scripts/task_2.sh)

## Task 3: Work with ownership

Explore file ownership

- A file has an owner and a group associated with it
- List the details of `report.txt`
- Change the group ownership

Script: [task_3.sh](https://github.com/eryxvaltor/linux-sysadmin-prep/blob/main/labs/section-04-linux-fundamentals/01-secure-project-files-permissions-ownership/scripts/task_3.sh)

## Task 4: Practice advanced permission control

Apply stricter security rules

| Who | Permission |
|---|---|
| Owner or user | Read and write |
| Group | No permission |
| Others | No permission |

- Update the permissions on `report.txt`

Script: [task_4.sh](https://github.com/eryxvaltor/linux-sysadmin-prep/blob/main/labs/section-04-linux-fundamentals/01-secure-project-files-permissions-ownership/scripts/task_4.sh)

## Problems and Fixes

None yet
