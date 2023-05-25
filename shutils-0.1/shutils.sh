#######################################
# main shutils function
# Arguments:
#   function : functions name.
#   ... : additional parameters for function.
# Returns:
#   method output.
#######################################
shutils() {
    local func="$1"
    shift

    case "$func" in
        azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|filelarlist|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version|help)
            if [ -x "/bin/shutils/$func.sh" ]; then
                source "/bin/shutils/$func.sh"
                $func "$@"
            else
                echo "Invalid method: $func"
                echo "Available methods:"
                echo "azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|filelarlist|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version|help"
            fi
            ;;
        *)
            echo "Invalid function: $func"
            echo "Available methods:"
            echo "azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|filelarlist|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version|help"
            ;;
    esac
}