# Installing PHP for nextcloud

#install php8.0 and moduls
apt update && apt install -y php8.0-cli php8.0-common php8.0-mbstring php8.0-gd php8.0-imagick php8.0-intl php8.0-bz2 php8.0-xml php8.0-pgsql php8.0-zip php8.0-dev php8.0-curl php8.0-fpm redis-server php8.0-redis php8.0-smbclient php8.0-ldap php8.0-bcmath php8.0-gmp libmagickcore-6.q16-6-extra

#Configure Apache2 and php8.0-fpm
#enable the needed modules in Apache2
a2enmod proxy_fcgi setenvif mpm_event rewrite headers env dir mime ssl http2

#activate php8.0-fpm:
a2enconf php8.0-fpm

#edit the apache2.conf to allow the usage of .htaccess-files:
nano /etc/apache2/apache2.conf

# change the following code:
# <Directory /var/www/>
# Options Indexes FollowSymLinks
# AllowOverride None
# Require all granted
# </Directory>

# to:
# <Directory /var/www/>
# Options Indexes FollowSymLinks
# AllowOverride All
# Require all granted
# </Directory>

# To enable HTTP/2, we need to add this line to apache2.conf:
# Protocols h2 h2c http/1.1

# now we have to prepare the php.ini for nextcloud:
# nano /etc/php/8.0/fpm/php.ini

# extend with the following directives:
# opcache.enable=1
# opcache.enable_cli=1
# opcache.interned_strings_buffer=8
# opcache.max_accelerated_files=10000
# opcache.memory_consumption=128
# opcache.save_comments=1
# opcache.revalidate_freq=1
# and adjust the following Lines:

# max_execution_time = 300
# max_input_time = 600
# memory_limit = 512M
# upload_max_filesize = 10240M

# Afterwards, the web server and php8.0-fpm must be restarted:
# systemctl restart apache2 php8.0-fpm

# Step 6: Install Certbot and other tools
# To request a ssl-sert from LetsEncrypt we use Certbot and the apache-plugin:
# apt install -y python3-certbot-apache certbot wget curl sudo unzip

# Step 7: Create Database
# Before we can install Nextcloud, we first have to create a database in postgreSQL. To do this, we execute the following commands:
# sudo -u postgres psql

# then execute:
# CREATE USER nextcloud WITH PASSWORD 'your-password';
# CREATE DATABASE nextclouddb TEMPLATE template0 ENCODING 'UNICODE';
# ALTER DATABASE nextclouddb OWNER TO nextcloud;
# GRANT ALL PRIVILEGES ON DATABASE nextclouddb TO nextcloud;
# \q