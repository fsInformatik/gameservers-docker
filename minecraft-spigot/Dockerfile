FROM openjdk:8-slim-buster AS builder

WORKDIR /minecraft

RUN apt-get update -qq && apt-get install -qq wget git

RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar 
#RUN ["/bin/bash", "git", "config --global --unset core.autocrlf"]

RUN java -Xmx1024M -jar BuildTools.jar


FROM base

RUN apt-get update -qq && apt-get install -qq openjdk-8-jre-headless

RUN useradd minecraft
RUN mkdir /data && chown -R minecraft /data

USER minecraft
WORKDIR /minecraft

COPY --from=builder /minecraft/spigot-*.jar /minecraft/spigot.jar
ADD entrypoint.sh entrypoint.sh

WORKDIR /data

ENTRYPOINT ["/minecraft/entrypoint.sh"]
