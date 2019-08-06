Fish config and functions for making common tasks more convenient.

## Installation

```sh
# Backup your old ~/.config/fish first, then:
$ git clone https://github.com/razzius/fish-functions ~/.config/fish
```

## File utilities

### `backup <file>`

Moves file to file.bak.

```fish
$ ls
README.md
$ backup README.md
$ ls
README.md.bak
```

### `restore <backup>`

Rename file.bak to file.

### `mc <directory>`

Make a directory and cd into it.

```
$ mc folder
folder $
```

### `cp <file>`

cp with some extra behaviors.

Automatic recursive copy for folders.

If only 1 argument is given, move the file into the current directory.

### `new <project>`

Create a new directory of the project name, enter it,
initialize git, and create a git repo.

```
$ new fish-functions
Initialized empty Git repository in /Users/razzi/forks/fish-functions/.git/
Updating origin
created repository: razzius/fish-functions
fish_functions $
```

### `note <text>`

Append the note text to ~/notes.org. If no note text is provided, the text comes from pasting.

### `post <title>`

Go to my Jekyll blog and create a skeleton Jekyll post with the given title.

Note: this is hardcoded with my blog path

```
$ post Fish functions
$ cat _posts/2017-06-21-fish-functions.md
---
title: Fish functions
date: 2017-06-21
---
```

### `ls`

Like `ls` but hides `__pycache__` and `.pyc` files. Risky...

## `mv-last`

Move the latest download to the current directory.

## Text utilities

### `coln <column>`

Splits its input on whitespace and prints the column indicated.

```
$ echo 1 2 | coln 2
2
```

### `lower`

Converts stdin to lowercase.

```
$ echo A | lower
a
```

### `upper`

Converts stdin to uppercase.

```
$ echo a | upper
A
```

### `skip-lines <n>`

Skips the first n lines of stdin.

```
$ seq 5 | skip-lines 2
3
4
5
```

## git utilities

### `ga`

Like git add, but defaults to `.` if no arguments given, rather than erroring.

### `gc`

`git commit -m` without the need to quote the commit message.

If no commit message is given and there's only 1 file, commit "Update (that file)".

```
$ gc Fix typo in README.md
[master 0078f7f] Fix typo in README.md
1 file changed, 57 insertions(+), 18 deletions(-)
$ git reset @^
Unstaged changes after reset:
M       README.md
$ ga
$ gc
[master c77868d] Update README.md
 1 file changed, 57 insertions(+), 18 deletions(-)
```

### `gcr`

Like `gc` but adds the current branch name at the start of the commit.

Needed for a certain commit style.

```
$ git checkout -b razzi/ticket-1
$ gcr Blah
[razzi/ticket-1 25719b6] [TICKET-1] Blah
 1 file changed, 57 insertions(+), 18 deletions(-)
```

### `git`

Alias for [hub](https://github.com/github/hub)

## Database utilities

### `ensuredb <name>`

Ensure that a fresh database by the name given is created.
Drops a database by that name if it exists.
Clears database connections as necessary.

## Fish utilities

### `fs`

Save the last-edited `fish` function.

```
$ function hi
  echo hi
end
$ fs
Saved hi
```

## Environment utilities

### `readpass <password>`

Prompt for a password. Does not echo entered characters.

```
$ readpass email
$ echo $email
razzi@abuissa.net
```

### `ev <envvar>`

Short for "echo variable".

Like `echo`, but doesn't need the `$` or capitalization. Useful for testing environment variables.

```
$ ev user
razzi
$ echo $USER
razzi
```

## Command utilities

### `dollar`

Remove the starting $ from a shell command and run it. Useful if you're copying stuff and it has `$` signs before commands you're meant to run.

```
$ echo '$ echo hi' | dollar
hi
$ pbpaste | dollar
Somebody made commands
That started with dollars
```

## Markdown utilities

### `md <file>`

Convert a file to markdown and open the resulting html.

## TODO

### `unzip-cd`

Unzip a tar or zip directory and cd into it. If it's a messy tar and doesn't have a toplevel folder, create the folder and move its files into it.
