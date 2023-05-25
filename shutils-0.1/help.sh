#######################################
# Helper method.
# Arguments:
#   method : method name
#
# Returns:
#   method documentation.
#######################################
help () {

	local func="$1"
    local file="/bin/shutils/$func.sh"		
	# Extrair a documentação da função do arquivo
        local doc=$(sed -n -e '/^#######################################/,/^#######################################/p' "$file")
    if [ -z "$doc" ]; then
        echo "help: Invalid function: $1"
        echo "Available methods:"
        echo "azcopy10inst|dockerhubp|filefirst|filecompress|filenum|filextract|filelarlist|gitcommit|gitinfo|gitinfall|kp|jsonload|myinfo|netinfo|netmyip|podel|podget|podlog|podvalidname|psa|ssd|whoisport|version|help"
    else
        echo "Use: shutils help $func"
        echo
        echo "Description:"
        echo "$doc"
        echo
        echo "Option:"
        echo "help."
    fi
}