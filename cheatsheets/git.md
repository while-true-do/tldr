# GIT Cheat Sheet
| A Cheat Sheet with some useful git commands.

## Installation

If you don't have GIT yet, you have to install it.

### Debian/Ubuntu

```
sudo apt-get update && sudo apt-get install -y git
```

### Redhat/CentOS/Fedora

If you are using the good ol' yum.

```
sudo yum install -y git
```

If you are using the new dnf.

```
sudo dnf install -y git
```

### OpenSuSE/SLES

```
sudo zypper ref && sudo zypper in git
```

### Arch Linux

```
sudo pacman -S git
```

### OSX

A graphical installer can be found here: <http://sourceforge.net/projects/git-osx-installer/>

You can use Homebrew as well:

```
brew install git
```

### Windows

For Windows you can use the graphical installer from: <http://msysgit.github.com/>

## Configure

The first thing you have to do, is to configure your GIT.

```
git config --global user.name  "John Doe"
git config --global user.email "johndoe@foobar.com"
```

If you want to set the default editor from vim to something else (maybe nano):

```
git config --global core.editor "nano -w"
```

You can set the push-action to the new "simple" with:

```
git config --global push.default simple
```

And change the diff-tool to something else (maybe vimdiff):

```
git config --global diff.tool vimdiff
```

## Create

Hey cool, you really want to work with GIT now.

You can either clone an existing repo.

```
git clone git@domain.com/repository.git
cd <repository>
```

or create a new local repo for yourself.

```
cd <myProjectfolder>
git init
```

## Local Changes

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

Add all current changes to the next commit.

```
git add .
```

Add some changes in <file> to the next commit.

```
git add <file>
```

Remove files from repo.

```
git rm <file>
```

Remove multiple files from repo, that have already been deleted from disk.

```
git ls-files --deleted -z | xargs -0 git rm
```

Commit all local changes in tracked files.

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

## Commit History

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

## Branches and Tags

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

Tag the current commit with <tag-name>.

```
git tag <tag-name>
```

## Update and Publish

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
git branch -dr <remote/branch>
```

Publish your tags.

```
git push --tags
```

## Merge and Rebase

Merge <branch> into HEAD.

```
git merge <branch>
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

## Undo

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

## Help

```
git help <command>
```

## Graphical Interfaces

## Tools
