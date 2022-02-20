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

if [ "$1" == "--create" ];then
    echo "notre option est --create"
elif [ "$1" == "--start" ];then
    echo "option --start"
elif [ "$1" == "--drop" ];then
    echo "option --drop"
elif [ "$1" == "--infos" ];then
    echo "option --infos"
elif [ "$1" == "--ansible" ];then
    echo "option --ansible"
else
    echo "$options"
fi



