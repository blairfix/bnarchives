#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable backup.timer
systemctl start backup.timer
systemctl restart backup.timer

