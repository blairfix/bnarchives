#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable sitemap.timer
systemctl start sitemap.timer
systemctl restart sitemap.timer

cp gen_sitemap.sh /home/eprints/bin

