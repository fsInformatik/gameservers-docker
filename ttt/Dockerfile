FROM steamcmd

USER root


USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/gmod

RUN ./steamcmd.sh +login anonymous +force_install_dir ../gmod +app_update 4020  +quit

ADD start.sh /steam/gmod/

WORKDIR /steam/gmod

ENTRYPOINT ["./start.sh"]
