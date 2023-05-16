#
# Regular cron jobs for the shutils package
#
0 4	* * *	root	[ -x /usr/bin/shutils_maintenance ] && /usr/bin/shutils_maintenance
