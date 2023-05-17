######################################
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