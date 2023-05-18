#######################################
# Get user git commits history by time range
# Arguments:
#   user : git user name
#   day : number of days
#   folder : folder containing git repositories
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
gitinfall() {
  local user="$1"
  local day="$2"
  local folder="$3"

  # Print function parameters
  echo "User: $user"
  echo "Day: $day"
  echo "Folder: $folder"

  local total_commits=0
  local total_lines_added=0
  local total_lines_deleted=0

  local initial_folder="$(pwd)"

  if [ -d "$folder/.git" ]; then
    # Single Git repository case
    cd "$folder"

    git fetch --all

    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "$inside_git_repo" ]; then
      git log --all --numstat --pretty="%H" --author="$user" --since="$day days ago" | awk 'NF==3 {plus+=$1; minus+=$2} NF==1 {total++} END {printf("lines added: +%d\nlines deleted: -%d\ntotal commits: %d\n", plus, minus, total)}'

      lines_added=$(git log --all --numstat --pretty="%H" --author="$user" --since="$day days ago" | awk 'NF==3 {plus+=$1} END {print plus}')
      lines_deleted=$(git log --all --numstat --pretty="%H" --author="$user" --since="$day days ago" | awk 'NF==3 {minus+=$2} END {print minus}')
      commits=$(git log --all --pretty="%H" --author="$user" --since="$day days ago" | wc -l)

      total_lines_added=$((total_lines_added + lines_added))
      total_lines_deleted=$((total_lines_deleted + lines_deleted))
      total_commits=$((total_commits + commits))
    fi

  else
    # Multiple Git repositories case
    cd "$folder"
    allrepos=$(find "$folder" -name ".git" -type d -prune | while read -r gitdir; do cd "$gitdir/.." && pwd; done)


    for repo in $allrepos; do
        (cd "$repo" && echo "Repository: $repo")

        (cd "$repo" && git fetch --all)

        lines_added=$(cd "$repo" && git log --all --numstat --pretty="%H" --author="$user" --since="$day days ago" | awk 'NF==3 {plus+=$1} END {print plus}')
        lines_deleted=$(cd "$repo" && git log --all --numstat --pretty="%H" --author="$user" --since="$day days ago" | awk 'NF==3 {minus+=$2} END {print minus}')
        commits=$(cd "$repo" && git log --all --pretty="%H" --author="$user" --since="$day days ago" | wc -l)

        total_lines_added=$((total_lines_added + lines_added))
        total_lines_deleted=$((total_lines_deleted + lines_deleted))
        total_commits=$((total_commits + commits))
    done
  fi

  cd "$initial_folder"
  
  echo "$1"
  echo "Total Lines added: +$total_lines_added"
  echo "Total Lines deleted: -$total_lines_deleted"
  echo "Total Commits: $total_commits"

  return 0
}