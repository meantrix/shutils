# Docker usefull function

#######################################
# Build and pull image to dockerhub.
# Arguments:
#   PATH : path to dockerfile
#   IMAGE_NAME : image name
#   VERSION : image version
#   DOCKER_USERNAME : username
#   DOCKER_PASSWORD : dockerhub password
#
# Returns:
#   0 if image was created, non-zero on error.
#######################################
dockerhubp () {
    
if [ "$#" < "5" ]; then
    echo "Illegal number of parameters" >&2
    return 2    
fi

local PATHERE="$1"
local IMAGE_NAME="$2"
local VERSION="$3"
local DOCKER_USERNAME="$4"
local DOCKER_PASSWORD="$5"
    
echo "IMAGE_NAME: $2"
echo "VERSION: $3"

docker build $PATHERE  -t $DOCKER_USERNAME/$IMAGE_NAME:$VERSION --no-cache
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push $DOCKER_USERNAME/$IMAGE_NAME:$VERSION 
return 0

}

