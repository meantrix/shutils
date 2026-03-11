## 0.6 (10/03/26)
- **Package installation/upgrade fix**: Fixed `.deb` installation and reinstallation flow for newer Ubuntu versions, especially Ubuntu 24.04.
- **`postinst`**: Added post-install configuration to load `shutils.sh` through `/etc/profile.d/shutils.sh`.
- **`prerm`**: Added safe cleanup of `/etc/bash.bashrc`, `/etc/zsh/zshrc`, and `/etc/profile.d/shutils.sh` on package removal.
- **`postrm`**: Added final cleanup on `purge` without removing package-owned files managed by `dpkg`.
- **`preinst`**: Simplified pre-install script to avoid deleting installed files during upgrade/reinstall.
- **Upgrade safety**: Removed destructive maintenance behavior that could delete `/bin/shutils` during reinstall or package upgrade.
- **Shell integration**: Improved idempotent shell hook registration, avoiding duplicate entries in `bashrc` and `zshrc`.
- **Ubuntu 24.04 compatibility**: Adjusted maintainer scripts to behave correctly under newer Debian/Ubuntu package lifecycle handling.

## 0.5 (15/08/24)
- **`portkill`**:Kill all processes running on a specific port.

## 0.4 (07/06/24)

## Changelog for shutils Package - Version 0.4 (07/06/24)

### New Methods in 0.4

- **`gitlog`**: This function generates a comprehensive changelog between two specified branches, including detailed file changes. It's designed to provide insights into the modifications within a Git repository, listing all commits, the status of files (added, removed, modified), and producing a diff of the changes. This tool is particularly useful for developers and teams needing to track changes systematically before releases or for documentation purposes.

  - **Usage**: `gitlog <base-branch> <head-branch> [ignore_ext1 ignore_ext2 ...]`
  - **Features**:
    - Fetches updates from the remote repository.
    - Dynamically handles file paths and types with optional exclusions for certain file extensions.
    - Outputs the results into a markdown file named with the current date and time, making it easy to incorporate into project documentation or version control systems.

- **`gptsend`**: Automates the process of sending Markdown content to ChatGPT for processing, with the ability to customize the prompt and control the number of tokens returned. This method is useful for generating human-like text based on provided content, suitable for applications like automated changelog descriptions, summarizing documentation, or even generating content for reports.

  - **Usage**: `gptsend <path-to-markdown-file> [prompt] [max_tokens] [model]`
  - **Features**:
    - Allows customization of the interaction by specifying the prompt, the model used for processing, and the maximum number of tokens.
    - Utilizes OpenAI's API, requiring an API key set in the environment.
    - Saves the generated response in a Markdown file timestamped to ensure traceability and version control.
    - Incorporates error handling for file existence, API key availability, and necessary command dependencies.

### Other Improvements and Fixes
- Fixed the `instT` function to enhance compatibility with various Linux distributions, ensuring that Terraform installs smoothly without errors.
- Streamlined error handling and user feedback mechanisms across the script suite to enhance usability and reliability.


## 0.3 (22/09/23)

### New Methods
- gitprinfo : Get user's git pull request (PR) history within a time range
- gitisinfo : Get the total count of closed issues assigned to a user in multiple Git repositories within a specified time range.

### Other
- Renamed methods :
    * gitinfall to gitcsinfo ;
    * gitcommit to gitc ;
    * gitinfo to gitcinfo;
    
## 0.2 (04/06/23)

### New Methods

* filelarlist : List the largest files in the computer or a specific directory ;
* nviuse : Retrieves information about NVIDIA GPUs using the nvidia-smi command ;
* podres : Lists the resource usage (CPU and Memory) of all pods in a given namespace ;
* instR3 : Install R on Ubuntu ;
* instT : Install Terraform on a Linux system ;
* list : List available methods in shutils

 - refact `shutils` main method ;

## 0.1

first version of the package to be used in cloud process automation

### Methods

* azcopy10inst
* dockerhubp
* filefirst
* filecompress
* filenum
* filextract
* gitcommit
* gitinfo
* gitinfall
* kp
* jsonload
* myinfo
* netinfo
* netmyip
* podel
* podget
* podlog
* podvalidname
* psa
* ssd
* whoisport
* version
* help

## Others

* Creates `build.sh` with step-by-step instructions for building the package;
* Create `install` with custom install settings;
* Create `postrm` with custom remove settings;
* Create `preinst` with custom pre-install settings.


