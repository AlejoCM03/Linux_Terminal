#!/bin/bash

# Define las variables para el tablero
tablero=(' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ')
jugador_actual='X'
ganador=false
estatico=(1 2 3 4 5 6 7 8 9)

# Función que dibuja el tablero
function dibujar_tablero {
  echo ""
  echo ""
  echo " ${tablero[0]} | ${tablero[1]} | ${tablero[2]} _______ | ${estatico[0]} | ${estatico[1]} | ${estatico[2]} |"
  echo "---+---+---        +---+---+---+"
  echo " ${tablero[3]} | ${tablero[4]} | ${tablero[5]} _______ | ${estatico[3]} | ${estatico[4]} | ${estatico[5]} |"
  echo "---+---+---        +---+---+---+"
  echo " ${tablero[6]} | ${tablero[7]} | ${tablero[8]} _______ | ${estatico[6]} | ${estatico[7]} | ${estatico[8]} |"
}

# Función que verifica si hay un ganador
function verificar_ganador {
  if [[ ${tablero[0]} != ' ' && ${tablero[0]} == ${tablero[1]} && ${tablero[1]} == ${tablero[2]} ]]; then
    ganador=true
  elif [[ ${tablero[3]} != ' ' && ${tablero[3]} == ${tablero[4]} && ${tablero[4]} == ${tablero[5]} ]]; then
    ganador=true
  elif [[ ${tablero[6]} != ' ' && ${tablero[6]} == ${tablero[7]} && ${tablero[7]} == ${tablero[8]} ]]; then
    ganador=true
  elif [[ ${tablero[0]} != ' ' && ${tablero[0]} == ${tablero[3]} && ${tablero[3]} == ${tablero[6]} ]]; then
    ganador=true
  elif [[ ${tablero[1]} != ' ' && ${tablero[1]} == ${tablero[4]} && ${tablero[4]} == ${tablero[7]} ]]; then
    ganador=true
  elif [[ ${tablero[2]} != ' ' && ${tablero[2]} == ${tablero[5]} && ${tablero[5]} == ${tablero[8]} ]]; then
    ganador=true
  elif [[ ${tablero[0]} != ' ' && ${tablero[0]} == ${tablero[4]} && ${tablero[4]} == ${tablero[8]} ]]; then
    ganador=true
  elif [[ ${tablero[2]} != ' ' && ${tablero[2]} == ${tablero[4]} && ${tablero[4]} == ${tablero[6]} ]]; then
    ganador=true
  fi
}

# Función que solicita la jugada del jugador
function jugar {
  echo "Es el turno del jugador $jugador_actual"
  read -p "Ingrese una posición (1-9): " posicion
  while [[ ${tablero[posicion-1]} != ' ' ]]; do
    read -p "La posición $posicion ya está ocupada. Ingrese otra posición (1-9): " posicion
  done
  tablero[posicion-1]=$jugador_actual
}

# Ciclo del juego
while [[ $ganador == false ]]; do
  dibujar_tablero
  jugar
  verificar_ganador
  if [[ $ganador == true ]]; then
    dibujar_tablero
    echo "¡El jugador $jugador_actual ha ganado!"
    break
  fi
  if [[ ! " ${tablero[@]} " =~ " " ]]; then
    dibujar_tablero
    echo "¡Es un empate!"
    break
  fi

  # Cambia al siguiente jugador
  if [[ $jugador_actual == 'X' ]]; then
    jugador_actual='O'
  else
    jugador_actual='X'
  fi
done

