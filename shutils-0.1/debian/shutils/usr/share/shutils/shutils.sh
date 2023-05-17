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
            ;;
        gitcommit)
            . /usr/share/shutils/gitcommit.sh
            gitcommit "$@"
            ;;
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
        podel)
            . /usr/share/shutils/podel.sh
            podel "$@"
            ;;
        podget)
            . /usr/share/shutils/podget.sh
            podget "$@"
            ;;
        podlog)
            . /usr/share/shutils/podlog.sh
            podlog "$@"
            ;;
        podvalidname)
            . /usr/share/shutils/podvalidname.sh
            podvalidname "$@"
            ;;
        psa)
            . /usr/share/shutils/psa.sh
            psa "$@"
            ;;
        ssd)
            . /usr/share/shutils/ssd.sh
            ssd "$@"
            ;;
        whoisport)
            . /usr/share/shutils/whoisport.sh
            whoisport "$@"
            ;;
        *)
            echo "Função inválida"
            exit 1
            ;;
    esac
}
