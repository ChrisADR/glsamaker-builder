FROM gentoo/stage3-amd64:latest
MAINTAINER Christopher Diaz Riveros "chrisadr@gentoo.org"
ENV REFRESEHD_AT 2018-03-29

#update repo
RUN ["emerge-webrsync"]

#install & config test-db
RUN ["emerge", "mysql"]
COPY /config/.my.cnf /root/
RUN ["emerge", "--config", "mysql"]

#install deps
COPY /config/bugzilla /etc/portage/package.use/
COPY /config/apache /etc/portage/package.use/
RUN ["emerge", "rake", "dev-ruby/bundler", "www-apps/bugzilla"]

#prepare glsamker dir
RUN ["mkdir", "/glsamaker"]
RUN ["mkdir", "/config"]
RUN ["mkdir", "/database"]

#send config files
COPY /config/database.yml /config/
COPY /config/glsamaker.rb /config/
COPY /database/bugzilla.sql /database/
COPY /database/glsamaker.sql /database/

#prepare bugzilla
COPY /bugzilla/localconfig /var/www/localhost/htdocs/bugzilla/
COPY /bugzilla/default_vhost.include /etc/apache2/vhosts.d/
COPY /bugzilla/checksetup.conf /config/

#run final configurations
COPY /init/init.sh /

EXPOSE 80
EXPOSE 3000

CMD ["/bin/bash", "/init.sh"]
