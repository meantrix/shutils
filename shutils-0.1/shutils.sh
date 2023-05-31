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


    local funcs="(azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|filelarlist|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|podres|psa|ssd|whoisport|nviuse|version|help)"

    case "$func" in
        $funcs)
            if [ -x "/bin/shutils/$func.sh" ]; then
                source "/bin/shutils/$func.sh"
                $func "$@"
            else
                echo "Invalid method: $func"
                echo "Available methods:"
                echo $funcs
            fi
            ;;
        *)
            echo "Invalid function: $func"
            echo "Available methods:"
            echo $funcs
            ;;
    esac
}