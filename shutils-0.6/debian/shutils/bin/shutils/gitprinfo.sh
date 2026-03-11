#######################################
# Get user's git pull request (PR) history within a time range.
# Arguments:
#   user: Git user name.
#   days: Number of days.
#   folder: Repository directory.
#   repo_owner: Repository owner.
# Returns:
#   0 if the execution was successful, non-zero on error.
#######################################
gitprinfo() {
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