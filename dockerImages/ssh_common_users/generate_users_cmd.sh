#!/bin/bash

for n in $(cat ./common_ssh_usernames)
do
	echo RUN useradd -m $n
	echo RUN echo \'$n:$n\' \| chpasswd	
done
