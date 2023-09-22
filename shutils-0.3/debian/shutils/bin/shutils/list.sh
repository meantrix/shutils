#######################################
# List available methods in shutils
# Arguments: None
# Returns: None
#######################################
list() {
    # Define the available methods
    local funcs=("azcopy10inst" "dockerhubp" "filefirst" "filecompress" "filenum" "filextract" "filelarlist" "gitcommit" "gitinfo" "gitinfall" "kp" "jsonload" "myinfo" "netinfo" "netmyip" "podel" "podget" "podlog" "podvalidname" "podres" "psa" "ssd" "whoisport" "nviuse" "instR3" "instT" "gitprinfo" "version" "help" "list")

    # Print the list of available methods
    echo "${funcs[@]}"
}