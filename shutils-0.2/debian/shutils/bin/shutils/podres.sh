#######################################
# List Pods Resources
# Description:
#   Lists the resource usage (CPU and Memory) of all pods in a given namespace.
#   If no namespace is provided, the function uses the default namespace.
# Arguments:
#   namespace (optional): The namespace to list pods from (default: 'default')
# Returns:
#   None
#######################################
podres() {
    local namespace="${1:-default}"

    # Verify if the namespace exists
    if ! kubectl get namespace "$namespace" > /dev/null 2>&1; then
        echo "Namespace '$namespace' does not exist."
        return 1
    fi

    echo "Namespace: $namespace"
    echo

    # Get the list of pods in the namespace
    local pods
    pods=$(kubectl get pods -n "$namespace" --no-headers -o custom-columns=":metadata.name")

    # Iterate over each pod and display its resource usage
    while read -r pod; do
        echo "Pod: $pod"

        # Get CPU usage
        local cpu_usage
        cpu_usage=$(kubectl top pod "$pod" -n "$namespace" --containers --no-headers | awk '{print $3}')

        # Get memory usage
        local mem_usage
        mem_usage=$(kubectl top pod "$pod" -n "$namespace" --containers --no-headers | awk '{print $4}')

        # Display resource usage
        echo "CPU Usage: $cpu_usage"
        echo "Memory Usage: $mem_usage"
        echo "------------------------"
    done <<< "$pods"

}
