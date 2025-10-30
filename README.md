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
  * [`clean-unzip`](#clean-unzip)
  * [`unzip-cd`](#unzip-cd)
- [Text Utilities](#text-utilities)
  * [`coln`](#coln)
  * [`row`](#row)
  * [`skip-lines`](#skip-lines)
  * [`take`](#take)
  * [`word-count`](#word-count)
  * [`line-count`](#line-count)
  * [`char-count`](#char-count)
- [`fish` Scripting Utilities](#fish-scripting-utilities)
  * [`string-empty`](#string-empty)
  * [`file-exists`](#file-exists)
  * [`is-dir`](#is-dir)
  * [`is-symlink`](#is-symlink)
  * [`confirm`](#confirm)
- [Environment Utilities](#environment-utilities)
  * [`curdir`](#curdir)
  * [`echo-variable`](#echo-variable)
  * [`readpass`](#readpass)
- [Symlink Utilities](#symlink-utilities)
  * [`symlink`](#symlink)
  * [`unsymlink`](#unsymlink)
  * [`symlinks`](#symlinks)
  * [`link-rc`](#link-rc)
- [`git` Utilities](#git-utilities)
  * [`clone-cd`](#clone-cd)
  * [`clone-shallow-cd`](#clone-shallow-cd)
  * [`wip`](#wip)
  * [`git-add`](#git-add)
  * [`git-commit`](#git-commit)
  * [`git-protocol-https-to-git`](#git-protocol-https-to-git)
  * [`gitignore`](#gitignore)
- [`lima` Utilities](#lima-utilities)
  * [`lima-ssh`](#lima-ssh)
  * [`lima-vnc`](#lima-vnc)
- [`vim` Utilities](#vim-utilities)
  * [`vim-plugin`](#vim-plugin)
- [Postgres Utilities](#postgres-utilities)
  * [`ensuredb`](#ensuredb)
  * [`renamedb`](#renamedb)
- [Date Utilities](#date-utilities)
  * [`isodate`](#isodate)
  * [`isodatetime`](#isodatetime)
- [debian Utilities](#debian-utilities)
  * [`apt-description`](#apt-description)
- [macOS Utilities](#macos-utilities)
  * [`wifi-network-name`](#wifi-network-name)
  * [`wifi-password`](#wifi-password)
  * [`wifi-reset`](#wifi-reset)

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

<h3 id="copy">

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

<h3 id="create-file">

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

<h3 id="eat">

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

<h3 id="move">

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

<h3 id="clean-unzip">

`clean-unzip <zipfile>` [(source)](functions/clean-unzip.fish)

</h3>

Unzips a `.zip` archive without polluting the current directory, by creating a
directory even if the zipfile does not have a folder level.

<h3 id="unzip-cd">

`unzip-cd <zipfile>` [(source)](functions/unzip-cd.fish)

</h3>

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

<h3 id="coln">

`coln <number>` [(source)](functions/coln.fish)

</h3>

Splits input on whitespace and prints the column indicated.

```fish
$ echo 1 2 | coln 2
2
```

<h3 id="row">

`row <number>` [(source)](functions/row.fish)

</h3>

Prints the row of input indicated.

```fish
$ seq 3 | row 2
2
```

<h3 id="skip-lines">

`skip-lines <number>` [(source)](functions/skip-lines.fish)

</h3>

Skips the first n lines of stdin.

```fish
$ seq 5 | skip-lines 2
3
4
5
```

<h3 id="take">

`take <n>` [(source)](functions/take.fish)

</h3>

Take the first `n` lines of standard input.
```fish
$ seq 5 | take 3
1
2
3
```

<h3 id="word-count">

`word-count` [(source)](functions/word-count.fish)

</h3>

Count the words from standard input. Like `wc -w` but does not put spaces around the number.

```fish
$ echo a b | word-count
2
# Compare to:
$ echo a b | wc -w
       2
```

<h3 id="line-count">

`line-count` [(source)](functions/line-count.fish)

</h3>

Count the lines from standard input. Like `wc -l` but does not put spaces around the number.

```fish
$ seq 3 | line-count
3
# Compare to:
$ seq 3 | wc -l
       3
```

<h3 id="char-count">

`char-count` [(source)](functions/char-count.fish)

</h3>

Count the characters from standard input. Like `wc -c` but does not put spaces around the number.

```fish
$ echo -n a b | char-count
3
# Compare to:
$ echo -n a b | wc -c
       3
```

<h2 id="fish-scripting-utilities">

`fish` Scripting Utilities

</h2>

<h3 id="string-empty">

`string-empty <value>` [(source)](functions/string-empty.fish)

</h3>

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

<h3 id="file-exists">

`file-exists <file>` [(source)](functions/file-exists.fish)

</h3>

Test if `$file` exists.

<h3 id="is-dir">

`is-dir <path>` [(source)](functions/is-dir.fish)

</h3>

Check if `$path` is a directory.

<h3 id="is-symlink">

`is-symlink <path>` [(source)](functions/is-symlink.fish)

</h3>

Check if `$path` is a symlink.

<h3 id="confirm">

`confirm` [(source)](functions/confirm.fish)

</h3>

Prompts the user for confirmation. Exit with status according to whether they answered `y`, `Y`, `yes`, or `YES`.

## Environment Utilities

<h3 id="curdir">

`curdir` [(source)](functions/curdir.fish)

</h3>

Just the current directory name, please.

```fish
mydir $ curdir
mydir
```

You probably won't need this interactively since the current directory is usually part of your `fish_prompt`,
but this is useful for scripting.

<h3 id="echo-variable">

`echo-variable <variable>` [(source)](functions/echo-variable.fish)

</h3>

Like `echo`, but without the `$` or capitalization.

```fish
$ echo-variable user
razzi
$ echo $USER
razzi
```

Recommended abbreviation: `abbr-add ev echo-variable`

[Completion](completions/echo-variable.fish): completes environment variable names.

<h3 id="readpass">

`readpass <name>` [(source)](functions/readpass.fish)

</h3>

Prompt for a password. Does not echo entered characters.

```fish
$ readpass email
●●●●●●●●●●●●●●●●●
$ echo $email
razzi@abuissa.net
```

## symlink utilities

<h3 id="symlink">

`symlink <from> <to>` [(source)](functions/symlink.fish)

</h3>

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

<h3 id="unsymlink">

`unsymlink <file>` [(source)](functions/unsymlink.fish)

</h3>

Remove a symlink. Errors if the file is not a symlink.

Recommended abbreviation: `abbr-add us unsymlink`

<h3 id="symlinks">

`symlinks [<dir>]` [(source)](functions/symlinks.fish)

</h3>

List symlinks in the given directory, or the current directory if none is passed.

<h3 id="link-rc">

`link-rc [<file>]` [(source)](functions/link-rc.fish)

</h3>

Create a symlink from `$file` to the home directory (`~`).

Sample usage:

```fish
.dotfiles $ link-rc .tmux.conf
.dotfiles $ head -1 ~/.tmux.conf
set -g prefix ^Space
```

Recommended abbreviation: `abbr-add lrc link-rc`

<h2 id="git-utilities">

`git` utilities

</h2>

<h3 id="clone-cd">

`clone-cd url [destination]` [(source)](functions/clone-cd.fish)

</h3>

Clone a `git` repository into the current directory (or the optional `$destination`), and `cd` into it.

If a folder by that name already exists, great, you probably already cloned it, just cd into the directory and pull.

If it's trying to clone into a non-empty directory, make a new folder in that directory with the repository name and clone into that, instead of erroring.

Recommended abbreviation: `abbr-add cc clone-cd`

<h3 id="clone-shallow-cd">

`clone-shallow-cd url [destination]` [(source)](functions/clone-shallow-cd.fish)

</h3>

Like `clone-cd` but clones with `--depth=1` for speed.

<h3 id="wip">

`wip [message]` [(source)](functions/wip.fish)

</h3>

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

<h3 id="git-add">

`git-add [paths]` [(source)](functions/git-add.fish)

</h3>

A wrapper for `git add` that defaults to `git add .` if no arguments given, rather than erroring.

Recommended abbreviation: `abbr-add ga git-add`

<h3 id="git-commit">

`git-commit [message]` [(source)](functions/git-commit.fish)

</h3>

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

<h3 id="git-protocol-https-to-git">

`git-protocol-https-to-git` [(source)](functions-git-protocol-https-to-git.fish)

</h3>

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

<h3 id="gitignore">

`gitignore <pattern>` [(source)](functions/gitignore.fish)

</h3>

Add a pattern to the `.gitignore`.

Recommended abbreviation: `abbr-add giti gitignore`

<h2 id="lima-utilities">

[`lima`](https://lima-vm.io/) Utilities

</h2>

<h3 id="lima-ssh">

`lima-ssh [name]` [(source)](functions/lima-ssh.fish)

</h3>

Connect to a lima virtual machine. Defaults the machine named `default`.

Creates and starts the machine as necessary, so it works in 1 command.

<h3 id="lima-vnc">

`lima-vnc` [(source)](functions/lima-vnc.fish)

</h3>

Connect to a Lima virtual machine over VNC.

Creates and starts the machine as necessary, like `lima-ssh`.

<h2 id="vim-utilities">

`vim` Utilities

</h2>

<h3 id="vim-plugin">

`vim-plugin <url>` [(source)](functions/vim-plugin.fish)

</h3>

Install a vim plugin using the builtin vim plugin mechanism.

## Postgres Utilities

<h3 id="ensuredb">

`ensuredb <name>` [(source)](functions/ensuredb.fish)

</h3>

Ensure that a fresh database by the name given is created.
Drops a database by that name if it exists, clearing database connections as necessary.

<h3 id="renamedb">

`renamedb <from> <to>` [(source)](functions/renamedb.fish)

</h3>

Renames a database.

## Date Utilities

<h3 id="isodate">

`isodate` [(source)](functions/isodate.fish)

</h3>

Prints the date in ISO format.

```fish
$ isodate
2020-01-28
```

<h3 id="isodatetime">

`isodatetime` [(source)](functions/isodatetime.fish)

</h3>

Prints the date and time in ISO format.

```fish
$ isodatetime
2025-03-07T23:11:53
```
## debian Utilities

<h3 id="apt-description">

`apt-description <package>` [(source)](/functions/apt-description.fish)

</h3>

Show the apt description for a given package.

## macOS Utilities

<h3 id="wifi-network-name">

`wifi-network-name` [(source)](functions/wifi-network-name.fish)

</h3>

Prints the current wifi network name.

<h3 id="wifi-password">

`wifi-password` [(source)](functions/wifi-password.fish)

</h3>

Prints the current wifi network password. It will pop up with an authentication modal; enter your login username and password and hit enter and it will print the wifi password to the command line.

<h3 id="wifi-reset">

`wifi-reset` [(source)](functions/wifi-reset.fish)

</h3>

Turns the wifi off and on again.
