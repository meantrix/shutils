#######################################
# List available methods in shutils
# Arguments: None
# Returns: None
#######################################
list() {
    # Define the available methods
    local funcs=("azcopy10inst" "dockerhubp" "filefirst" "filecompress" "filenum" "filextract" "filelarlist" "gitc" "gitlog" "gitcinfo" "gitcsinfo" "gptsend" "kp" "jsonload" "myinfo" "netinfo" "netmyip" "podel" "podget" "podlog" "podvalidname" "podres" "psa" "ssd" "whoisport" "nviuse" "instR3" "instT" "gitisinfo" "gitprinfo" "version" "help" "list")

    # Print the list of available methods
    echo "${funcs[@]}"
}