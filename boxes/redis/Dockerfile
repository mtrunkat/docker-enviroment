FROM redis

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y nano

# Basic configuration
ENV TERM xterm

# Give Apache access to the mounted /var/www
RUN usermod -u 1000 redis

# Redis configuration
COPY conf/redis.conf /usr/local/etc/redis/redis.conf
RUN touch /var/log/redis
RUN chown redis:redis /var/log/redis

# Set root password
RUN echo "root:root" | chpasswd

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]