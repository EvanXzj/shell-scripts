#!/bin/bash
OS=`uname -s`

case "$OS" in
FreeBSD) echo "This is FreeBSD" ;;
CYGWIN_NT-5.1) echo "This is Cygwin" ;;
SunOS) echo "This is Solaris" ;;
Darwin) echo "This is Mac OSX" ;;
AIX) echo "This is AIX" ;;
Linux) echo "This is Linux" ;;
Minix) echo "This is Minix" ;;
*) echo "Failed to identify this OS" ;;
esac
