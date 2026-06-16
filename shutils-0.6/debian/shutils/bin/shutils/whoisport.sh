#######################################
# Find What is Using a Particular Port
# Arguments:
#   port : port number
#
# Example:
#   $ whoisport 80
# Returns:
#   0 if image was created, non-zero on error.
#######################################
whoisport () {
        port=$1
        pidInfo=$(fuser $port/tcp 2> /dev/null)
        pid=$(echo $pidInfo | cut -d':' -f2)
        ls -l /proc/$pid/exe
}