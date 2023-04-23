#!/bin/bash

function opciones(){
    echo "OPCIONES"
    echo "Presione la tecla:"
    echo "1. Detener la reproducción - Tecla q "
    echo "2. Pausar y reanudar la reproducción -Tecla s"
    echo "3. Bajar volumen - Tecla -"
    echo "4. Subir volumne - Tecla +"
    echo "5. Repetir cancion - Tecla b"

}


echo "Bienvenido al reproductor MP3"


if ! command -v mpg123 &>/dev/null || ! command -v cava &>/dev/null; then
  echo "mpg123 y projectm no se encuentran instalados"
  while true; do
    read -p "¿Desea instalarlo? (s/n): " instalar
    case $instalar in
      [Ss]* )
        
        sudo apt update
        sudo apt install mpg123 cava 
        break
        ;;
      [Nn]* )
        echo "El reproductor MP3 no puede funcionar sin mpg123 y projectm."
        exit
        ;;
      * )
        echo "Ingrese 's' para sí o 'n' para no."
        ;;
    esac
  done
fi

opc=""

while true; do
echo "¿Cómo desea escuchar su música?" 
echo "Seleccione una opción:"
echo "1. Reproducir una canción"
echo "2. Reproducir un repertorio de canciones"
echo "3. Reproducir canciones de manera aleatoria"
echo "4. Salir"
read opc

case $opc in

"1")
    echo "Seleccione la ruta de su canción"
    while true; do
      read -p "Ingrese la ruta del archivo MP3 o 'q' para salir: " archivo
      if [ "$archivo" == "q" ]; then
        echo "Saliendo..."
        break
      fi
      archivo=$(echo "$archivo" | sed "s/'//g")
      if [ -f "$archivo" ]; then
        opciones
        gnome-terminal --tab --title="cava" -- bash -c "cava; exec bash"
        mpg123 "$archivo"
      else
        echo "Por favor, ingrese una ruta válida."
      fi
    done
    ;;

"2")
    echo "Seleccione la ruta de su repertorio"
    while true; do
      read -p "Ingrese la ruta del repertorio o 'q' para salir: " archivo
      if [ "$archivo" == "q" ]; then
        echo "Saliendo..."
        break
      fi
      archivo=$(echo "$archivo" | sed "s/'//g")
      if [ -d "$archivo" ]; then
          opciones
          echo "6. Reproducir siguiente canción - Tecla f"
          echo "7. Reproducir canción anterior - Tecla d"
          mpg123 "$archivo"/*.mp3
        
      else
        echo "Ruta incorrecta, ingrese una ruta válida."
      fi
    done
    ;;

"3")
    echo "Seleccione la ruta de su repertorio"
    while true; do
      read -p "Ingrese la ruta del repertorio o 'q' para salir: " archivo
      if [ "$archivo" == "q" ]; then
        echo "Saliendo..."
        break
      fi
      archivo=$(echo "$archivo" | sed "s/'//g")
      if [ -d "$archivo" ]; then
        mpg123 -z "$archivo"/*.mp3
        opciones
        echo "3. Reproducir siguiente canción - Tecla f"
        echo "4. Reproducir canción anterior - Tecla d"
      else
        echo "Ruta incorrecta, ingrese una ruta válida."
      fi
    done
    ;;
    
  "4") exit ;;
esac
done

