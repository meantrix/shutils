#######################################
# List processes with a specified pattern name
# Arguments:
#   NAME : process name
# Returns:
#   process name
#######################################
psa () {
  ps aux | grep $1
}
