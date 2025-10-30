Functions for the [Fish Shell](https://fishshell.com), making common tasks more convenient.

## Installation

Backup any existing `~/.config/fish`, then:

```sh
git clone https://git.sr.ht/~razzi/fish-functions ~/.config/fish
```

In previous versions, other fish config including abbrs were included as well.
That changed much more frequently than the functions, so I split them out.

Now they are at https://git.sr.ht/~razzi/.dotfiles (see that repository's README for installation instructions).

## Contents

- [`fish` Interactive Utilities](#fish-interactive-utilities)
  * [`abbr-add`](#abbr-add)
  * [`abbr-erase`](#abbr-erase)
  * [`clip`](#clip)
  * [`funced-last`](#funced-last)
  * [`funcsave-last`](#funcsave-last)
  * [`mkdir-cd`](#mkdir-cd)
- [File Manipulation](#file-manipulation)
  * [`backup`](#backup)
  * [`copy`](#copy)
  * [`create-file`](#create-file)
  * [`eat`](#eat)
  * [`move`](#move)
  * [`move-last-download`](#move-last-download)
  * [`remove`](#remove)
  * [`restore`](#restore)
- [Zipfile Utilities](#zipfile-utilities)
  * [`clean-unzip`](#clean-unzip-zipfile-source)
  * [`unzip-cd`](#unzip-cd-zipfile-source)
- [Text Utilities](#text-utilities)
  * [`coln`](#coln-number-source)
  * [`row`](#row-number-source)
  * [`skip-lines`](#skip-lines-number-source)
  * [`take`](#take-lines-number-source)
  * [`word-count`](#word-count-source)
  * [`line-count`](#line-count-source)
  * [`char-count`](#char-count-source)
- [`fish` Scripting Utilities](#fish-utilities)
  * [`string-empty`](#string-empty-empty-value-source)
  * [`file-exists`](#file-exists-file-source)
  * [`is-dir`](#is-dir-file-source)
  * [`is-symlink`](#is-symlink-file-source)
  * [`confirm`](#confirm-source)
- [Environment Utilities](#environment-utilities)
  * [`curdir`](#curdir-source)
  * [`echo-variable`](#echo-variable-variable-source)
  * [`readpass`](#readpass-name-source)
- [Symlink Utilities](#symlink-utilities)
  * [`symlink`](#symlink-from-to-source)
  * [`unsymlink`](#unsymlink-file-source)
  * [`symlinks`](#symlinks-dir-source)
  * [`link-rc`](#link-rc-file-source)
- [`git` Utilities](#git-utilities)
  * [`clone-cd`](#clone-cd-url-destination-source)
  * [`clone-shallow-cd`](#clone-shallow-cd-url-destination-source)
  * [`wip`](#wip-message-source)
  * [`git-add`](#git-add-paths-source)
  * [`git-commit`](#git-commit-message-source)
  * [`git-protocol-https-to-git`](#git-protocol-https-to-git-source)
  * [`gitignore`](#gitignore-pattern-source)
- [`lima` Utilities](#lima-utilities)
  * [`lima-ssh`](#lima-ssh-name-source)
  * [`lima-vnc`](#lima-vnc-source)
- [`vim` Utilities](#vim-utilities)
  * [`vim-plugin`](#vim-plugin-url-source)
- [Postgres Utilities](#postgres-utilities)
  * [`ensuredb`](#ensuredb-name-source)
  * [`renamedb`](#renamedb-from-to-source)
- [Date Utilities](#date-utilities)
  * [`isodate`](#isodate-source)
  * [`isodatetime`](#isodatetime-source)
- [debian Utilities](#debian-utilities)
  * [`apt-description`](apt-description-package-source)
- [macOS Utilities](#macos-utilities)
  * [`wifi-network-name`](#wifi-network-name-source)
  * [`wifi-password`](#wifi-password-source)
  * [`wifi-reset`](#wifi-reset-source)

<h2 id="fish-interactive-utilities">

`fish` Interactive Utilities

</h2>

Fish functions designed to be typed and run in the shell.

<h3 id="abbr-add">

`abbr-add <name> <expansion> [<args>]` [(source)](functions/abbr-add.fish)

</h3>

Adds an abbr and syncs your abbrs to `~/.config/fish/conf.d/abbrs.fish`.

This way the abbr will be loaded the next time you open your shell.

Without `abbr-add`, you can use `abbr -a` to make your own abbrs,
and add `abbr -a` calls to your fish config manually,
but I recommend using `abbr-add` and tracking
`~/.config/fish/conf.d/abbrs.fish` in version control.

All `abbr` options are passed to this command, so for example you can run:

```fish
$ abbr-add --position anywhere isntall install
```

Recommended abbreviation: `abbr-add ab abbr-add`

<h3 id="abbr-erase">

`abbr-erase <name>` [(source)](functions/abbr-erase.fish)

</h3>

Erases an abbr and removes it from `~/.config/fish/conf.d/abbrs.fish`.

Recommended abbreviation: `abbr-add ae abbr-erase`

[Completion](completions/abbr-erase.fish): completes abbr names.

<h3 id="clip">

`clip [args]` [(source)](functions/clip.fish)

</h3>

Copies the arguments that follow `clip` to the clipboard.

```fish
$ clip cat ~/.ssh/id_ed25519.pub
# now "cat ~/.ssh/id_ed25519.pub" is on the clipboard
$ echo (fish_clipboard_paste)
cat ~/.ssh/id_ed25519.pub
```

This is useful when you want to copy a command to your clipboard
(possibly to paste the command into documentation).

You can press the up arrow or `control+p` to get to the previous command,
then hit `control-a` to move your cursor to the start, prepend `clip `,
and you can quickly copy a command.

If you want to copy the _output_ of a command, pipe it to `fish_clipboard_copy`:

```fish
$ echo 1 | fish_clipboard_copy
$ echo (fish_clipboard_paste)
1
```

<h3 id="funced-last">

`funced-last` [(source)](functions/funced-last.fish)

</h3>

Edit the last-edited `fish` function again.

<h3 id="funcsave-last">

`funcsaved-last` [(source)](functions/funcsave-last.fish)

</h3>


Save the last-edited `fish` function.

```fish
$ function hi
  echo hi
end
$ funcsave-last
funcsave: wrote /Users/razzi/.config/fish/functions/hi.fish
```

Recommended abbreviation: `abbr-add fs funcsave-last`

<h3 id="mkdir-cd">

`mkdir-cd` <directory> [(source)](functions/mkdir-cd.fish)

</h3>

Make a directory and cd into it.

```fish
$ mkdir-cd folder
folder $
```

Recommended abbreviation: `abbr-add mc mkdir-cd`

## File Manipulation

<h3 id="backup">

`backup <file>` [(source)](functions/backup.fish)

</h3>

Creates a copy of `file` as `file.bak`.

```fish
$ ls
README.md
$ backup README.md
$ ls
README.md  README.md.bak
```

<h3>

`copy <source> ... [<destination>]` [(source)](functions/copy.fish)

</h3>

`cp` with some extra behaviors.

Automatic recursive copy for directories. Rather than only copying the files from a directory, copies the directory itself.

Also uses -i flag by default, which will warn you if a copy would overwrite a destination file.

Example:

```fish
$ mkdir testdir
$ touch testdir/file.txt
$ mkdir destdir

# Standard cp needs -r flag
$ cp testdir/ destdir/
cp: testdir/ is a directory (not copied).

# And does not preserve the source folder
$ cp -r testdir/ destdir/
$ ls destdir/
file.txt

# Cleaning up...
$ rm destdir/file.txt

# In contrast, using `copy` function:
$ copy testdir/ destdir/
$ ls destdir/
testdir
```

Recommended abbreviation: `abbr-add cp copy`

If you do this abbreviation, use `command cp` for the low-level `cp`.

<h3>

`create-file <target>` [(source)](functions/create-file.fish)

</h3>

Creates a file, including parent directories as necessary.

```fish
$ create-file a/b/c
$ tree
.
└── a
    └── b
        └── c
```

<h3>

`eat <target>` [(source)](functions/eat.fish)

</h3>

Moves a directory's contents to the current directory and removes the empty directory.

```fish
$ tree
.
└── a
    └── b
        └── c
$ eat a
$ tree
.
└── b
    └── c
```

If a file in the current directory would be overwritten by `eat`, it will error with exit status 1.

An illustration of this:

```fish
$ tree
.
├── dir-a
│   └── dir-b
│       └── some_file
└── dir-b
    └── would_be_overwritten

3 directories, 3 files
$ eat dir-a
eat: file would be overwritten: ./dir-b
```

<h3>

`move <source> ... <destination>` [(source)](functions/move.fish)

</h3>

Like `mv` but uses `-i` flag by default,
which will warn you if `mv` would overwrite a destination file.

Also warns you if you are trying to move a directory symlink which is ending in slash:

```fish
$ mkdir mydir
$ ln -s mydir mylink
$ mv mylink/ renamed
mv: cannot move 'mylink/' to 'renamed': Not a directory
```

`move` gives a more descriptive error:

```fish
$ move mylink/ renamed
move: `from` argument "mylink/" is a symlink with a trailing slash.
move: to rename a symlink, remove the trailing slash from the argument.
```

This arises because tab completion adds the slash. Completion for `move` could avoid the slash, but then again you might want to move a file within the symlinked directory.

<h3 id="move-last-download">

`move-last-download [<dest>]` [(source)](functions/move-last-download.fish)

</h3>

Move the latest download to destination directory, which is the current directory if none is specified.

Recommended abbreviation: `abbr-add mvl move-last-download`

<h3 id="remove">

`remove <target>` [(source)](functions/remove.fish)

</h3>

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

Recommended abbreviation: `abbr-add rm remove`

If you do this abbreviation, use `command rm` for the low-level `rm`.

<h3 id="restore">

`restore <backup>` [(source)](functions/restore.fish)

</h3>

Rename a backup such as `file.bak` to remove the `.bak` extension.

```fish
$ ls
README.md README.md.bak
$ restore README.md.bak
$ ls
README.md
```

## Zipfile Utilities

### `clean-unzip <zipfile>` [(source)](functions/clean-unzip.fish)

Unzips a `.zip` archive without polluting the current directory, by creating a
directory even if the zipfile does not have a folder level.

### `unzip-cd <zipfile>` [(source)](functions/unzip-cd.fish)

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

### `coln <number>` [(source)](functions/coln.fish)

Splits input on whitespace and prints the column indicated.

```fish
$ echo 1 2 | coln 2
2
```

### `row <number>` [(source)](functions/row.fish)

Prints the row of input indicated.

```fish
$ seq 3 | row 2
2
```

### `skip-lines <number>` [(source)](functions/skip-lines.fish)

Skips the first n lines of stdin.

```fish
$ seq 5 | skip-lines 2
3
4
5
```

### `take <n>` [(source)](functions/take.fish)

Take the first `n` lines of standard input.
```fish
$ seq 5 | take 3
1
2
3
```

### `word-count` [(source)](functions/word-count.fish)

Count the words from standard input. Like `wc -w` but does not put spaces around the number.

```fish
$ echo a b | word-count
2
# Compare to:
$ echo a b | wc -w
       2
```

### `line-count` [(source)](functions/line-count.fish)

Count the lines from standard input. Like `wc -l` but does not put spaces around the number.

```fish
$ seq 3 | line-count
3
# Compare to:
$ seq 3 | wc -l
       3
```

### `char-count` [(source)](functions/char-count.fish)

Count the characters from standard input. Like `wc -c` but does not put spaces around the number.

```fish
$ echo -n a b | char-count
3
# Compare to:
$ echo -n a b | wc -c
       3
```

## `fish` Scripting utilities

### `string-empty <value>` [(source)](functions/string-empty.fish)

Test if the value is the empty string.

```fish
$ string-empty ''
$ echo $status
0
```

Can be used to test for arguments:

```fish
$ function something
    if string-empty $argv
        echo No arguments passed
    else
        echo Arguments were passed
    end
end
$ something
No arguments passed
$ something 1
Arguments were passed
```

If you use this on a variable, be sure to get the variable's *value* using `$`:

```fish
$ if string-empty $VIRTUAL_ENV
    echo in venv
  end
```

since `string-empty VIRTUAL_ENV` will always return `false`.

### `file-exists <file>` [(source)](functions/file-exists.fish)

Test if `$file` exists.

### `is-dir <path>` [(source)](functions/is-dir.fish)

Check if `$path` is a directory.

### `is-symlink <path>` [(source)](functions/is-symlink.fish)

Check if `$path` is a symlink.

### `confirm` [(source)](functions/confirm.fish)

Prompts the user for confirmation. Exit with status according to whether they answered `y`, `Y`, `yes`, or `YES`.

## Environment Utilities

### `curdir` [(source)](functions/curdir.fish)

Just the current directory name, please.

```fish
mydir $ curdir
mydir
```

You probably won't need this interactively since the current directory is usually part of your `fish_prompt`,
but this is useful for scripting.

### `echo-variable <variable>` [(source)](functions/echo-variable.fish)

Like `echo`, but without the `$` or capitalization.

```fish
$ echo-variable user
razzi
$ echo $USER
razzi
```

Recommended abbreviation: `abbr-add ev echo-variable`

[Completion](completions/echo-variable.fish): completes environment variable names.

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

Remove a symlink. Errors if the file is not a symlink.

Recommended abbreviation: `abbr-add us unsymlink`

### `symlinks [<dir>]` [(source)](functions/symlinks.fish)

List symlinks in the given directory, or the current directory if none is passed.

### `link-rc [<file>]` [(source)](functions/link-rc.fish)

Create a symlink from `$file` to the home directory (`~`).

Sample usage:

```fish
.dotfiles $ link-rc .tmux.conf
.dotfiles $ head -1 ~/.tmux.conf
set -g prefix ^Space
```

Recommended abbreviation: `abbr-add lrc link-rc`

## git utilities

### `clone-cd url [destination]` [(source)](functions/clone-cd.fish)

Clone a `git` repository into the current directory (or the optional `$destination`), and `cd` into it.

If a folder by that name already exists, great, you probably already cloned it, just cd into the directory and pull.

If it's trying to clone into a non-empty directory, make a new folder in that directory with the repository name and clone into that, instead of erroring.

Recommended abbreviation: `abbr-add cc clone-cd`

### `clone-shallow-cd url [destination]` [(source)](functions/clone-shallow-cd.fish)

Like `clone-cd` but clones with `--depth=1` for speed.

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

### `git-add [paths]` [(source)](functions/git-add.fish)

A wrapper for `git add` that defaults to `git add .` if no arguments given, rather than erroring.

Recommended abbreviation: `abbr-add ga git-add`

### `git-commit [message]` [(source)](functions/git-commit.fish)

Like `git commit -m` without the need to quote the commit message.

If no commit message is given and there's only 1 file changed, commit "(Add / Update / Delete) (that file)".

```fish
$ git-commit
[master c77868d] Update README.md
 1 file changed, 57 insertions(+), 18 deletions(-)
$ git reset @^
Unstaged changes after reset:
M       README.md
$ git-add
$ git-commit Fix typo in README.md
[master 0078f7f] Fix typo in README.md
1 file changed, 57 insertions(+), 18 deletions(-)
```

Recommended abbreviation: `abbr-add gc git-commit`

### `git-protocol-https-to-git` [(source)](functions-git-protocol-https-to-git.fish)

Change the protocol of the current git repository to be git rather than https.

Useful if you clone an https url but you want to push or pull later.

Example usage:

```
ronin $ git push
fatal: unable to access 'https://git.sr.ht/~razzi/ronin/': The requested URL returned error: 403
ronin $ git-protocol-https-to-git
ronin $ git push
Everything up-to-date
```

Recommended abbreviation: `abbr-add gpro git-protocol-https-to-git`

### `gitignore <pattern>` [(source)](functions/gitignore.fish)

Add a pattern to the `.gitignore`.

Recommended abbreviation: `abbr-add giti gitignore`

## [`lima`](https://lima-vm.io/) Utilities

### `lima-ssh [name]` [(source)](functions/lima-ssh.fish)

Connect to a lima virtual machine. Defaults the machine named `default`.

Creates and starts the machine as necessary, so it works in 1 command.

### `lima-vnc` [(source)](functions/lima-vnc.fish)

Connect to a Lima virtual machine over VNC.

Creates and starts the machine as necessary, like `lima-ssh`.

## Vim Utilities

### `vim-plugin <url>` [(source)](functions/vim-plugin.fish)

Install a vim plugin using the builtin vim plugin mechanism.

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

### `isodatetime` [(source)](functions/isodatetime.fish)

Prints the date and time in ISO format.

```fish
$ isodatetime
2025-03-07T23:11:53
```
## debian Utilities

### `apt-description <package>` [(source)](/functions/apt-description.fish)

Show the apt description for a given package.

## macOS Utilities

### `wifi-network-name` [(source)](functions/wifi-network-name.fish)

Prints the current wifi network name.

### `wifi-password` [(source)](functions/wifi-password.fish)

Prints the current wifi network password. It will pop up with an authentication modal; enter your login username and password and hit enter and it will print the wifi password to the command line.

### `wifi-reset` [(source)](functions/wifi-reset.fish)

Turns the wifi off and on again.
