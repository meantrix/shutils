gitprinfall() {
  local user="$1"
  local days="$2"
  local folder="$3"
  local repo_owner="$4"

  echo "User: $user"
  echo "Days: $days"
  echo "Folder: $folder"
  echo "Repo Owner: $repo_owner"

  local total_prs=0

  cd "$folder"
  allrepos=$(find "$folder" -name ".git" -type d -prune | while read -r gitdir; do (cd "$gitdir/.." && pwd); done)

  for repo in $allrepos; do
    (cd "$repo" && echo "Repository: $repo")

    if gh pr list --state closed --author "$user" --search "closed:$(date -d "$days days ago" +%Y-%m-%d)..$(date +%Y-%m-%d)" --repo "$repo_owner/$(basename "$repo")" | grep -q "No closed pull requests found"; then
      echo "PRs in $repo_owner/$(basename "$repo"): 0"
    else
      prs=$(gh pr list --state closed --author "$user" --search "closed:$(date -d "$days days ago" +%Y-%m-%d)..$(date +%Y-%m-%d)" --repo "$repo_owner/$(basename "$repo")")
      echo "$prs"
      total_prs=$((total_prs + $(echo "$prs" | grep -c "MERGED")))
    fi
  done

  echo "Total PRs: $total_prs"
}


gitissueinfo() {
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



gitissueinfo igor-siciliani 5 . meantrix



Assignee: igor-siciliani
Days: 5
Folder: .
Repo Owner: meantrix

