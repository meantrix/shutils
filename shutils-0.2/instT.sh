instT() {
    local version="${1:-1.2.3}"
    local architecture="${2:-linux_amd64}"
    local download_url="https://releases.hashicorp.com/terraform/${version}"
    local terraform_zip="terraform_${version}_${architecture}.zip"
    local terraform_executable="/usr/local/bin/terraform"

    # Check if the operating system is Linux
    if [[ "$OSTYPE" != "linux-gnu"* ]]; then
        echo "This script is only compatible with Linux operating systems."
        return 1
    fi

    # Check if the appropriate .zip file is available
    local zip_file="${terraform_zip}"
    if [[ ! -f "${zip_file}" ]]; then
        echo "The .zip file corresponding to the specified architecture is not available for download."
        return 1
    fi

    # Download the .zip file
    wget "$download_url/$terraform_zip"

    # Check if the download is successful
    if [[ $? -ne 0 ]]; then
        echo "Failed to download the .zip file."
        return 1
    fi

    # Unzip the .zip file
    unzip "$terraform_zip"

    # Give executable permissions to the binary
    chmod +x terraform

    # Move the Terraform executable to /usr/local/bin/
    sudo mv terraform "$terraform_executable"

    # Confirm the installed version
    terraform --version
}
