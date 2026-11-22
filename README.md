# Linux SysAdmin Job Prep

![Status](https://img.shields.io/badge/status-in%20progress-yellow) ![Focus](https://img.shields.io/badge/focus-Linux%20SysAdmin-blue) ![Lab](https://img.shields.io/badge/lab-Ubuntu%20%7C%20RHEL-red)

My complete preparation for an entry-level Linux system administration role. I document every step of the learning here: study notes, hands-on labs with the scripts I used, and written case studies.

The rule for this repo: something only goes in as done once I've done it and verified it.

## Progress

Course: [Complete Linux Training Course to Get Your Dream IT Job](https://www.udemy.com/course/complete-linux-training-course-to-get-your-dream-it-job/) by Imran Afzal (Udemy).

| # | Module | Notes | Status |
| --- | --- | --- | --- |
| 01 | Introduction to Linux | [Notes](notes/section-01-understanding-linux/README.md) | Done |
| 02 | Download, Install and Configure | [Notes](notes/section-02-download-install-configure/README.md) | Done |
| 03 | System Access and File System | [Notes](notes/section-03-system-access-and-file-system/README.md) | Done |
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

## Case Studies

End-of-module assignments from the course. Each one says whether it is a written plan or a hands-on lab record.

| Case study | Module | Type |
| --- | --- | --- |
| [Linux Lab Plan for a Support Team](case-studies/01-support-team-lab-plan/README.md) | 01 | Written plan |
| [Linux VM Lab Setup](case-studies/02-linux-vm-lab-setup/README.md) | 02 | Hands-on lab record |
| [Support Project Files and Links](case-studies/03-support-project-files-and-links/README.md) | 03 | Hands-on workspace record |

## How I'm learning

- Notes are written in my own words, kept short, and organized by module
- Labs are done on a real VM, with the commands saved as scripts
- Mistakes and fixes get written up, not deleted

## Lab environment

| Lab | Platform | Linux | Used for |
| --- | --- | --- | --- |
| Home lab | KVM/QEMU with Virt-Manager on a Kali Linux host | Ubuntu Server 26.04.1 LTS | [VM setup case study](case-studies/02-linux-vm-lab-setup/README.md) |
| Cloud lab | Microsoft Azure VM, SSH key login from Kali Linux | RHEL 9.4 | Course labs |

## Repository layout

```
linux-sysadmin-prep/
├── README.md
├── notes/                          # study notes, one folder per module
│   └── section-NN-name/
│       └── README.md
├── labs/                           # hands-on labs, grouped by module
│   └── section-NN-name/
│       └── NN-lab-name/
│           ├── README.md           # tasks and write-up
│           └── scripts/            # task_1.sh, task_2.sh, ...
└── case-studies/                   # end-of-module course assignments
    └── NN-case-study-name/
        ├── README.md
        └── images/                 # screenshots, if any
```

## Security

No keys, tokens, passwords, or private config are committed. Public IPs, hostnames, and cloud account or subscription IDs are removed from anything I publish.

---

Maintained by Eryx Valtor. Personal learning notes, not affiliated with Udemy or the course instructor.
