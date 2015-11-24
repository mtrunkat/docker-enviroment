FROM ubuntu:14.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y curl apache2 nano
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-mysql php5-curl php-apc

# Basic configuration
ENV TERM xterm

# Set root password
RUN echo "root:root" | chpasswd

# Vhost files
COPY vhost/loc    /etc/apache2/sites-available/loc
COPY vhost/locdoc /etc/apache2/sites-available/locdoc
COPY vhost/locphp /etc/apache2/sites-available/locphp
COPY vhost/locweb /etc/apache2/sites-available/locweb
RUN ln -s /etc/apache2/sites-available/loc    /etc/apache2/sites-enabled/loc.conf 
RUN ln -s /etc/apache2/sites-available/locdoc /etc/apache2/sites-enabled/locdoc.conf 
RUN ln -s /etc/apache2/sites-available/locphp /etc/apache2/sites-enabled/locphp.conf 
RUN ln -s /etc/apache2/sites-available/locweb /etc/apache2/sites-enabled/locweb.conf 

# Override default vhost
COPY vhost/default /etc/apache2/sites-available/000-default.conf

# Configure PHP
COPY conf/php.ini /tmp/php.ini
RUN cat /tmp/php.ini >> /etc/php5/apache2/php.ini

# Configure Apache
COPY conf/apache2.conf /etc/apache2.conf
RUN cat /etc/apache2.conf >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
Run a2enmod vhost_alias
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV SERVERNAME apache

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]