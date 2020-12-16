#!/bin/bash
# 获取随机8位字符串：

echo $RANDOM|md5sum|cut -c 1-8

# 方法二
openssl rand -base64 6

# 方法三

cat /proc/sys/kernel/random/uuid |cut -c 1-8