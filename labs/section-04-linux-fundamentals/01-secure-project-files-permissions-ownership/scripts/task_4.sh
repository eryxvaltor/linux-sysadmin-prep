#!/bin/bash
# Task 4: Practice advanced permission control
# Owner: read + write, Group: none, Others: none (600)
cd ~/secure_lab || exit 1
ls -l report.txt
chmod 600 report.txt
ls -l report.txt
