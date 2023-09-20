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

gitissueinfall() {
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
    repo_name=$(basename "$repo")

    # Verificar se é um repositório Git válido
    if git -C "$repo" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      (cd "$repo" && echo "Repository: $repo")

      # Use a API GraphQL do GitHub para obter informações sobre issues fechadas atribuídas ao usuário
      query="{
        repository(owner: \"$repo_owner\", name: \"$repo_name\") {
          issues(states: CLOSED, assignee: \"$user\", closed: \">$(date -d "$days days ago" +%Y-%m-%d)T00:00:00Z\") {
            totalCount
          }
        }
      }"

      result=$(gh api graphql -f query="$query")

      total_issues_repo=$(echo "$result" | jq -r '.data.repository.issues.totalCount')

      echo "Issues in $repo_owner/$repo_name: $total_issues_repo"
      total_issues=$((total_issues + total_issues_repo))
    fi
  done

  echo "Total Closed Issues: $total_issues"
}





Assignee: igor-siciliani
Days: 5
Folder: .
Repo Owner: meantrix

