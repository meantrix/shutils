#######################################
# Kill all processes running on a specific port.
#
# Arguments:
#   port : The port where processes are running.
#
# Returns:
#   0 if the processes were successfully terminated, or a message indicating no processes were found on the given port.
#######################################
portkill() {
    if [ -z "$1" ]; then
        echo "Usage: port_kill <port>"
        return 1
    fi

    PORT=$1
    PIDS=$(sudo lsof -t -i :$PORT)

    if [ -z "$PIDS" ]; then
        echo "No processes found on port $PORT."
    else
        echo "Killing processes on port $PORT..."
        sudo kill -9 $PIDS
        echo "Processes on port $PORT have been terminated."
    fi
}
