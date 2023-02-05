# Readme for autoPush Bash Script

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
