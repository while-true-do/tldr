# Cheat Sheet: GIT

A Cheat Sheet with some useful [git](https://git-scm.com/) commands.

## Install

If you don't have GIT yet, you have to install it.

### Linux

```
# Debian / Ubuntu
apt-get update && apt-get install -y git

# RedHat / CentOS
yum install git

# Fedora
dnf install git

# OpenSuSE / SuSE Linux Enterprise
sudo zypper ref && sudo zypper in git

# Arch Linux
sudo pacman -S git
```

### Windows

```
# Download the git client
https://git-scm.com/download/win

# or download the GitHub desktop client
https://desktop.github.com/
```

### Mac

```
# Download the git client
https://git-scm.com/download/mac

# or download the GitHub desktop client
https://desktop.github.com/
```

## Configure

The first thing you have to do, is to configure your GIT.

```
# Configure User and email
git config --global user.name  "John Doe"
git config --global user.email "johndoe@foobar.com"

# Configure your desired editor
git config --global core.editor "nano -w"

# Use simple push, if desired
git config --global push.default simple

# Change the diff tool
git config --global diff.tool vimdiff

# Change command line coloring
git config --global color.ui auto
```

## Command Sequence

![git-command-sequence](./git/git-command-sequence.png)

## CLI Commands

### Get Help

```
git help <command>
```

### Create

Hey cool, you really want to work with GIT now.

You can either clone an existing repository

```
git clone git@domain.com/repository.git
cd <repository>
```

or create a new local repository.

```
cd <myProjectfolder>
git init
```

### Get Information

Changed files in your working directory.

```
git status
```

Check multiple directories for status

```
find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git status -s \;
```

Changes in tracked files.

```
git diff
```

Show all commits, starting with newest.

```
git log
```

Show changes over time for <file>

```
git log <file>
```

Who changed what and when in <file>

```
git blame <file>
```

### Working (Directory)

Remove files.

```
git rm <file>
```

Remove files from the local repository, which are already deleted in your
working directory.

```
git ls-files --deleted -z | xargs -0 git rm
```

### Staging (Index)

Add all current changes to Staging.

```
git add .
```

Add a file to Staging.

```
git add <file>
```

### Local (Repository)

Commit all local changes in staged files.

```
git commit -a
```

Commit previously staged changes.

```
git commit
  # or
git commit -m "commitmessage"
```

Change the last commit.

```
git commit --amend
```

Tag the current commit with <tag-name>.

```
git tag <tag-name>
```

### Branches and Tags

List all existing branches.

```
git branch -av
```

Switch HEAD branch to <branch>

```
git checkout <branch>
```

Create branch based of your current HEAD.

```
git branch <new-branch>
```

Create a new tracking branch based on a remote branch.

```
git checkout --track <remote/branch>
```

Delete a local branch.

```
git branch -d <branch>
```

### Remote (Repository)

List all remotes, currently configured.

```
git remote -v
```

Show information about a <remote>.

```
git remote show <remote>
```

Add new remote repository, named <remote>

```
git remote add <shortname> <url>
```

Edit an existing default remote

```
git remote set-url <shortname> <url>
```

Use another port for your remote

```
git remote add <shortname> ssh://user@host:1234/srv/git/example
```

Edit the remotes manually

```
vim .git/config
# Edit the following passage
[remote "origin"]
    url = <url>
    fetch = +refs/heads/*:refs/remotes/origin/
```


Download all changes from remote, but don't integrate into HEAD.

```
git fetch <remote>
```

Download all changes from remote and directly integrate into HEAD.

```
git pull <remote> <branch>
```

Publish local changes to a remote.

```
git push <remote> <branch>
```

Delete a branch on the remote.

```
git branch -d <remote/branch>
```

Publish your tags.

```
git push --tags
```

### Merge and Rebase

Merge <branch> into HEAD.

```
# simple
git merge <branch>

# no fast forward (merge commit required)
git merge --no-ff <branch>

# squash the commits
git merge squash <branch>
```

Rebase interactively

```
git rebase -i
```

Rebase your current HEAD onto <branch>

```
git rebase <branch>
```

Abort a rebase.

```
git rebase --abort
```

Continue an aborted rebase.

```
git rebase --continue
```

Use your editor to solve conflicts manually and add or remove the conflicting file.

```
git add <resolved-file>
git rm <resolved-file>
```

### Undo

Discard all local changes in your working directory.

```
git reset --hard HEAD
```

Discard local changes in a specific file.

```
git checkout HEAD <file>
```

Revert a commit.

```
git revert <commit>
git commit -m "revert to <commit>"
```

Revert / Reset to a previous commit.

```
git reset --hard <commit>
```

...and preserve all changes as unstaged.

```
git reset <commit>
```

...and/or preserve all uncomitted local changes

```
git reset --keep <commit>
```
