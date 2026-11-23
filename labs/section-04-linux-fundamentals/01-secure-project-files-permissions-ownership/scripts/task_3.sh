#!/bin/bash
# Task 3: Work with ownership
# List the owner and group, then change the group to "labteam"
cd ~/secure_lab || exit 1
ls -l report.txt
getent group labteam > /dev/null || sudo groupadd labteam
sudo chgrp labteam report.txt
ls -l report.txt
