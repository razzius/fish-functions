Config and functions for the [Fish Shell](https://fishshell.org), making common tasks more convenient.

## Installation

```sh
# Backup your old ~/.config/fish first, then:
$ git clone https://github.com/razzius/fish-functions ~/.config/fish
```

## Contents

- [File Manipulation](#file-manipulation)
  * [`backup`](#backup-file-source)
  * [`restore`](#restore-backup-source)
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
  * [`exists`](#exists-file-source)
  * [`funcsave-last`](#funcsave-last-source)
  * [`any-arguments`](#any-arguments-argv-source)
  * [`confirm`](#confirm-source)
- [Environment Utilities](#environment-utilities)
  * [`echo-variable`](#echo-variable-envvar-source)
  * [`readpass`](#readpass-variable-source)
- [Symlink Utilities](#symlink-utilities)
  * [`symlink`](#symlink-from-to-source)
  * [`unsymlink`](#unsymlink-file-source)
  * [`symlinks`](#symlinks-directory-source)
  * [`link-rc`](#link-rc-file-source)
- [`git` Utilities](#git-utilities)
  * [`clone-cd`](#clone-cd-url-source)
  * [`wip`](#wip-message-source)
  * [`git-add`](#git-add-arguments)
  * [`git-commit`](#git-commit-message-source)
  * [`git-add-commit`](#git-add-commit-message-source)
- [Postgres Utilities](#postgres-utilities)
  * [`ensuredb`](#ensuredb-name-source)
  * [`renamedb`](#renamedb-from-to-source)
- [Date Utilities](#date-utilities)
  * [`isodate`](#isodate-source)
- [MacOS Utilities](#macos-utilities)
  * [`move-last-download`](#move-last-download-source)
  * [`wifi-network-name`](#wifi-network-name-source)
  * [`wifi-password`](#wifi-password-source)
  * [`wifi-reset`](#wifi-reset-source)

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

### `mkdir-cd <directory>` [(source)](functions/mkdir-cd.fish)

Make a directory and cd into it.

```fish
$ mkdir-cd folder
folder $
```

Recommended abbreviation: `abbr -a mc mkdir-cd`

### `copy <source> ... [<destination>]` [(source)](functions/copy.fish)

`cp` with some extra behaviors.

Automatic recursive copy for directories.

If only 1 argument is given, move the argument file into the current directory.

Recommended abbreviation: `abbr -a cp copy`. If you do this abbreviation, use `command cp` for the low-level `cp`.

### `remove <target>` [(source)](functions/remove.fish)

`rm` with an extra behavior.

If removing a directory with write-protected `.git`, confirm once to ensure the git directory is desired to be removed.

```fish
$ ls -a dodo
.  ..  .git  x
$ remove dodo
Remove .git directory dodo/.git?> y
```

Using plain `rm`:

```fish
$ rm -r dodo
override r--r--r--  razzi/staff for dodo/.git/objects/58/05b676e247eb9a8046ad0c4d249cd2fb2513df? y
override r--r--r--  razzi/staff for dodo/.git/objects/f3/7f81fa1f16e78ac451e2d9ce42eab8933bd99f? y
override r--r--r--  razzi/staff for dodo/.git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391? ^C
$ rm -rf dodo
```

Recommended abbreviation: `abbr -a rm remove`. If you do this abbreviation, use `command rm` for the low-level `rm`.

### `clean-unzip` [(source)](functions/clean-unzip.fish)

Unzips a `.zip` archive without polluting the current directory, by creating a
directory even if the zipfile does not have a folder level.

### `unzip-cd` [(source)](functions/unzip-cd.fish)

Unzip a zip directory and cd into it. Uses `clean-unzip` to create a folder if
the zipfile doesn't have one.

```fish
$ unzip-cd files.zip
Archive:  files.zip
 extracting: out/a.txt
 extracting: out/b.txt
files $ ls
a.txt  b.txt
```

## Text Utilities

### `coln <column>` [(source)](functions/coln.fish)

Splits its input on whitespace and prints the column indicated.

```fish
$ echo 1 2 | coln 2
2
```

### `skip-lines <n>` [(source)](functions/skip-lines.fish)

Skips the first n lines of stdin.

```fish
$ seq 5 | skip-lines 2
3
4
5
```

### `take <n>` [(source)](functions/take.fish)

Take the first `n` lines of stdin.
```fish
$ seq 5 | take 3
1
2
3
```

## `fish` utilities

### `exists <file>` [(source)](functions/exists.fish)

Test if `$file` exists.

### `funcsave-last` [(source)](functions/funcsave-last.fish)

Save the last-edited `fish` function.

```fish
$ function hi
  echo hi
end
$ funcsave-last
Saved hi
```

Recommended abbreviation: `abbr -a fs funcsave-last`.

### `any-arguments <argv>` [(source)](functions/any-arguments.fish)

Check if any arguments were passed to a fish function.

```fish
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

### `confirm` [(source)](functions/confirm.fish)

Prompts the user for confirmation. Exit with status according to whether they answered `y`, `Y`, `yes`, or `YES`.

## Environment Utilities

### `echo-variable <envvar>` [(source)](functions/echo-variable.fish)

Like `echo`, but doesn't need the `$` or capitalization.

```fish
$ echo-variable user
razzi
$ echo $USER
razzi
```

Recommended abbreviation: `abbr -a ev echo-variable`.

### `readpass <name>` [(source)](functions/readpass.fish)

Prompt for a password. Does not echo entered characters.

```fish
$ readpass email
●●●●●●●●●●●●●●●●●
$ echo $email
razzi@abuissa.net
```

## symlink utilities

### `symlink <from> <to>` [(source)](functions/symlink.fish)

Create a symbolic link, using absolute paths.

```fish
~/dotfiles $ symlink .prettierrc ~
~/dotfiles $ cat ~/.prettierrc
singleQuote: true
semi: false
```

Without using absolute paths:

```fish
~/dotfiles $ ln -s .prettierrc ~
~/dotfiles $ cat ~/.prettierrc
cat: /Users/razzi/.prettierrc: Too many levels of symbolic links
```


### `unsymlink <file>` [(source)](functions/unsymlink.fish)

Removes a symlink. Errors if the file is not a symlink.

### `symlinks [<dir>]` [(source)](functions/symlinks.fish)

Lists symlinks in the given directory, or the current directory if none is passed.

### `link-rc [<file>]` [(source)](functions/link-rc.fish)

Create a symlink from the file to the home directory (`~`).

## git utilities

### `clone-cd url` [(source)](functions/clone-cd.fish)

Clones a `git` repository and `cd`s into it.

### `wip [message]` [(source)](functions/wip.fish)

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

### `git-add` [(source)](functions/git-add.fish)

Like `git add`, but defaults to `.` if no arguments given, rather than erroring.

### `git-commit` [(source)](functions/git-commit.fish)

Like `git commit -m` without the need to quote the commit message.

If no commit message is given and there's only 1 file changed, commit "(Add / Update / Delete) (that file)".

```fish
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

### `git-add-commit` [(source)](functions/git-add-commit.fish)

Combines `git add -u` with `git-commit`.

```fish
$ git status -s
M       README.md
$ git-add-commit Add installation instructions
[master c77868d] Add installation instructions
 1 file changed, 57 insertions(+), 18 deletions(-)
```

## Postgres Utilities

### `ensuredb <name>` [(source)](functions/ensuredb.fish)

Ensure that a fresh database by the name given is created.
Drops a database by that name if it exists, clearing database connections as necessary.

### `renamedb <from> <to>` [(source)](functions/renamedb.fish)

Renames a database.

## Date Utilities

### `isodate` [(source)](functions/isodate.fish)

Prints the date in ISO format.

```fish
$ isodate
2020-01-28
```

## MacOS Utilities

### `move-last-download` [(source)](functions/move-last-download.fish)

Move the latest download to the current directory.

Recommended abbreviation: `abbr -a mvl move-last-download`.

### `wifi-network-name` [(source)](functions/wifi-network-name.fish)

Prints the current wifi network name.

### `wifi-password` [(source)](functions/wifi-password.fish)

Prints the current wifi network password.

### `wifi-reset` [(source)](functions/wifi-reset.fish)

Turns the wifi off and on again.
