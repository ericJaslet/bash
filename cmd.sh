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
    echo "notre option est --create "
    nb_machine=1
    re='^[0-9]+$'
    if [[ $2 =~ $re  &&  "$2" > 0 ]]; then #double crocher obligatoire pour re
        echo "est un nombre"
        [ "$2" != "" ] && nb_machine=$2

        docker run -tid --name $USER-alpine alpine:latest

        echo "nombre de container créé : ${nb_machine}"
    fi

#si option --start
elif [ "$1" == "--start" ];then
    echo "option --start"

#si option --drop
elif [ "$1" == "--drop" ];then
    echo "option --drop"
    docker rm -f $USER-alpine

#si option --infos
elif [ "$1" == "--infos" ];then
    echo "github depot Eric jaslet"

#si option --ansible
elif [ "$1" == "--ansible" ];then
    echo "option --ansible"
else
    echo "$options"
fi
