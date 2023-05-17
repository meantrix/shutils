# main caller function
shutils() {
    local func="$1"
    shift

    case "$func" in
        delpod)
            . /usr/share/shutils/dockerhubp.sh
            dockerhubp "$@"
            ;;
        ffirst)
            . /usr/share/shutils/ffirst.sh
            ffirst "$@"
        gitcommit)
            . /usr/share/shutils/gitcommit.sh
            gitcommit "$@"
        gitinfo)
            . /usr/share/shutils/gitinfo.sh
            gitinfo "$@"
            ;;
        kp)
            . /usr/share/shutils/kp.sh
            kp "$@"
            ;;
        loadjson)
            . /usr/share/shutils/loadjson.sh
            loadjson "$@"
            ;;
        myinfo)
            . /usr/share/shutils/myinfo.sh
            myinfo "$@"
            ;;
        *)
            echo "Função inválida"
            exit 1
            ;;
    esac
}