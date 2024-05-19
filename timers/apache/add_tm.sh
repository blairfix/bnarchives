#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable apache_restart.timer
systemctl start apache_restart.timer
systemctl restart apache_restart.timer

