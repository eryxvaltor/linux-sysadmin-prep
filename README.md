# Linux SysAdmin Job Prep

![Status](https://img.shields.io/badge/status-in%20progress-yellow) ![Focus](https://img.shields.io/badge/focus-Linux%20SysAdmin-blue) ![Lab](https://img.shields.io/badge/lab-RHEL%209.4-red)

My complete preparation for an entry-level Linux system administration role. I document every step of the learning here: study notes, labs, and the scripts I use for them. Projects get added when I do them.

The rule for this repo: something only goes in as done once I've done it and verified it.

## Progress

Course: [Complete Linux Training Course to Get Your Dream IT Job](https://www.udemy.com/course/complete-linux-training-course-to-get-your-dream-it-job/) by Imran Afzal (Udemy).

| # | Module | Notes | Status |
| --- | --- | --- | --- |
| 01 | Introduction to Linux | [Notes](notes/section-01-understanding-linux/README.md) | Done |
| 02 | Download, Install and Configure | [Notes](notes/section-02-download-install-configure/README.md) | Done |
| 03 | System Access and File System | [Notes](notes/section-03-system-access-file-system/README.md) | Done |
| 04 | Linux Fundamentals | - | Not started |
| 05 | System Administration | - | Not started |
| 06 | Shell Scripting | - | Not started |
| 07 | Networking, Services, and System Updates | - | Not started |
| 08 | Disk Management and Run Levels | - | Not started |
| 09 | All About Resume | - | Not started |
| 10 | All About Interview | - | Not started |

Links are added as each module's notes go up.

## Labs

Each lab has its own folder with the task description and the scripts I used.

### Module 03: System Access and File System

| Lab | Commands |
| --- | --- |
| [Organize Project Files into Directories](labs/section-03-system-access-file-system/01-organize-project-files/README.md) | `mkdir`, `touch`, `cp`, `mv` |
| [Organize Office Records with Wildcards and Links](labs/section-03-system-access-file-system/02-organize-office-records-wildcards-links/README.md) | `find`, `ls`, `ln`, `ln -s` |

## How I'm learning

- Notes are written in my own words, kept short, and organized by module
- Labs are done on a real VM, with the commands saved as scripts
- Mistakes and fixes get written up, not deleted

## Lab environment

| Item | Setup |
| --- | --- |
| Target | RHEL 9.4 VM on Microsoft Azure |
| Client | Kali Linux |
| Access | SSH key authentication |

## Repository layout

```
linux-sysadmin-prep/
├── README.md
├── notes/                      # study notes, one folder per module
│   └── section-NN-name/
└── labs/                       # one folder per module, one folder per lab
    └── section-NN-name/
        └── NN-lab-name/
            ├── README.md       # task description and write-up
            └── scripts/        # task_1.sh, task_2.sh, ...
```

Projects will get their own folder if and when I add them.

## Security

No keys, tokens, passwords, or private config are committed. Public IPs, hostnames, and cloud account or subscription IDs are removed from anything I publish.

---

Maintained by Eryx Valtor. Personal learning notes, not affiliated with Udemy or the course instructor.
