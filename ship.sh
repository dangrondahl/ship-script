#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for required commands
for cmd in git gum gh; do
  if ! command_exists "$cmd"; then
    echo "Error: $cmd is not installed."
    exit 1
  fi
done

# Generate PR title and body
generate_pr_info() {

  local type scope pr_title_prefix pr_summary pr_body

  # Using the Conventional Commit format
  gum style --foreground 212 "Change type:"
  type=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
  scope=$(gum input --placeholder "scope")

  # Since the scope is optional, wrap it in parentheses if it has a value.
  [ -n "$scope" ] && scope="($scope)"

  pr_title_prefix="$type$scope"

  # Pull request summary
  gum style --foreground 212 "Pull Request Summary:"
  pr_summary=$(gum input --value "$(git log -1 --pretty=%B)")
  pr_title="$pr_title_prefix: $pr_summary"

  # Pull request description
  gum style --foreground 212 "Pull Request Description:"
  pr_body=$(gum write --placeholder "description of changes")

  # Is Draft
  gum style --foreground 212 "Is this a draft PR?"
  is_draft=$(gum choose "yes" "no")

  if [ "$is_draft" = "yes" ]; then
    gh pr create --draft \
      --title "$pr_title" \
      --body "$pr_body"
  else
    gh pr create \
      --title "$pr_title" \
      --body "$pr_body"
  fi
}

# Main script execution starts here
generate_pr_info
