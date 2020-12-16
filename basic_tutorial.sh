#!/bin/bash
# https://www.ubuntupit.com/simple-yet-effective-linux-shell-script-examples/

## echo
echo "Echo for Print"
echo "Printing text"
echo -n "Printing text without newline"
echo -e "\nRemoving \t special \t characters" 
# The -e option is used for telling echo that the string passed to 
# it contains special characters and requires extended functionality.

## The While Loop
echo -e "\nThe While Loop"
i=0

while [ $i -le 2 ]
do
    echo Number: $i
    ((i++))
done

## The For Loop
echo -e "\nThe For Loop"
for (( counter=1; counter<=10; counter++))
do
    echo -n "$counter "
done
printf "\n\n"

## Receive Input from user
echo "Receive Input From User"
echo -n "Please Enter Something: "
read something

echo "You Entered: \"$something\""

## The If Statement
echo -e "\nThe If Statement"
echo -n "Enter a number: "
read num

if [[ $num -gt 10 ]]; then
    echo "Number is greater than 10."
elif [[ $num -eq 10 ]]; then
    echo "Number is equal to 10."
else
    echo "Number is less than 10."
fi

## The Switch Statement
echo -e "\nThe Switch Statement"
echo -n "Enter a number: "
read num

case $num in
    100)
        echo "Hundred!"
        ;;
    200)
        echo "Double Hundred!"
        ;;
    *)
        echo "Neither 100 nor 200" 
        ;;
esac

## Command Line Arguments
echo -e "\nCommand Line Arguments"
echo "Total arguments : $#"
echo "First Argument = $1"
echo "Second Argument = $2"
echo '$@或$*表示脚本的所有参数:'
echo "$*" 
echo "$@" 

## Getting Arguments with Names
echo -e "\nGetting Arguments with Names"
for arg in "$@"
do
    key=$(echo $arg | cut -d= -f1)
    value=$(echo $arg | cut -d= -f2)
    case $key in
        X)
            x=$value
            ;;
        Y)
            y=$value
            ;;
    esac
done
((result=x+y))
echo "X+Y=$result"

## Concatenating Strings
echo -e "\nConcatenating Strings"

string1="Ubuntu"
string2="Pit"
string=$string1$string2
echo "$string is a great resource for Linux beginners."

## Slicing Strings
echo -e "\nSlicing Strings"
Str="Learn Bash Commands from UbuntuPit"
subStr=${Str:0:20}
echo $subStr
#  ${VAR_NAME:Start:Length}

## Extracting Substrings Using Cut
echo -e "\nExtracting Substrings Using Cut"
Str="Learn Bash Commands from UbuntuPit"
#subStr=${Str:0:20}

subStr=$(echo $Str| cut -d ' ' -f 1-3)
echo $subStr

## Function in bash
echo -e "\nFunction in bash"
function Add(){
    echo -n "Enter a Number: "
    read x
    echo -n "Enter another Number: "
    read y
    echo "Adiition is: $(( x+y ))"
}
Add

## Functions with Return Values
echo -e "\nFunctions with Return Values"
function Greet() {
    str="Hello $name, what brings you to UbuntuPit.com?"
    echo $str
}

echo "-> what's your name?"
read name

val=$(Greet)
echo -e "-> $val"

## Creating Directories from Bash Scripts
echo -e "\nCreating Directories from Bash Scripts"
echo -n "Enter directory name ->"
read newdir
cmd="mkdir $newDir"
eval $cmd

## Create a Directory after Confirming Existence
echo -e "\nCreate a Directory after Confirming Existence"
echo -n "Enter directory name ->"
read dir
if [ -d "$dir" ]; then
    echo "Directory exists"
else
    `mkdir $dir`
    echo "Directory created"
fi

## Test File Existence
echo -e "\nTest File Existence"
filename=$1
if [ -f "$filename"]; then
    echo "File Exists"
else
    echo "File does not exist"
fi

## Send Mails from Shell Scripts
echo -e "\n Send Mails from Shell Scripts"
recipient="admin@example.com"
subject="Greetings"
message="Welcome to UbuntuPit"
`mail -s $subject $recipient <<< $message`

## Parsing Date and Time
echo -e "\nParsing Date and Time"
year=`date +%Y`
month=`date +%m`
day=`date +%d`
hour=`date +%H`
minute=`date +%M`
second=`date +%S`
echo `date`
echo "Current Date is: $day-$month-$year"
echo "Current Time is: $hour:$minute:$second"

## Print Number of Files or Directories
echo -e "\nPrint Number of Files or Directories"
if [[ -n "$@" && -d "$@" ]]; then
    echo "Files found: $(find "$@" -type f | wc -l)"
    echo "Folders found: $(find "$@" -type d | wc -l)"
else
    echo "[ERROR] Please retry with another folder."
    exit 1
fi


## Clean Log Files
LOG_DIR=/var/log
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp
echo "Logs cleaned up."

## Removing Duplicate Lines from Files
echo -n "Enter Filename-> "
read filename
if [ -f "$filename" ]; then
    sort $filename | uniq | tee sorted.txt
else
    echo "No $filename in $pwd...try again"
fi
exit 0