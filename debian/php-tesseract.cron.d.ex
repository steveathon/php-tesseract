#
# Regular cron jobs for the php-tesseract package
#
0 4	* * *	root	[ -x /usr/bin/php-tesseract_maintenance ] && /usr/bin/php-tesseract_maintenance
