# main caller function
shutils() {
    local func="$1"
    shift

    case "$func" in
        delpod|ffirst|gitcommit|gitinfo|gitinfall|kp|loadjson|myinfo|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version)
            if [ -x "/bin/shutils/$func.sh" ]; then
                source "/bin/shutils/$func.sh"
                $func "$@"
            else
                echo "Invalid method: $func"
                echo "Available methods:"
                echo "delpod, ffirst, gitcommit, gitinfo, gitinfall, kp, loadjson, myinfo, podel, podget, podlog, podvalidname, psa, ssd, whoisport, version"
            fi
            ;;
        *)
            echo "Invalid function: $func"
            echo "Available methods:"
            echo "delpod, ffirst, gitcommit, gitinfo,gitinfall, kp, loadjson, myinfo, podel, podget, podlog, podvalidname, psa, ssd, whoisport, version"
            ;;
    esac
}