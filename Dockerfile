FROM centos/systemd

MAINTAINER miltonjesusvc@ufps.edu.co
MAINTAINER andresbbx@gmail.com
MAINTAINER carlos22ivan@gmail.com

WORKDIR /home/

RUN yum install -y wget

RUN yum install -y --nogpg httpd

RUN yum install -y epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum-config-manager --enable remi-php80

RUN yum install -y php php-common php-opcache php-pecl-mcrypt php-cli php-gd php-mysqlnd php-mbstring php-pecl-zip php-xmlrpc php-soap php-intl php-ldap libsodium libsodium-devel

RUN wget https://raw.githubusercontent.com/ingsistemascloud/moodle/master/config/httpd.conf

RUN mv httpd.conf /etc/httpd/conf/

RUN wget https://raw.githubusercontent.com/ingsistemascloud/moodle/master/config/start.sh

RUN yum install -y crontabs

RUN systemctl enable httpd

EXPOSE 80
