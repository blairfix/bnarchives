#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable feed.timer
systemctl start feed.timer
systemctl restart feed.timer
