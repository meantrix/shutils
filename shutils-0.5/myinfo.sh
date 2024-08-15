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





