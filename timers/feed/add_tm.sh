#!/usr/bin/bash

mkdir -p ~/.config/systemd/user/
cp *.timer *.service ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable feed.timer
systemctl --user start feed.timer
systemctl --user restart feed.timer
