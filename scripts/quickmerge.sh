#!/bin/bash
source_branch=$(printenv QM_SOURCE)
destination_branches=($(printenv QM_DESTINATIONS))

source_branch_override="$1"
shift
destination_branches_override=("$@")

if [ ! -z "$source_branch_override" ]
then
    source_branch=$source_branch_override
    destination_branches=("${destination_branches_override[@]}")
fi

original_branch=$(git symbolic-ref --short -q HEAD)

for destination_branch in "${destination_branches[@]}"
do
    echo "Initiating $destination_branch merge..."
    checkout_result=$(git checkout $destination_branch 2>&1)

    if [[ $checkout_result == "error"* ]]; then
        echo "$destination_branch doesn't exist! Moving to next destination branch..."
    else 
        merge_result=$(printf ":wq" | git merge $source_branch)

        if [[ $merge_result == *"CONFLICT"* ]]; then
            echo "There were merge conflicts when trying to merge $source_branch into $destination_branch!"
            echo "$merge_result"
            exit
        elif [[ $merge_result == "Already up to date." ]]; then
            echo "$merge_result"
        else
            echo "Successfully merged $source_branch into $destination_branch!"
            echo "$merge_result"
            git push origin $destination_branch
        fi
    fi
done

git checkout $original_branch