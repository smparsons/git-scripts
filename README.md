# git-scripts
A repo with a few helper git scripts that I use during development.

## Scripts

### Setup

To setup the scripts, simply cd into the git-scripts folder and run:

```
$ sh ./setup.sh
```

This will setup the appropriate symlinks so that you can easily execute the scripts.

### cmtpush

This script simply stages changes, commits them using the message passed in as a parameter, and pushes to the server. Here's an example of how it's used:

```
$ cmtpush "This is an example commit message"
```

### quickmerge

This script iterates through a collection of destination branches, and auto-merges the given source branch into each destination branch. After each merge, the changes are pushed to the server. If there are merge conflicts, the script will stop executing so that you can resolve them.

This is how it's used:

```
$ quickmerge source_branch dest_branch_1 dest_branch_2 ... dest_branch_n
```

The first parameter is the source branch. This is the branch that you are trying to merge. The rest of the parameters are each of the destination branches where you would like to merge the source branch.

Alternatively, if you define `QM_SOURCE` and `QM_DESTINATIONS` environment variables, you don't have to pass any parameters to quickmerge unless you want to override the values stored in the environment variables. Here's an example:

```
$ export QM_SOURCE="source_branch"
$ export QM_DESTINATIONS="dest_branch_1 dest_branch_2"
$ quickmerge
```

