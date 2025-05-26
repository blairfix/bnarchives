#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable borg.timer
systemctl start borg.timer
systemctl restart borg.timer

