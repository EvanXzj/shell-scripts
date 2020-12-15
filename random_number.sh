#!/bin/bash
# 获取随机8位数字：

# 方法一
echo $RANDOM | cksum | cut -c 1-8
# 方法二
openssl rand -base64 4 | cksum | cut -c 1-8 
# 方法三
date +%N | cksum | cut -c 1-8 

# cksum：打印CRC效验和统计字节