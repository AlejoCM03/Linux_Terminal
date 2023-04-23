#!/bin/bash


echo ""
echo ""
echo -e "\e[34m   _____ _____  _____ _______ ______ __  __           \e[0m"
echo -e "\e[34m  / ____|_   _|/ ____|__   __|  ____|  \/  |   /\     \e[0m"
echo -e "\e[34m | (___   | | | (___    | |  | |__  | \  / |  /  \    \e[0m"
echo -e "\e[34m  \___ \  | |  \___ \   | |  |  __| | |\/| | / /\ \   \e[0m"
echo -e "\e[34m  ____) |_| |_ ____) |  | |  | |____| |  | |/ ____ \  \e[0m"
echo -e "\e[34m |_____/|_____|_____/   |_|  |______|_|  |_/_/    \_\ \e[0m"
echo ""
echo ""

Mem_RAM=$(grep MemTotal /proc/meminfo | awk '{print $2 / 1024}')
echo -e "\e[1;36m       Memoria RAM: \e[0m \e[37m $Mem_RAM Mb \e[0m"


SO=$(lsb_release -d | awk '{printf $2 " " $3 " " $4}')
echo -e "\e[1;36m       Sistema Operativo: \e[0m \e[37m $SO \e[0m"



Arquitectura=$(lscpu| awk '/Arquitectura/ {print $2}')
echo -e "\e[1;36m       Arquitectura: \e[0m \e[37m $Arquitectura \e[0m"


echo ""
echo ""
echo ""



