#!/usr/bin/bash

cp *.timer *.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable indexer.timer
systemctl start indexer.timer
systemctl restart indexer.timer

cp indexer.sh /home/eprints/bin
