#######################################
# Helper method.
# Arguments:
#   method : method name
#
# Returns:
#   0 if image was created, non-zero on error.
#######################################
--help () {

	local func="$1"
    local file="/bin/shutils/$func.sh"		
	# Extrair a documentação da função do arquivo
        local doc=$(sed -n -e '/^#######################################/,/^#######################################/p' "$file")
    if [ -z "$doc" ]; then
        echo "Invalid function: $1"
    else
        echo "Use: shutils --help $func"
        echo
        echo "Description: $doc"
        echo
        echo "Option:"
        echo ", --help."
    fi
}