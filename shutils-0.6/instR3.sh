#######################################
# instR3 - Install R on Ubuntu
# Arguments:
#   version: The version of R 3.* to install (e.g., 3.6.3)
# Returns:
#   None
#######################################
instR3() {
    local version="$1"

    # Check if R is already installed
    if command -v R >/dev/null 2>&1; then
        echo "R is already installed."
        return
    fi

    # Add the CRAN repository key
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

    # Add the CRAN repository to sources.list
    echo "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran35/" | sudo tee /etc/apt/sources.list.d/cran.list

    # Update the package lists
    sudo apt update

    # Install the specified version of R
    sudo apt install -y r-base=${version}-* r-base-dev=${version}-*

    # Print the installed R version
    R --version
}