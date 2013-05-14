#!/bin/bash

PATH="/mysql/bin:/mysql/libexec:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin"

source /root/.bash_profile

WAIT=`/opt/local/bin/expr $RANDOM % 90`

sleep ${WAIT}

chef-client -l info

