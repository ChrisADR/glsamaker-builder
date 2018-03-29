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
RUN ["emerge", "rake", "dev-ruby/bundler", "www-apps/bugzilla"]

#prepare glsamker dir
RUN ["mkdir", "-p", "/glsamaker"]
RUN ["mkdir", "/config"]

COPY /config/database.yml /config
COPY /config/glsamaker.rb /config

COPY /config/README /
COPY /init/init.sh /

EXPOSE 80
EXPOSE 3000

CMD ["/bin/bash", "/init.sh"]
