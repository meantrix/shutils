# Docker usefull function

#######################################
# Delete a pod by name pattern
# Arguments:
#   podname : podname pattern
#   mynamespace : namespace(default)
#
# Returns:
#   0 if pod was delete, non-zero on error.
#######################################
sh_delpod() {

local podname="$1"

if [ "$#" -eq 1 ]
then
    local mynamespace="default"
else 
    local mynamespace="$2"
fi

echo "PODNAME: $podname"
echo "NAMESPACE: $mynamespace"

kubectl get pods -n $mynamespace --no-headers=true | awk /${podname}/'{print $1}'| xargs  kubectl delete pod -n $mynamespace

return 0

}


######################################
# Get log from pod by name pattern
# Arguments:
#   podname : podname pattern
#   mynamespace : namespace(default)
#
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
sh_pod_log() {

local podname="$1"

if [ "$#" -eq 1 ]
then
    local mynamespace="default"
else 
    local mynamespace="$2"
fi

echo "PODNAME: $podname"
echo "NAMESPACE: $mynamespace"

kubectl get pods -n $mynamespace --no-headers=true | awk /${podname}/'{print $1}'| xargs  kubectl logs -n $mynamespace

}


######################################
# Get full pod name by pattern
# Arguments:
#   podname : podname pattern
#   mynamespace : namespace(default)
#
# Returns:
#   pod fullname
#######################################
sh_pod_get() {

local podname="$1"

if [ "$#" -eq 1 ]
then
    local mynamespace="default"
else 
    local mynamespace="$2"
fi

echo "PODNAME: $podname"
echo "NAMESPACE: $mynamespace"

kubectl get pods -n $mynamespace --no-headers=true | awk /${podname}/'{print $1}'

}


#######################################
# check if the given pod name is valid
# Arguments:
#   podname : podename
#
# Returns:
#   0 to indicate that the pod is in the `kubectl get pods` list.
#   1 to indicate that the pod name is invalid (not found)
#######################################
function sh_pod_valid_name {
  for pod in $(kubectl get pods | awk 'NR>1{print $1}'); do
    if [[ "$pod" == "$1" ]]; then
      return 0  # pod name found a match, then returns True
    fi
  done
  return 1  # pod not found then returns False
}