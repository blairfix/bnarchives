#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable plausible.timer
systemctl start plausible.timer
systemctl restart plausible.timer

