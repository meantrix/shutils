# Shutils


![logo](https://github.com/meantrix/graphicalresources/blob/master/logo-meantrix/header_transparente_colorido.png)

<!--- These are examples. See https://shields.io for others or to customize this set of shields. You might want to include dependencies, project status and licence info here --->
![GitHub repo size](https://img.shields.io/github/repo-size/scottydocs/README-template.md)
[![version](https://img.shields.io/badge/version-0.0.1-green.svg)](https://semver.org)


Collection of useful bash functions

## Methods

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


## Prerequisites

Before you begin, ensure you have met the following requirements:
<!--- These are just example requirements. Add, duplicate or remove as required --->
* You have a `<Linux/>` machine. State which OS is supported/which is not.
* You have a installed `git`, and `kubectl` OS packages.
* You have read `<guide/link/documentation_related_to_project>`.

## Installing <shutils>

To install <shutils>, follow these steps:

Linux and macOS:

```bash
dpkg -i shutils_*.deb
```

## Using <shutils>

To use <shutils>, follow these steps:

```bash
$ shutils version
#shutils (0.0.1) unstable; urgency=medium

$ shutils netmyip
#  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                 Dload  Upload   Total   Spent    Left  Speed
#100    12  100    12    0     0     53      0 --:--:-- --:--:-- --:--:--    54
#XXXXXXXXXXXXX


$ shutils help podel
#Use: shutils help podel

#Description: #######################################
# Delete a pod by name pattern
# Arguments:
#   podname : podname pattern
#   mynamespace : namespace(default)
#
# Returns:
#   0 if pod was delete, non-zero on error.
#######################################

#Option:
#help.

```
## Contributing to <project_name>
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to <project_name>, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Contributors

Thanks to the following people who have contributed to this project:

* [@meantrix](https://github.com/meantrix) 📖

## Contact

If you want to contact me you can reach me at <contato@meantrix.com>.

## License

This project uses the following license: [<license_name>](<link>).

