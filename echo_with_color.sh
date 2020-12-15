#!/bin/bash
function echo_with_color() {
    case $1 in 
        red)
            echo -e "\033[31;40m$2\033[0m"
            ;;
        green)
            echo -e "\033[32;40m$2\033[0m" 
            ;;
        *)
            echo $1
            echo "Example: echo_color red string"
    esac
}

echo_with_color green "hello world"