# Case Study 4: Log Files, Permissions and Archives

## Overview
This project uses one small sample log for five jobs: set up a workspace, set permissions, build a log report, make an archive, and write the final record.

| Item | Detail |
|---|---|
| Account | `linuxsysadmin` (normal account, member of the `sudo` group) |
| Shell | zsh |
| Workspace | `~/module4-project` |
| Data | Sample files only |

**Who this is for:** beginners who want to work as a Linux system administrator.

**What you practise:** folders and files, ownership, `chmod`, ACLs, `grep`, `cut`, `sort`, `uniq`, `wc`, redirection, `tee`, `tar`, `split` and file checks.

## 1. Create the sample data
Three folders: `input` (original data), `work` (working copy) and `delivery` (reports).

```bash
mkdir -p ~/module4-project/{input,work,delivery}
cd ~/module4-project
vim input/error.log
mv input/error.log input/app.log
cp input/app.log work/app.log
```

The sample log has a date, message type, user and message. It has repeated users and four ERROR lines. The year `2025` on line 2 is on purpose, so I can fix it later and compare.

```text
2026-11-24 INFO alice Login successful
2025-11-24 ERROR bob Login failed
2026-11-24 INFO charlie File accessed
2026-11-24 ERROR alice Permission denied
2026-11-24 INFO bob Login successful
2026-11-24 ERROR bob File not found
2026-11-24 INFO alice Logout successful
2026-11-24 ERROR charlie Access denied
```

The copy in `work` lets me change data without touching the original.

```bash
tree .
```

```text
.
├── delivery
├── input
│   └── app.log
└── work
    └── app.log

4 directories, 2 files
```

```bash
diff input/app.log work/app.log
```

No output, so both files are the same.

## 2. Set and test permissions
My account: user `linuxsysadmin`, group `linuxsysadmin`, UID 1000, GID 1000.

**Before:** all four directories were `775`. A new `report.txt` was `664`.

```bash
sudo chown linuxsysadmin:linuxsysadmin ~/module4-project
sudo chown linuxsysadmin:linuxsysadmin delivery/report.txt
```

Both already had the right owner and group.

**Numeric chmod**

```bash
chmod 750 ~/module4-project
chmod 640 delivery/report.txt
chmod 440 input/app.log
chmod 640 work/app.log
```

- `750`: owner full access, group read and execute, others nothing.
- `640`: owner read and write, group read only.
- `440`: read only. I removed write from the original log so it cannot be changed by mistake.

**Symbolic chmod**

```bash
chmod g+w delivery/report.txt
```

This changed the report from `640` to `660`.

**ACL**

```bash
setfacl -m g:linuxsysadmin:r-- delivery/report.txt
getfacl delivery/report.txt
```

```text
# file: delivery/report.txt
# owner: linuxsysadmin
# group: linuxsysadmin
user::rw-
group::rw-
group:linuxsysadmin:r--
mask::rw-
other::---
```

**Access tests**

```bash
echo "Application Log Report" > delivery/report.txt
cat delivery/report.txt
```

```text
Application Log Report
```

Writing worked, because the owner can write.

```bash
echo "Test message" >> input/app.log
```

```text
zsh: permission denied: input/app.log
```

Writing failed, because the original log is read only. `cat input/app.log` worked, because the owner can read.

**Before and after**

| Item | Before | After |
|---|---|---|
| `module4-project` | 775 | 750 |
| `input`, `work`, `delivery` | 775 | 775 |
| `delivery/report.txt` | 664 | 660 plus ACL |
| `input/app.log` | not recorded | 440 |
| `work/app.log` | not recorded | 640 |

`diff input/app.log work/app.log` still gave no output.

**Mistake and correction**
I gave the same group an ACL that it already had as the file group. The ACL did not remove the group write permission from `g+w`. The fix removes the extra ACL, removes group write, and gives read-only access to a different group:

```bash
setfacl -x g:linuxsysadmin delivery/report.txt
chmod g-w delivery/report.txt
setfacl -m g:users:r-- delivery/report.txt
getfacl delivery/report.txt
```

Check that `group::` shows `r--` and that `group:users:r--` is listed.

**Lab limit**
My lab has only two accounts: `root` and `linuxsysadmin`. `root` ignores normal permissions, so it is no good for this test. I could not test ACL access from a second normal user. Other users would also need execute permission on the parent folders.

## 3. Build a log report

**Expected results (written first)**

| Item | Expected |
|---|---|
| Total entries | 8 |
| ERROR entries | 4 |
| INFO entries | 4 |
| Different users | 3 |

**Overwrite and append**

```bash
echo "maybe this is our report file" > delivery/report.txt
echo "wow cool report" >> delivery/report.txt
```

`>` replaced the old text. `>>` added a line at the end.

**Capture stderr**

```bash
echo "hellolog" >> input/app.log 2> error.txt
```

The error still showed on the screen. The shell reads redirections from left to right. It tried to open `input/app.log` first, and that failed before `2>` was set up. Grouping the command fixed it:

```bash
{ echo "hellolog" >> input/app.log; } 2> error.txt
```

The error went into `error.txt`.

**tee**

```bash
echo "let's rewrite the report file" | tee delivery/report.txt
echo "let's update the file content" | tee -a delivery/report.txt
```

