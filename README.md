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
* month (1 - 12)
* day of week (0 - 6) (Sunday=0)
* command to be executed

The first five fields may contain one or more values separated by a comma or a range of values separated by a hyphen.

( * ) The asterisk operator means any value or always. If you have the asterisk symbol in the Hour field, it means the task will be performed each hour.

( , ) The comma operator allows you to specify a list of values for repetition. For example, if you have 1,3,5 in the Hour field, the task will run at 1 a.m., 3 a.m. and 5 a.m.

( - ) The hyphen operator allows you to specify a range of values. If you have 1-5 in the Day of week field, the task will run every weekday (from Monday to Friday).

( / ) The slash operator allows you to specify values that will be repeated over a certain interval between them. For example, if you have */4 in the Hour field, it means the action will be performed every four hours. It is same as specifying 0,4,8,12,16,20. Instead of an asterisk before the slash operator, you can also use a range of values. For example, 1-30/10 means the same as 1,11,21.
