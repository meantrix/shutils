#######################################
# Generate a changelog with file modifications and their changes
# Arguments:
#   base_branch : the base branch to compare from
#   head_branch : the head branch to compare to
#   ignore_exts : (optional) array of file extensions to ignore
# Returns:
#   Generates a changelog with the current date and time in the filename,
#   containing commit messages, file modifications, and their changes
#######################################
gitlog() {
  BASE_BRANCH=$1
  HEAD_BRANCH=$2
  IGNORE_EXTS=("${@:3}" "zip" "tar.gz" "7z")

  # Check if the current directory is a valid Git repository
  if [ ! -d ".git" ]; then
    echo "Error: This directory is not a valid Git repository."
    return 1
  fi

  # Check if the base and head branch arguments are provided
  if [ -z "$BASE_BRANCH" ] || [ -z "$HEAD_BRANCH" ]; then
    echo "Usage: $0 <base-branch> <head-branch> [ignore_ext1 ignore_ext2 ...]"
    return 1
  fi

  # Fetch the latest changes
  git fetch origin

  # Get the current date and time
  TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

  # Generate the filename
  FILENAME="changelog_${TIMESTAMP}.md"

  # Build the exclude pattern for git diff
  EXCLUDE_PATTERN=()
  for ext in "${IGNORE_EXTS[@]}"; do
    EXCLUDE_PATTERN+=(":(exclude)*.${ext}")
  done

  # Function to extract method bodies with context
  extract_methods() {
    FILE=$1
    BASE_FILE=$(mktemp)
    HEAD_FILE=$(mktemp)

    git show ${BASE_BRANCH}:${FILE} > ${BASE_FILE} 2>/dev/null
    git show ${HEAD_BRANCH}:${FILE} > ${HEAD_FILE} 2>/dev/null

    if [ -s ${BASE_FILE} ] && [ -s ${HEAD_FILE} ]; then
      echo "\`\`\`diff"
      echo "--- a/${FILE}"
      echo "+++ b/${FILE}"
      diff -U100 ${BASE_FILE} ${HEAD_FILE}
      echo "\`\`\`"
    elif [ -s ${BASE_FILE} ]; then
      echo "### File Deleted: ${FILE}"
      echo "\`\`\`"
      cat ${BASE_FILE}
      echo "\`\`\`"
    else
      echo "### New File: ${FILE}"
      echo "\`\`\`"
      cat ${HEAD_FILE}
      echo "\`\`\`"
    fi

    rm ${BASE_FILE} ${HEAD_FILE}
  }

  # Generate the changelog with detailed file changes
  {
    echo "## Changelog"
    echo
    git log ${BASE_BRANCH}..${HEAD_BRANCH} --pretty=format:"### %h - %an, %ar : %s%n%b%n"
    echo
    echo "## File Changes"
    echo
    git diff --name-status ${BASE_BRANCH}..${HEAD_BRANCH} -- "${EXCLUDE_PATTERN[@]}"
    echo
    for FILE in $(git diff --name-only ${BASE_BRANCH}..${HEAD_BRANCH}); do
      if [[ ${FILE} =~ \.zip$|\.tar\.gz$|\.7z$ ]]; then
        echo "${FILE} (binary file, changes not shown)"
      fi
    done
    echo
    echo "## Detailed File Changes"
    echo
    for FILE in $(git diff --name-only ${BASE_BRANCH}..${HEAD_BRANCH} -- "${EXCLUDE_PATTERN[@]}"); do
      echo "### ${FILE}"
      extract_methods ${FILE}
    done
  } > ${FILENAME}

  echo "Changelog generated in ${FILENAME} with file details and their changes"
}









