######################################
# Get full pod name by pattern
# Arguments:
#   podname : podname pattern
#   mynamespace : namespace(default)
#
# Returns:
#   pod fullname
#######################################
podget () {

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
