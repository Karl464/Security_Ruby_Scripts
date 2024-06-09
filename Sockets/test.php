<!--
Copy the file into the folder /var/www/html, and then enter the commands:
> chmod 755 /var/log/apache2 
> chmod 644 /var/log/apache2 
Verify that the web server is running by entering netstat -atn | grep 80.
--¡>

<?php

print "<pre>"; print passthru('cat /var/log/apache2/access.log');

?>

