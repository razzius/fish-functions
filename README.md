## coln <column>

Splits its input on whitespace and prints the column indicated.

```
$ echo 1 2 | coln 2
2
```

## new <project>

Create a new directory of the project name, enter it,
initialize git, and create a git repo.

```
$ new fish_functions
Initialized empty Git repository in /Users/razzi/forks/fish_functions/.git/
Updating origin
created repository: razzius/fish_functions
fish_functions $
```

## ensuredb

Ensure that a fresh database is created with a name.
Drops a database by that name if it exists.
Clears database connections as necessary.
