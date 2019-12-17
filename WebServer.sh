#!/bin/bash
while true;
do
echo "|                  MENU                |"
echo "[1] Update"
echo "[2] Install Apache"
echo "[3] Install MySQL"
echo "[4] Installing Laravel"
echo "[5] Create-Project Laravel"
echo "[6] Set VirtualHost"
echo "[7] Restart Apache2"
echo "[8] Restart All"
echo "[9] EXIT"
echo "......................................."
read -p "Please enter the number : " input
case $input in
			1)sudo apt update && sudo apt upgrade -y;;
			
			2)sudo apt-get install apache2 -y;; 
			
			3)sudo apt-get install mysql-server mysql-client -y
			sudo apt install php7.0-mysql -y
				sudo apt-get install php libapache2-mod-php -y
				sudo apt-cache search php-
                sudo apt-get install phpmyadmin -y
                sudo ln -s /usr/share/phpmyadmin /var/www/html
                sudo service apache2 restart;;
			4)cd /tmp
				curl -sS https://getcomposer.org/installer | php
				sudo mv composer.phar /usr/local/bin/composer;;

			5)cd /var/www/html
				read -p "laravel project name is: " project-name	
				sudo composer create-project laravel/laravel $project --prefer-dist
				sudo chgrp -R www-data /var/www/html/$project
				sudo chmod -R 775 /var/www/html/$project/storage;;
				
			6)cd /etc/apache2/sites-available
				sudo nano laravel.conf;;
				
			7)sudo service apache2 restart;;
			
			8)sudo a2dissite 000-default.conf
				sudo a2ensite laravel.conf
				sudo a2enmod rewrite
				sudo service apache2 restart;;
			9)echo "END" ;exit;;
			
        *);;
        esac
done
