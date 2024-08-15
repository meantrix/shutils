#######################################
# function will kill processes by name (does the same thing as pkill #but with output). (Usage: kp NAME)
# Arguments:
#   NAME : process name
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
kp () {
  ps aux | grep $1 > /dev/null
  mypid=$(pidof $1)
  if [ "$mypid" != "" ]; then
    kill -9 $(pidof $1)
    if [[ "$?" == "0" ]]; then
      echo "PID $mypid ($1) killed."
    fi
  else
    echo "None killed."
  fi
  return 0;
}
