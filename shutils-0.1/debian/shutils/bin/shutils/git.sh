# Docker usefull function

#######################################
# Get user git commits history by time range
# Arguments:
#   user : git user name
#   day : number of days
#   ... : folders repositories
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
function git_info () {

  local user="$1"
  local day="$2"
  shift 2

  echo $user
  echo $day
  
  firstfolder="$(pwd)"

  for value in "$@" # Represents the remaining parameters.
    do  
        cd $value
        echo $value
        git fetch --all
        inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
        if [ "$inside_git_repo" ]; then         
            git log --all --numstat --pretty="%H" --author="$user" --since="'$day'.day" | awk 'NF==3 {plus+=$1; minus+=$2} NF==1 {total++} END {printf("lines added: +%d\nlines deleted: -%d\ntotal commits: %d\n", plus, minus, total)}'
        fi
        cd $firstfolder
    done
  return 0
}


#######################################
# Normal commit, but adding -s to include your signature.
# Arguments:
#   text : commit text
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
function commit2 {

        if [ $# -eq 0 ]; then
            echo "Please enter a commit message:";
            read msg;
            commit "$msg";
        elif [[ $1 == --help ]] || [[ $1 == --h ]] || [[ $1 == --? ]]; then
            echo "This will commit changes to a local git repo, eg:";
            echo "$ commit 'some changes made'";
            echo "This will do: git commit -s -m 'some changes made'";
        else    
            echo git commit -s -a -m "$1"
            git commit -s -a -m "$1";
        fi
  
  return 0

}
