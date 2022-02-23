#!/bin/bash

################################################################
#
# Desctiption : déploiement à la volée de container docker
#
# Auteur : Eric
# Date : 19/02/2022
#
################################################################

myvar="Eric"
myage=44

echo "$#"
read -d '' options <<"BLOCK"
Options :
    - --create : lancer des conteneurs
    - --start : redemarage des conteneurs
    - --drop : supprimer les conteneurs créer par le deploy.sh
    - --infos : caractéristiques des conteneurs (ip, nom, uer...)
    - --ansible : deploiement arborescence ansible

cmd : 
    - -z : variable vide
    - -f : fichier existe
    - -d : répertoire existe 
BLOCK

#si option --create
if [ "$1" == "--create" ];then
    
    nb_machine=1
    re='^[0-9]+$'
    if [[ $2 =~ $re  &&  "$2" > 0 ]]; then #double crocher obligatoire pour re
        [ "$2" != "" ] && nb_machine=$2
        echo "Création de ${nb_machine} conteneur(s)."

        # Récupération de l'id max
        idmax = `docker ps -a --format '{{ .Names }}' | awk -F "-" -v user=$USER '$0 ~ user"-alpine" {print $3}' | sort -r | head -1`

        for i in $(seq 1 $nb_machine);do
            docker run -tid --name $USER-alpine-$i alpine:latest
            echo "Conteneur $USER-alpine-$i créé."
        done
        echo "nombre de container créé : ${nb_machine}"
    fi

#si option --start
elif [ "$1" == "--start" ];then
    echo "option --start"

#si option --drop
elif [ "$1" == "--drop" ];then
    echo "Suppression du/des containeur(s)..."
    docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')
    echo "fin de la suppression du/des containeur(s)."

#si option --infos
elif [ "$1" == "--infos" ];then
    echo "github depot Eric jaslet"

#si option --ansible
elif [ "$1" == "--ansible" ];then
    echo "option --ansible"
else
    echo "$options"
fi
