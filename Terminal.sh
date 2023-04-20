#!/bin/bash

Mem_RAM=$(grep MemTotal /proc/meminfo | awk '{print $2 / 1024}')
echo "Memoria RAM: $Mem_RAM Mb"


SO=$(lsb_release -d | awk '{printf $2 " " $3 " " $4}')
echo "Sistema Operativo: $SO"



Arquitectura=$(lscpu| awk '/Arquitectura/ {print $2}')
echo "Arquitectura: $Arquitectura"


