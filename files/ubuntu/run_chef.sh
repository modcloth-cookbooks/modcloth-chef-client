#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

source /root/.profile

WAIT=`/usr/bin/expr $RANDOM % 90`

sleep ${WAIT}

chef-client -l info

