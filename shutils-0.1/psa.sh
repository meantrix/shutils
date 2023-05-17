#######################################
# Another quick function to shorten something like this: ps aux | grep PROCESS_NAME. (Usage: psa NAME)
# Arguments:
#   NAME : process name
# Returns:
#   process name
#######################################
psa () {
  ps aux | grep $1
}
