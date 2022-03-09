#!/usr/bin/bash

Ajua_input="/Users/emmanuelozor/Downloads/tnps_users062021..csv"
declare -a name
declare -a username
declare -a EMAIL
declare -a role
declare -a pass

while IFS=, read -r Name Username EMAIL ADDRESS Role Password;
do 
        name+=("$Name")
        username+=("$Username")
        EMAIL+=("$EMAIL")
        role+=("$Role")
        pass+=("$Password")

done<$Ajua_input

for index in "${!username[@]}";
do
        sudo groupadd "${role[$index]}";
        sudo useradd -g "${role[$index]}" \ 
                     -d "/home/${username[index]}" \
                     -s "/bin/bash" \
                     -p "$(echo "${pass[$index]}" | openssh passwd -1 -stdin)" "${username[$index]}"
            done

