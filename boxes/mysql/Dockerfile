FROM mysql

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y nano

# Basic configuration
ENV TERM xterm

# Give Mysql access to the mounted data volume.
RUN usermod -u 1000 mysql

# Give Mysql access to some required directories.
RUN chown -R mysql:mysql /var/run/mysqld/

# Set root password
RUN echo "root:root" | chpasswd

EXPOSE 3306

CMD ["mysqld"]