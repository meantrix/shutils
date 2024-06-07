#######################################
# back up a file
# Arguments:
#   file : file name
# Returns:
#   file coppy with .backup extension
#######################################
function filebu () {
    local file="$1"
    local backup="${file}-$(date +%Y%m%d%H%M).backup"
    cp $file $backup
    echo $backup
}