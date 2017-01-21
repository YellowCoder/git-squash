###Git shortcut to automate the commit, squash and push commands

Sometimes executing basic git commands is very boring and repetitive so, this shortcut will help you a lot. It will run these commands in this sequence:

- `git merge-base HEAD YOUR_CURRENT_BRANCH`
- `git reset --soft MERGE_BASE_ID`
- `git add .`
- `git commit -m "YOUR_MESSAGE_COMMIT"`
- `git push origin -f YOUR_CURRENT_BRANCH`

Warnings:
- #1: This procedures clears all the commit history. So do not run it if you'll need this history.
- #2: This script run a force commit. So, be careful.

**The Script is similar to:**

```bash
#!/bin/bash

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
COMMIT_MESSAGE=$1
FROM_BRANCH=${2-master}
MERGE_BASE_ID=$(git merge-base HEAD $FROM_BRANCH)

echo -e "$(tput setaf 2)** Executing reset command$(tput sgr0)"
git reset --soft $MERGE_BASE_ID

echo -e "$(tput setaf 2)\n** Executing add command$(tput sgr0)\n"
git add .

echo -e "$(tput setaf 2)\n** Executing commit command$(tput sgr0)\n"
git commit -S -am "$COMMIT_MESSAGE"

echo -e "$(tput setaf 2)\n** Executing push command$(tput sgr0)\n"
git push origin -f $CURRENT_BRANCH
```

**How to install:**

Run this command line:

```bash
$ gem install git-squash
```

**Usage:**

At some git repository, just run:

```bash
git squash
```

or

```bash
git-squash "Commit Message"
```
*Ps. The default branch is `master`*

or

```bash
git-squash "Commit Message" "branch_name_from_reset"
```