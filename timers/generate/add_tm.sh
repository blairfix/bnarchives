#!/usr/bin/bash

mkdir -p ~/.config/systemd/user/
cp *.timer *.service ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable generate.timer
systemctl --user start generate.timer
systemctl --user restart generate.timer

cp generate.sh ~/bin
