#######################################
# print local net info
# Returns:
#   Speed, Myip
#######################################
function netinfo () {
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    echo "IP: $(curl http://ifconfig.me/ip)"
    echo "---------------------------------------------------"
}