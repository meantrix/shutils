#######################################
# check if the given pod name is valid
# Arguments:
#   podname : podename
#
# Returns:
#   0 to indicate that the pod is in the `kubectl get pods` list.
#   1 to indicate that the pod name is invalid (not found)
#######################################
pdvalidname () {
  for pod in $(kubectl get pods | awk 'NR>1{print $1}'); do
    if [[ "$pod" == "$1" ]]; then
      return 0  # pod name found a match, then returns True
    fi
  done
  return 1  # pod not found then returns False
}