`tee` shows the text and saves it. `tee -a` adds to the file.

**grep**

```bash
cat input/app.log | grep "ERROR"
```

```text
2025-11-24 ERROR bob Login failed
2026-11-24 ERROR alice Permission denied
2026-11-24 ERROR bob File not found
2026-11-24 ERROR charlie Access denied
```

`grep "bob"` showed 3 lines for bob.

**cut**

```bash
cat input/app.log | cut -d " " -f 2    # message type
cat input/app.log | cut -d " " -f 3    # user name
```

Field 2 gave 4 INFO and 4 ERROR. Field 3 gave alice, bob, charlie, alice, bob, bob, alice, charlie. `-d` sets the separator and `-f` picks the field.

**sort and uniq**

```bash
cat input/app.log | sort | uniq -u
```

All 8 lines came back, because every full line is different. `uniq -u` only shows lines that appear once, so it does not count users. Use `uniq -c` for that (next step).

**Count users**

```bash
cut -d " " -f 3 input/app.log | sort | uniq -c
grep "ERROR" input/app.log | cut -d " " -f 3 | sort | uniq -c
```

Expected result: all users are alice 3, bob 3, charlie 2. ERROR lines by user are alice 1, bob 2, charlie 1. `sort` must come before `uniq`, because `uniq` only counts lines that are next to each other.

**Save the report**

```bash
grep "ERROR" input/app.log | tee delivery/report.txt
```

The ERROR lines show on screen and are saved in `delivery/report.txt`.

**wc**

```bash
cat input/app.log | grep "E*" | wc
cat input/app.log | grep "E*" | wc -l
```

```text
8  41  304
8
```

**Mistake**
I used `E*` to find ERROR lines. It matched all 8 lines, because `*` means "zero or more of the letter before it". The right command is:

```bash
grep "ERROR" input/app.log | wc -l
```

I also learned that `grep` is case-sensitive.

**Compare**

| Item | Expected | Found |
|---|---|---|
| Total entries | 8 | 8 |
| ERROR entries | 4 | 4 |
| INFO entries | 4 | 4 |
| Different users | 3 | 3 (alice, bob, charlie) |

## 4. Create and test the archive
Each step shows the result you should expect.

**Fix the year in the working copy and compare**

```bash
cd ~/module4-project
sed -i 's/2025-11-24/2026-11-24/' work/app.log
diff input/app.log work/app.log
```

Expected:

```text
2c2
< 2025-11-24 ERROR bob Login failed
---
> 2026-11-24 ERROR bob Login failed
```

**Archive, list and extract**

```bash
cd ~
tar -czvf module4-project.tar.gz module4-project/
tar -tzf module4-project.tar.gz
mkdir ~/module4-restore
tar -xzvf ~/module4-project.tar.gz -C ~/module4-restore
diff -r ~/module4-project ~/module4-restore/module4-project
```

Expected: the list shows the project files, and `diff -r` prints nothing. The archive is saved outside the project so it does not include itself.

**Split, join and compare**

```bash
mkdir ~/module4-chunks
cp ~/module4-project.tar.gz ~/module4-chunks/archive-copy.tar.gz
cd ~/module4-chunks
split -b 200 archive-copy.tar.gz chunk_
ls -lh chunk_*
cat chunk_* > rebuilt.tar.gz
cmp ~/module4-project.tar.gz rebuilt.tar.gz
```

Expected: `cmp` prints nothing, so the files are the same. The chunks must be joined in order. `chunk_*` is already in alphabetical order.

**Truncate (on a test file only)**

```bash
echo "This is important sample data" > truncate-test.txt
truncate -s 0 truncate-test.txt
ls -l truncate-test.txt
```

Expected size: 0 bytes. Truncate keeps the file but cuts its size, so the content is gone. If it is a config, log or backup file, that data is lost. Always keep a separate copy first.

## 5. Final record

**Folder tree**

```text
module4-project/
├── delivery
│   └── report.txt
├── input
│   └── app.log
├── work
│   └── app.log
└── error.txt
```

**Permission checks**
Project folder `750`, original log `440`, working log `640`, report `660` plus ACL. The write test on the original log failed as planned. The read test passed. Tests used my normal account only.

**Report commands**
`grep`, `cut`, `sort`, `uniq`, `wc`, `>`, `>>`, `2>` and `tee`, shown in Part 3.

**One correction**
Capturing stderr: `>> file 2> error.txt` did not work. `{ command; } 2> error.txt` did.

**Restore**

```bash
mkdir ~/module4-recovery
tar -xzvf ~/module4-project.tar.gz -C ~/module4-recovery
tree ~/module4-recovery
```

Check the restored files before replacing anything.

**Cleanup (only this project's files)**

```bash
cd ~
rm -ri ~/module4-recovery
rm -ri ~/module4-restore
rm -ri ~/module4-chunks
rm -ri ~/module4-project
```

I keep `module4-project.tar.gz` until I no longer need the backup. `-i` asks before each removal.

## What I learned
- Permissions, owners and ACLs control who can read or change a file.
- Pipes join small commands into one report.
- `>` replaces, `>>` adds, `2>` catches errors and `tee` does both screen and file.
- An archive that is listed, extracted and compared is a backup I can trust.
- Keep a copy of the original before changing or truncating anything.
