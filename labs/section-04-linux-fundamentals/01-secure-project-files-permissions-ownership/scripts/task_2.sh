#!/bin/bash
# Task 2: Change file permissions
# Owner: read + write, Group: read, Others: no permission (640)
cd ~/secure_lab || exit 1
ls -l report.txt
chmod 640 report.txt
ls -l report.txt
