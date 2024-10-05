#!/bin/bash

# Check if a commit message is provided
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 <commit_message>"
  exit 1
fi

# Assign the first argument as the commit message
commit_message="$1"

# Run the Git commands
git add .
git commit -m "$commit_message"
git push -u origin master


#./git-commit-push.sh "Your commit message here"