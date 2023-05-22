#######################################
# Get log from pod by name pattern
# Arguments:
#   podname : podname pattern
#   mynamespace : namespace(default)
#
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
podlog () {

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