######################################
# And here is a function which will parse the output of the df command to only show disk space on /dev/sd* and /mnt/* mounted partitions: (Usage: ssd)
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
ssd() {
  echo "Device         Total  Used  Free  Pct MntPoint"
  df -h | awk '/\/dev\/sd/ || /\/mnt\// {print $1, $2, $3, $4, $5, $6}'
  return 0
}