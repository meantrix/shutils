#######################################
# search for directory with a given name
# Arguments:
#   directory : directory name
#   root : dir to search
# Returns:
#   directory path
#######################################
ffirst () {

  if [ "$#" -eq 1 ]
  then
    local dir=$HOME
  else 
    local dir="$2"
  fi

  find $dir -type d -name $1 -print -quit

}