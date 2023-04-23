#!/bin/bash

echo -e -n "\e[33mDame el nombre del archivo a buscar: \e[0m"
read archivo

echo -e -n "\e[34mDame la ruta donde vas a buscar el archivo: \e[0m"
read carpeta


if ls "$HOME/$carpeta" | egrep "$archivo"
	then 
	echo -e "\e[32mEl archivo se encontro correctamente \e[0m"
else
	echo -e "\e[31mNo se encontro el archivo \e[0m"
fi
