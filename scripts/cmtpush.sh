#!/bin/bash
commit_message=$1

if [ -z "$commit_message" ]
then
    echo "You need to provide a commit message."
    exit
fi

branch_name=$(git symbolic-ref --short -q HEAD)

git add -A
git commit -m "$commit_message"
git push origin "$branch_name"