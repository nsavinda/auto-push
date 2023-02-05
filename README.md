# Git autoPush

This bash script allows you to automatically push repositories.

## Usage

The script can be run without any arguments to automatically push all the repositories defined in the `autoPush.data` file. The format of each line in the `autoPush.data` file should be `<repo_path>;<commit_message>` (without quotes).

```bash
./autoPush.sh
```

To list the defined repositories, run the script with the `-l` or `l` argument:

```bash
./autoPush.sh -l
```

To add a new repository, run the script with the `-a` or `a` argument:

```bash
./autoPush.sh -a
```

To delete a repository, run the script with the `-d` or `d` argument and the index of the repository (as listed with the `-l` argument).

```bash
./autoPush.sh -d <index>
```

## Logging

A log of each push will be added to the autopush.log file in each repository, as well as a log in the autoPush.log file in the directory where the script is located.

# Automating the script using cronjob

To run the script automatically, you can use cronjob. Cronjob allows you to run the script at specified intervals. Here is how you can add the script to cronjob:

1. Open terminal and type `crontab -e`
2. Add the following line at the end of the file,

```
0 0 * * * /path/to/script/autoPush.sh > /dev/null 2>&1
```

Explanation:

- `0 0 * * *` - This line specifies the schedule at which the script will run, in this case, every day at midnight.
- `/path/to/script/autoPush.sh` - Replace this with the actual path of the script on your system.
- `> /dev/null 2>&1` - This line is used to redirect the output of the script to /dev/null so that the output will not interfere with other cronjob output.

3. Save and close the file.
4. Now, the script will run automatically every day at midnight.
