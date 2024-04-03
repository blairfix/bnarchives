#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl disable feed.timer
systemctl stop feed.timer
