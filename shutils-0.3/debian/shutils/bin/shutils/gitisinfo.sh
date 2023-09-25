#######################################
# Get the total count of closed issues assigned to a user in multiple Git repositories within a specified time range.
#
# Arguments:
#   user : The GitHub username to search for assigned issues.
#   days : The number of days to search for closed issues within.
#   folder : The path to the directory containing your Git repositories.
#   repo_owner : The owner or organization name of the repositories (e.g., 'meantrix').
#
# Returns:
#   Prints the total count of closed issues assigned to the user.
#######################################
gitisinfo() {
  local user="$1"
  local days="$2"
  local folder="$3"
  local repo_owner="$4"

  echo "Assignee: $user"
  echo "Days: $days"
  echo "Folder: $folder"
  echo "Repo Owner: $repo_owner"

  local total_issues=0

  cd "$folder"
  allrepos=$(find "$folder" -name ".git" -type d -prune | while read -r gitdir; do (cd "$gitdir/.." && pwd); done)

  for repo in $allrepos; do
    (cd "$repo" && echo "Repository: $repo")

    if gh issue list --state closed --assignee "$user" --search "closed:$(date -d "$days days ago" +%Y-%m-%d)..$(date +%Y-%m-%d)" --repo "$repo_owner/$(basename "$repo")" | grep -q "No closed issues found"; then
      echo "Issues in $repo_owner/$(basename "$repo"): 0"
    else
      issues=$(gh issue list --state closed --assignee "$user" --search "closed:$(date -d "$days days ago" +%Y-%m-%d)..$(date +%Y-%m-%d)" --repo "$repo_owner/$(basename "$repo")")
      echo "$issues"
      total_issues=$((total_issues + $(echo "$issues" | grep -cE "^[0-9]+\s+CLOSED\s+")))
    fi
  done

  echo "Total Closed Issues: $total_issues"
}