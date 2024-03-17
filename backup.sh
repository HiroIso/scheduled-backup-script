#!/bin/bash

# Check if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# Set two variables equal to the values of the first and second command line arguments
targetDirectory=$1
destinationDirectory=$2

# Display the values of the two command line arguments in the terminal.
echo "Target directory: $1"
echo "Destination directory: $2"

# Define a variable as the current timestamp, expressed in seconds.
currentTS=`date +%s`

# Define a variable to store the name of the archived and compressed backup file that the script will create.
backupFileName="backup-$currentTS.tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# Define a variable with the absolute path of the current directory as the variable's value.
origAbsPath=`pwd`

# Define a variable whose value equals the absolute path of the destination directory.
cd $destinationDirectory # <- to the destination directory
destDirAbsPath=`pwd`

# Change directories from the current working directory to the target directory.
cd $origAbsPath # <- to the original directory
cd $targetDirectory  # <- to the target directory

# Define a numerical variable as the timestamp (in seconds) 24 hours prior to the current timestamp.
yesterdayTS=$(($currentTS - 24 * 60 * 60 ))
# to display current date_time format: 
# date -d @$currentTS "+%Y%m%d%H:%M:%S"
# to display current date_time format: 
# date -d @$yesterdayTS "+%Y%m%d%H:%M:%S" 

# It declares the variable "toBackup", which is an array contains a list of values.
declare -a toBackup

# Add "$file" (all files and directories in the currentfolder) that was updated in the past 24 hours to the "toBackup" array.
for file in $(ls)
do
  if ((`date -r $file +%s` > $yesterdayTS))
  then
    toBackup+=($file)
  fi
done

# compress and archive the files, using the $toBackup array of filenames, to a file with the name backupFileName.
tar -czvf $backupFileName ${toBackup[@]}

# Move the backup file to the destination directory
mv $backupFileName $destDirAbsPath

