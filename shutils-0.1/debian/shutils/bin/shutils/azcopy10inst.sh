#######################################
# Install azcopy 10 (https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10)
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
azcopy10inst() {
    wget -O azcopy\_v7.tar.gz https://aka.ms/downloadazcopylinux64
    mkdir azcopy\_v7
    tar -xf azcopy\_v7.tar.gz -C azcopy\_v7
    wget -O azcopy\_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux
    mkdir azcopy\_v10
    tar -xf azcopy\_v10.tar.gz -C azcopy\_v10
    ls azcopy\_v10
    mv azcopy\_v10/azcopy\_linux\_amd64\_10.18.0 azcopy\_v10/azcopy
    cp azcopy\_v7/install.sh azcopy\_v10/install.sh
    cp azcopy\_v7/azcopy/azcopy\_autocomplete azcopy\_v10/azcopy/
    cp azcopy\_v7/azcopy/startup azcopy\_v10/azcopy/
    sudo ./azcopy\_v10/install.sh
    rm -f azcopy\_v7.tar.gz
    rm -f azcopy\_v10.tar.gz
    rm -rf azcopy\_v7
    rm -rf azcopy\_v10
    return 0
}