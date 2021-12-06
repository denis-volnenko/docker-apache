FROM ubuntu:18.04
MAINTAINER Denis Volnenko (denis@volnenko.ru)

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt install -y apache2 mc

RUN echo 'ServerName webserver' >> /etc/apache2/apache2.conf
RUN service apache2 restart

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
