#!/bin/bash

PATH="/mysql/bin:/mysql/libexec:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin"

WAIT=`/opt/local/bin/expr $RANDOM % 90`

sleep ${WAIT}

chef-client -l info

