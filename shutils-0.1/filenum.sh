#######################################
# count number of files in a folder
# Arguments:
#   directory : directory name
# Returns:
#   number of files
#######################################
filnum() { 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
    return $N
}