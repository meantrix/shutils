#######################################
# Retrieves information about NVIDIA GPUs using the nvidia-smi command.
# Displays the GPU index, device name, and memory usage.
# Dependencies:
# - NVIDIA drivers
# - nvidia-smi command
# Arguments:
# Returns:
#######################################
nviuse() {
    if command -v nvidia-smi >/dev/null 2>&1; then
        local nvidia_info
        nvidia_info=$(nvidia-smi --query-gpu=index,name,memory.total,memory.used --format=csv,noheader)
        while IFS=',' read -r index name total used; do
            echo "GPU Index: $index"
            echo "Device Name: $name"
            echo "Memory Usage: $used / $total"
            echo "------------------------"
        done <<< "$nvidia_info"
    else
        echo "NVIDIA drivers or nvidia-smi command not found."
    fi
}

nviuse
