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

    source "/bin/shutils/list.sh"
    local funcs=($(list))

    if [[ " ${funcs[@]} " =~ " $func " ]]; then
        if [ -x "/bin/shutils/$func.sh" ]; then
            source "/bin/shutils/$func.sh"
            $func "$@"
        else
            echo "Invalid method: $func"
            echo "Available methods:"
            printf "%s\n" "${funcs[@]}"
        fi
    else
        echo "Invalid function: $func"
        echo "Available methods:"
        printf "%s\n" "${funcs[@]}"
    fi
}