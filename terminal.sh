
#!/bin/bash


echo ""
echo ""

echo -e "  \e[33m_________\e[0m\e[31m ___ ______________\e[0m\e[33m.____    .____      \e[0m"
echo -e " \e[33m/   _____/\e[0m\e[31m/   |   \_   _____/\e[0m\e[33m|    |   |    |     \e[0m"
echo -e " \e[33m\_____   \\e[0m\e[31m/    ~    \    __)_ \e[0m\e[33m|    |   |    |     \e[0m"
echo -e " \e[33m/        \ \e[0m\e[31m    Y    /        \\e[0m\e[33m|    |___|    |___  \e[0m"
echo -e "\e[33m/_______  /\e[0m\e[31m\___|_  /_______  /\e[0m\e[33m|_______ \_______ \ \e[0m"
echo -e "     \e[33m   \/       \e[0m\e[31m\/        \/       \e[0m\e[33m  \/       \/ \e[0m"
echo ""
echo ""


function login(){

	trap 'echo "No puedes ejecutar ese comando para salir"' SIGINT
	trap 'echo "No puedes ejecutar ese comando para salir"' SIGTSTP 
	comando='nosalir'
	creditos=(./creditos.sh)
	fecha=(./fecha.sh)
	ayuda=(./ayuda.sh)
	gato=(./game_gato.sh)
	infosis=(./infosis.sh)

	while [ "$comando" != 'salir' ]
	do
		echo -e -n "\e[36m$username#\e[0m\e[34m$PWD->> \e[0m" 
			
		read comando
		
		case $comando in
			
			creditos)
				$creditos
			;;
			
			fecha)
				$fecha
			;;
			
			gato)
				$gato
			;;
			
			ayuda)
				$ayuda
			;;
			
			infosis)
				$infosis
			;;
		esac
		
	done


}




error=2
while [ $error != 0 ] 
do
	echo ""
	echo -e -n "\e[33mIngrese su nombre de usuario: \e[0m"
	read username
	echo ""
	
	echo -e -n "\e[33mIngrese su contraseña: \e[0m"
	read -s password
	echo ""

	if id "$username" >/dev/null 2>&1; 
	then
		echo "Usuario correcto"
		#contrasena=$(sudo grep $username /etc/shadow | cut -d':' -f2)
		#if [[ $(echo "$password" | openssl passwd -1 -stdin) = "$contrasena" ]];
		#then
			echo "Puedes ingresar, bienvenido $username"
    			login
    			exit 0
    		#else
    		#	echo "Contraseña incorrecta"
    		#	error=$((error - 1))
    		#fi
	else
		echo ""
		echo "Usuario incorrecto"
		echo "Intenta de nuevo"
		error=$((error - 1))

	fi
	echo ""

done

if [ $error -eq 0 ];
then
	echo ""
	echo "No puedes ingresar"
	exit 1
fi


function login(){

trap 'echo "No puedes ejecutar ese comando para salir"' SIGINT
trap 'echo "No puedes ejecutar ese comando para salir"' SIGTSTP 
comando='nosalir'
creditos=(./creditos.sh)
fecha=(./fecha.sh)
ayuda=(./ayuda.sh)
gato=(./game_gato.sh)
infosis=(./infosis.sh)

while [ "$comando" != 'salir' ]
do
	echo -e -n "$username#$PWD->>  " 
		
	read comando
	
	case $comando in
		
		creditos)
			$creditos
		;;
		
		fecha)
			$fecha
		;;
		
		gato)
			$gato
		;;
		
		ayuda)
			$ayuda
		;;
		
		infosis)
			$infosis
		;;
	esac
	
done


}

