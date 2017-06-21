These are fish functions for making common tasks more convenient.

To use them, link them to `~/.config/fish/functions/`.

### `backup <file>`

Moves file to file.bak.

```
$ ls
README.md
$ backup README.md
$ ls
README.md.bak
```

### `coln <column>`

Splits its input on whitespace and prints the column indicated.

```
$ echo 1 2 | coln 2
2
```

### `ensuredb <name>`

Ensure that a fresh database by the name given is created.
Drops a database by that name if it exists.
Clears database connections as necessary.

### `fs`

Save the last-edited `fish` function.

```
$ function hi
  echo hi
end
$ fs
Saved hi
```

### `lower`

Converts stdin to lowercase.

```
$ echo A | lower
a
```

### `mc <directory>`

Make a directory and cd into it.

```
$ mc folder
folder $
```

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

Create a skeleton Jekyll post with the given title.

```
$ post Fish functions
$ cat _posts/2017-06-21-fish-functions.md
---
title: Fish functions
date: 2017-06-21
---
```

### `readpass <password>`

Prompt for a password. Does not echo entered characters.

```
$ readpass email
$ echo $email
razzi@abuissa.net
```

### `restore <backup>`

Rename file.bak to file.

### `sudo <command>`

Runs a command as sudo. If the command is `!!`, runs the last command.
