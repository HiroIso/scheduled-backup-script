# scheduled-backup-script

### Scenario:
Theis project to create a script called **backup.sh** which runs every day and automatically backs up files that have been updated in the past 24 hours.

### To set up schudele:
1. Run the command in the shell to open cron file.
```
crontab -e
```
2. Add the line to schudule to create a backup file every day at 12 am for example. 
Modify <path to "backup.sh">,  <path to the desired file/directory to backup>, <path to the destinatnion> to specifiy paths.
```
0  0  *  *  *  <Path to "backup.sh"> <Path to the desired file/directory to backup> <Path to the destinatnion>
```
Here is the breakdown of the syntax. The top to bottom in the list alines the arguments from left to right in the syntax respectively. You can modify as you prefered.
* minute (0 - 59)
* hour (0 - 23)
* day of month (1 - 31)
* month (1 - 12) OR jan,feb,mar,apr ...
* day of week (0 - 6) (Sunday=0 or 7) or sun,mon,tue,wed,thu,fri,sat
* command to be executed
