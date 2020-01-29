Config and functions for the [Fish Shell](https://fishshell.org), making common tasks more convenient.

## Installation

```sh
# Backup your old ~/.config/fish first, then:
$ git clone https://github.com/razzius/fish-functions ~/.config/fish
```

## Contents

- [File Manipulation](#file-manipulation)
  * [`backup`](#backup-file-source)
  * [`restore`](#restore-file-source)
  * [`mkdir-cd`](#mkdir-cd-directory-source)
  * [`copy`](#copy-source-destination-source)
  * [`remove`](#remove-target-source)
  * [`unzip-cd`](#unzip-cd-zipfile)
- [Text Utilities](#text-utilities)
  * [`coln`](#coln-number-source)
  * [`row`](#row-number-source)
  * [`skip-lines`](#skip-lines-number-source)
  * [`take`](#take-lines-number-source)
- [`fish` Utilities](#fish-utilities)
  * [`exists`](#exists-file)
  * [`funcsave-last`](#funcsave-last)
  * [`any-arguments`](#any-arguments-argv)
  * [`confirm`](#confirm)
- [Environment Utilities](#environment-utilities)
  * [`echo-variable`](#echo-variable-envvar)
  * [`readpass`](#readpass-variable)
- [Symlink Utilities](#symlink-utilities)
  * [`symlink`](#symlink-from-to)
  * [`unsymlink`](#unsymlink-file)
  * [`symlinks`](#symlinks-directory)
  * [`link-rc`](#link-rc-file)
- [`git` Utilities](#git-utilities)
  * [`wip`](#wip-message)
  * [`git-add`](#git-add-arguments)
  * [`git-commit`](#git-commit-message)
  * [`git-add-commit`](#git-add-commit-message)
- [Postgres Utilities](#postgres-utilities)
  * [`ensuredb`](#ensuredb-name)
  * [`renamedb`](#renamedb-from-to)
- [Date Utilities](#date-utilities)
  * [`isodate`](#isodate)
- [MacOS Utilities](#macos-utilities)
  * [`move-last-download`](#move-last-download)
  * [`wifi-network-name`](#wifi-network-name)
  * [`wifi-password`](#wifi-password)
  * [`wifi-reset`](#wifi-reset)

## File Manipulation

### `backup <file>` [(source)](functions/backup.fish)

Creates a copy of `file` as `file.bak`.

```fish
$ ls
README.md
$ backup README.md
$ ls
README.md  README.md.bak
```

Recommended abbreviation: `abbr -a bk backup`

### `restore <backup>` [(source)](functions/restore.fish)

Rename a backup such as `file.bak` to remove the `.bak` extension.

```fish
$ ls
README.md README.md.bak
$ restore README.md.bak
$ ls
README.md
```

Recommended abbreviation: `abbr -a re restore`

### `mkdir-cd <directory>`

Make a directory and cd into it.

```
$ mkdir-cd folder
folder $
```

Recommended abbreviation: `abbr -a mc mkdir-cd`

### `copy <source> ... [<destination>]`

`cp` with some extra behaviors.

Automatic recursive copy for directories.

If only 1 argument is given, move the argument file into the current directory.

Recommended abbreviation: `abbr -a cp copy`. If you do this abbreviation, use `command cp` for the low-level `cp`.

### `remove <target>`

`rm` with an extra behavior.

If removing a directory with write-protected `.git`, confirm once to ensure the git directory is desired to be removed.

```
$ ls -a dodo
.  ..  .git  x
$ remove dodo
Remove .git directory dodo/.git?> y
```

Using plain `rm`:

```
$ rm -r dodo
override r--r--r--  razzi/staff for dodo/.git/objects/58/05b676e247eb9a8046ad0c4d249cd2fb2513df? y
override r--r--r--  razzi/staff for dodo/.git/objects/f3/7f81fa1f16e78ac451e2d9ce42eab8933bd99f? y
override r--r--r--  razzi/staff for dodo/.git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391? ^C
$ rm -rf dodo
```

Recommended abbreviation: `abbr -a rm remove`. If you do this abbreviation, use `command rm` for the low-level `rm`.

### `unzip-cd`

Unzip a zip directory and cd into it. If doesn't have a toplevel folder, create a folder and move its files into it.

## Text Utilities

### `coln <column>`

Splits its input on whitespace and prints the column indicated.

```
$ echo 1 2 | coln 2
2
```

### `skip-lines <n>`

Skips the first n lines of stdin.

```
$ seq 5 | skip-lines 2
3
4
5
```

### `take <n>`

Take the first `n` lines of stdin.
```
$ seq 5 | take 3
1
2
3
```

## `fish` utilities

### `exists <file>`

Test if `$file` exists.

### `funcsave-last`

Save the last-edited `fish` function.

```
$ function hi
  echo hi
end
$ funcsave-last
Saved hi
```

Recommended abbreviation: `abbr -a fs funcsave-last`.

### any-arguments

Check if any arguments were passed to a fish function.

```
$ function something
    if any-arguments $argv
        echo Arguments were passed
    else
        echo No arguments passed
    end
end
$ something
No arguments passed
$ something 1
Arguments were passed
```

### `confirm`

Prompts the user for confirmation. Exit with status according to whether they answered `y`, `Y`, `yes`, or `YES`.

## Environment Utilities

### `echo-variable <envvar>`

Like `echo`, but doesn't need the `$` or capitalization.

```
$ echo-variable user
razzi
$ echo $USER
razzi
```

Recommended abbreviation: `abbr -a ev echo-variable`.

### `readpass <name>`

Prompt for a password. Does not echo entered characters.

```
$ readpass email
●●●●●●●●●●●●●●●●●
$ echo $email
razzi@abuissa.net
```

## symlink utilities

### `symlink <from> <to>`

Create a symbolic link, using absolute paths.

```
~/dotfiles $ symlink .prettierrc ~
~/dotfiles $ cat ~/.prettierrc
singleQuote: true
semi: false
```

Without using absolute paths:

```
~/dotfiles $ ln -s .prettierrc ~
~/dotfiles $ cat ~/.prettierrc
cat: /Users/razzi/.prettierrc: Too many levels of symbolic links
```


### `unsymlink <file>`

Removes a symlink. Errors if the file is not a symlink.

### `symlinks [<dir>]`

Lists symlinks in the given directory, or the current directory if none is passed.

### `link-rc [<file>]`

Create a symlink from the file to the home directory (`~`).

## git utilities

### `wip [message]`

Adds untracked changes and commits them with a WIP message. Additional arguments are added to the WIP message.

I use this instead of `git stash` so that changes are associated with the branch they're on, and the commit is tracked in the reflog.

```fish
$ git stat
## master
M      tests.py
$ git switch -c testing
$ wip failing tests
[testing 0078f7f] WIP failing tests
$ git switch -
```

### `git-add`

Like `git add`, but defaults to `.` if no arguments given, rather than erroring.

### `git-commit`

Like `git commit -m` without the need to quote the commit message.

If no commit message is given and there's only 1 file changed, commit "(Add / Update / Delete) (that file)".

```
$ gc Fix typo in README.md
[master 0078f7f] Fix typo in README.md
1 file changed, 57 insertions(+), 18 deletions(-)
$ git reset @^
Unstaged changes after reset:
M       README.md
$ git-add
$ git-commit
[master c77868d] Update README.md
 1 file changed, 57 insertions(+), 18 deletions(-)
```

### `git-add-commit`

Combines `git add -u` with `git-commit`.

```
$ git status -s
M       README.md
$ git-add-commit Add installation instructions
[master c77868d] Add installation instructions
 1 file changed, 57 insertions(+), 18 deletions(-)
```

## Postgres Utilities

### `ensuredb <name>`

Ensure that a fresh database by the name given is created.
Drops a database by that name if it exists, clearing database connections as necessary.

### `renamedb <from> <to>`

Renames a database.

## Date Utilities

### `isodate`

Prints the date in ISO format.

```
$ isodate
2020-01-28
```

## MacOS Utilities

### `move-last-download`

Move the latest download to the current directory.

### `wifi-network-name`

Prints the current wifi network name.

### `wifi-password`

Prints the current wifi network password.

### `wifi-reset`

Turns the wifi off and on again.
