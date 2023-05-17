# main caller function
shutils() {
    local func="$1"
    shift

    case "$func" in
        delpod|ffirst|gitcommit|gitinfo|kp|loadjson|myinfo|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version)
            if [ -x "/bin/shutils/$func.sh" ]; then
                "/bin/shutils/$func.sh" "$@"
            else
                echo "Invalid method: $func"
                echo "Available methods:"
                echo "delpod, ffirst, gitcommit, gitinfo, kp, loadjson, myinfo, podel, podget, podlog, podvalidname, psa, ssd, whoisport, version"
                exit 1
            fi
            ;;
        *)
            echo "Invalid function: $func"
            echo "Available methods:"
            echo "delpod, ffirst, gitcommit, gitinfo, kp, loadjson, myinfo, podel, podget, podlog, podvalidname, psa, ssd, whoisport, version"
            exit 1
            ;;
    esac
}