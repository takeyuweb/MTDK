FROM php:7.1-apache-jessie
MAINTAINER Yuichi Takeuchi <yuichi.takeuchi@takeyuweb.co.jp> (@takeyuweb)

WORKDIR /

RUN apt-get update -qq

RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install libssl-dev
RUN apt-get -y install libxml2-dev
RUN apt-get -y install libmysqlclient-dev
RUN apt-get -y install cpanminus
RUN apt-get -y install perlmagick

RUN rm -rf /var/cache/apk/*

RUN perl -v

RUN cpanm DBI
RUN cpanm DBD::mysql
RUN cpanm Archive::Zip
#RUN cpanm XML::Parser
RUN apt-get -y install libxml-parser-perl
RUN cpanm XML::SAX::Expat
RUN cpanm Text::CSV_XS
RUN cpanm YAML::Syck
RUN cpanm Digest::SHA1
RUN cpanm IO::Socket::SSL
RUN cpanm MIME::Parser
RUN cpanm XML::LibXML::SAX
RUN cpanm Cache::Memcached

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data

RUN mkdir /data
RUN mkdir /data/files
RUN mkdir /data/mt
RUN chown -R www-data:www-data /data

COPY apache-ports.conf /etc/apache2/ports.conf
COPY apache-000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod cgi
RUN a2enmod rewrite

RUN docker-php-ext-install pdo_mysql mbstring
COPY php-99-customize.conf /usr/local/etc/php/conf.d/99-customize.conf

WORKDIR /data
