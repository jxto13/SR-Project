#!/bin/bash

for n in $(cat ./common_ssh_usernames)
do
        echo [$n]
   	echo real_password = $n
	echo random_chance = 100
	echo 
done

#[legitUser]
#real_password = legitUser
#random_chance = 100
