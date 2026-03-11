#######################################
# Helper method.
# Arguments:
#   method : method name
#
# Returns:
#   method documentation.
#######################################
help () {

    source "/bin/shutils/list.sh"
    local funcs=($(list))

	local func="$1"
    local file="/bin/shutils/$func.sh"		
	# Extrair a documentação da função do arquivo
        local doc=$(sed -n -e '/^#######################################/,/^#######################################/p' "$file")
    if [ -z "$doc" ]; then
        echo "help: Invalid function: $1"
        echo "Available methods:"
        printf "%s\n" "${funcs[@]}"
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


