#!/bin/sh
v='<version>'
git remote add packages https://github.com/openwrt/packages.git
git fetch packages
#git branch --track netdata refs/remotes/packages/openwrt-$v
git checkout packages/openwrt-$v -- admin/netdata/
git diff-index --cached --quiet HEAD admin/netdata/ \
|| (git commit -m "Update netdata-nossl $v" && git push)
