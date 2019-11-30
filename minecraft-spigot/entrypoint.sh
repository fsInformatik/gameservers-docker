#!/bin/bash

if [ ! -f eula.txt ]; then
	echo 'eula=true' > eula.txt
fi

java -Xmx1024M -jar /minecraft/spigot.jar
