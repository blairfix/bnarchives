#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable generate.timer
systemctl start generate.timer
systemctl restart generate.timer

