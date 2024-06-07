#######################################
# print my ip
# Returns:
#   ip number
#######################################
function netmyip() {
    local ip=$(curl http://ifconfig.me/ip)
    echo $ip
}