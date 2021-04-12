FROM mariadb:10.4

ENV MYSQL_ROOT_PASSWORD root
EXPOSE 3306

ADD my.cnf /etc/mysql/my.cnf


