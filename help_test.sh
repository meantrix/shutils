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
        azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|--version|help)
            local ishelp="$2"
            if [ ishelp=="--help"]; then
                source "/bin/shutils/help.sh"
                show_help $func
            else    
                if [ -x "/bin/shutils/$func.sh" ]; then
                    source "/bin/shutils/$func.sh"
                    $func "$@"
                else
                    echo "Invalid method: $func"
                    echo "Available methods:"
                    echo "azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version"
                fi
            fi
            ;;
        *)
            echo "Invalid function: $func"
            echo "Available methods:"
            echo "azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version"
            ;;
    esac
}

show_help () {

	local func="$1"
    local file="/bin/shutils/$func.sh"		
	# Extrair a documentação da função do arquivo
        local doc=$(sed -n -e '/^#######################################/,/^#######################################/p' "$file")
    if [ -z "$doc" ]; then
        echo "Invalid function: $1"
    else
        echo "Use: shutils $func"
        echo
        echo "Description: $doc"
        echo
        echo "Opções:"
        echo "  -h, --help        Exibe esta mensagem de ajuda."
    fi
}




--my_function() {

    local v1="$1"
    echo "Argument 1: $v1"
    echo "Arguments: ${@:2}"
}
