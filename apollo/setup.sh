#!/usr/bin/zsh

_SETUP_PATH=$(cd `dirname $0`; pwd)

CYBERRT_PATH=$(dirname "$_SETUP_PATH")

BUILD_PATH=$_SETUP_PATH
CYBER_PATH=$_SETUP_PATH/cyber

export GLOG_alsologtostderr=1
export GLOG_colorlogtostderr=1
export GLOG_minloglevel=0
export sysmo_start=0
export CYBER_DOMAIN_ID=80
export CYBER_IP=127.0.0.1
