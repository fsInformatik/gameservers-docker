FROM ttt


USER steam
WORKDIR /steam/steamcmd_linux

RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 4020  +quit

WORKDIR /steam/ttt

CMD ["./start.sh"]
