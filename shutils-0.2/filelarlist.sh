#######################################
# List the largest files in the computer or a specific directory
# Arguments:
#   limit: Number of files to display (default: 10)
#   directory: Directory to search for largest files (default: "/")
# Returns:
#   None
#######################################
function filelarlist() {
    local limit="${1:-10}"
    local directory="${2:-/}"
    
    find "$directory" -type f -exec du -Sh {} + 2>/dev/null | sort -rh | head -n "$limit" | awk '{print $2 "\t" $(NF-1)}' | while IFS=$'\t' read -r -a file_info; do
        realpath "${file_info[0]}"
        echo "${file_info[1]}"
        echo
    done
}
