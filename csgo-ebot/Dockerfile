FROM csgo

USER root

RUN apt-get install  -y curl 


WORKDIR /steam/csgo/

ADD download.sh /tmp/download.sh
RUN /tmp/download.sh

ADD esl5on5.cfg /steam/csgo/csgo/cfg/server.cfg
ADD esl5on5.cfg /steam/csgo/csgo/cfg/gamemode_competitive_server.cfg
ADD start.sh /steam/csgo/start.sh
USER root
#ADD cfg csgo/cfg
#RUN chown  -R steam:steam csgo/cfg/
USER steam
