# Readme for autoPush Bash Script

This bash script allows you to automatically push repositories.

## Usage

The script can be run without any arguments to automatically push all the repositories defined in the `autoPush.data` file. The format of each line in the `autoPush.data` file should be `<repo_path>;<commit_message>` (without quotes).

To list the defined repositories, run the script with the `-l` or `l` argument:

```bash
./autoPush.sh -l
```
