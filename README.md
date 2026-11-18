# Linux System Administration Preparation

![Status](https://img.shields.io/badge/status-in%20progress-yellow)
![Focus](https://img.shields.io/badge/focus-Linux%20SysAdmin-blue)
![License](https://img.shields.io/badge/license-MIT-green)

My structured preparation for an entry-level Linux system administration role, starting from zero. This repository holds my study notes, hands-on labs, and practical projects.

> **Current status:** Section 1 notes complete. Working through the course in order. This repository will contain **study notes**, **labs**, and **projects**.

---

## Table of Contents

- [Overview](#overview)
- [Progress Tracker](#progress-tracker)
- [Repository Structure](#repository-structure)
- [How I Document](#how-i-document)
- [Learning Areas](#learning-areas)
- [Lab Environment](#lab-environment)
- [Roadmap](#roadmap)
- [Course Reference](#course-reference)

---

## Overview

I am preparing for an entry-level Linux system administration job. My primary learning resource is Imran Afzal's [Complete Linux Training Course to Get Your Dream IT Job](https://www.udemy.com/course/complete-linux-training-course-to-get-your-dream-it-job/) on Udemy.

The goal is not just to watch the course, but to:

1. **Understand** each concept and write it up in my own words.
2. **Practice** it hands-on in a lab until I can do it without the notes.
3. **Document** the result so it is useful for revision and for interviews.

---

## Progress Tracker

Each section has its own folder under [`notes/`](notes/) containing multiple focused notes plus a short index.

| # | Section | Notes | Labs | Status |
|---|---------|:-----:|:----:|--------|
| 1 | Understanding Linux Concepts | [notes](notes/section-01-understanding-linux/) | - | ✅ Complete |
| 2 | Download, Install, and Configure Linux | - | - | ⬜ Not started |
| 3 | _To be added_ | - | - | ⬜ Not started |
| 4 | Linux Fundamentals | - | - | ⬜ Not started |
| 5 | _To be added_ | - | - | ⬜ Not started |
| 6 | _To be added_ | - | - | ⬜ Not started |
| 7 | _To be added_ | - | - | ⬜ Not started |
| 8 | _To be added_ | - | - | ⬜ Not started |
| 9 | _To be added_ | - | - | ⬜ Not started |
| 10 | Interview Preparation | - | - | ⬜ Not started |

**Legend:** ✅ Complete · 🟨 In progress · ⬜ Not started

_Status values are only changed after the notes are written and the hands-on practice is done._

---

## Repository Structure

```
linux-sysadmin-prep/
├── README.md
├── notes/                      # Study notes in my own words
│   ├── section-01-understanding-linux/
│   │   ├── README.md           # Section summary and index of notes
│   │   └── ...                 # One file per concept or task
│   └── section-02-.../
├── labs/                       # Hands-on exercises and results
│   └── lab-01-.../
└── projects/                   # Larger practical administration projects
    └── project-01-.../
```

Directories are added as material becomes available, so some may not exist yet.

### Naming conventions

- Note folders: `section-NN-short-topic/` (e.g. `section-01-understanding-linux`)
- Labs: `lab-NN-short-topic/`; projects: `project-NN-short-topic/`
- Files: lowercase, hyphen-separated (e.g. `hard-vs-soft-links.md`)
- One note per concept or task, not per video

---

## How I Document

### Notes

Each note covers a single concept: what it is, why it matters, key commands with examples, and common mistakes. Each section folder has a `README.md` that summarizes the section and links to every note in it.

### Labs

Every practical exercise records:

1. **Objective:** what the exercise is meant to accomplish
2. **Environment:** distribution, version, and lab setup
3. **Procedure:** commands and configuration changes performed
4. **Verification:** how I confirmed the result
5. **Troubleshooting:** problems encountered and how I resolved them

### Security

Credentials, private keys, tokens, IP addresses of real systems, and other sensitive information are never committed.

---

## Learning Areas

Areas I plan to cover as I progress. This list is a plan, not a claim of completed coursework; see the [Progress Tracker](#progress-tracker) for what is actually done.

- Linux fundamentals and command-line operations
- Filesystem navigation and file management
- Users, groups, and permissions
- Package and software management
- Process and service management
- Storage and filesystem administration
- Networking fundamentals and troubleshooting
- Shell scripting and task automation
- System maintenance, security, and troubleshooting

---

## Lab Environment

| Item | Details |
|------|---------|
| Main OS (my workstation) | Kali Linux |
| Lab system | Red Hat Enterprise Linux (RHEL) 9.4 |
| Platform | Microsoft Azure virtual machine |
| VM generation | Gen 2 |
| Architecture | x86_64 (x64) |
| Disk layout | LVM |
| Access | SSH from Kali using key-based authentication |

All labs are performed on the RHEL 9.4 Azure VM and accessed from Kali over SSH. Notes mention when a command or behavior differs on other distributions (e.g. Ubuntu/Debian, Kali).

---

## Course Reference

**Course:** [Complete Linux Training Course to Get Your Dream IT Job](https://www.udemy.com/course/complete-linux-training-course-to-get-your-dream-it-job/)
**Instructor:** Imran Afzal
**Platform:** Udemy

This is an independent learning repository. It is not affiliated with or endorsed by the course instructor or Udemy. The notes and lab documentation reflect my own work and do not reproduce paid course materials.

---

**Maintained by:** Eryx Valtor
