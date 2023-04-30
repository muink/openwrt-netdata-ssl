#!/bin/sh
git remote add packages https://github.com/openwrt/packages.git
git fetch packages
git branch --track netdata refs/remotes/packages/master
git checkout netdata -- admin/netdata/
git diff-index --cached --quiet HEAD admin/netdata/ \
|| (git commit -m "Update netdata-nossl" && git push)
