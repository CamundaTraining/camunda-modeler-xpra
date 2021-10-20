FROM ffeldhaus/docker-xpra-html5-minimal

RUN apt-get update
ADD https://github.com/camunda/camunda-modeler/releases/download/v4.11.1/camunda-modeler-4.11.1-linux-x64.tar.gz /tmp/modeler.tar.gz
RUN tar -xzf /tmp/modeler.tar.gz
RUN apt-get install -y  libnss3 libgbm-dev
RUN apt-get install -y libasound-dev
ADD xpra.conf /tmp
RUN cat < /tmp/xpra.conf >> /etc/xpra/xpra.conf
ADD html5.conf /usr/share/xpra/www/default-settings.txt
CMD ["/home/xpra/camunda-modeler-4.11.1-linux-x64/camunda-modeler", "--no-sandbox"]
