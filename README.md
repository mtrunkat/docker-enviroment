# Docker enviroment
Universal Docker containers that I use for web development. Each directory contains configuration and helper scripts for one docker container.

Each container contains following bash scripts:
* ``build.sh`` - build instance
* ``run.sh`` - run instance
* ``ssh.sh`` - connect to instance via ssh

## Apache

* Port **80** of Docker host is mapped to port **80** of Apache container.
* Directory **~/Workspace/www** of host machine is shared to Docker container as **/var/www**.
* VHOST domain mapping:
  - ``[www.]*.loc`` -> ``/var/www/*``
  - ``[www.]*.locdoc`` -> ``/var/www/*/docroot`` (used for Drupal)
  - ``[www.]*.locweb`` -> ``/var/www/*/web`` (used for Symfony etc.)
* Configuration files:
  - conf/php.ini
  - conf/apache.conf
  
## Redis

* Port **6379** of Docker host is mapped to port **6379** of Redis container.
* Data stored in **volumes/redis** in host machine.

## MySQL

* Port **3306** of Docker host is mapped to port **3306** of Redis container.
* Data stored in **volumes/mysql** in host machine.
* Root password is empty.
* It's necessary to manually ssh to MySQL container and allow root connection from other servers with command:

```mysql
USE mysql;
UPDATE user SET host = '%' WHERE user = 'root';
```
