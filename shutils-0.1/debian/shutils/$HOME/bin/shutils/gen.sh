#######################################
#This is a function to show some system information 
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
myinfo () {
  printf "CPU: "
  cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
  printf "\n"
  cat /etc/issue | awk '{ printf "OS: %s %s %s %s | " , $1 , $2 , $3 , $4 }'
  uname -a | awk '{ printf "Kernel: %s " , $3 }'
  uname -m | awk '{ printf "%s | " , $1 }'
printf "\n"
printf "GPU: "
  lspci | grep ' VGA ' | cut -d" " -f 1 | xargs -i lspci -v -s {}
  printf "\n"
  uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
  printf "\n"
  #cputemp | awk '{ printf "%s %s", $1 $2 }'

  return 0 

}

#The next function will kill processes by name (does the same thing as pkill #but with output). (Usage: kp NAME)

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

#And here is a function which will parse the output of the df command to only show disk space on /dev/sd* and /mnt/* mounted partitions: (Usage: ssd)

# Docker usefull function

#######################################
# And here is a function which will parse the output of the df command to only show disk space on /dev/sd* and /mnt/* mounted partitions: (Usage: ssd)
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
ssd () {
  echo "Device         Total  Used  Free  Pct MntPoint"
  df -h | grep "/dev/sd"
  df -h | grep "/mnt/"

  return 0 
}

#######################################
# search for directory with a given name
# Arguments:
#   directory : directory name
#   root : dir to search
# Returns:
#   directory path
#######################################
ffirst () {

  if [ "$#" -eq 1 ]
  then
    local dir=$HOME
  else 
    local dir="$2"
  fi

  find $dir -type d -name $1 -print -quit

}