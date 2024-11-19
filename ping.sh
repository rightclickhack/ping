#!/bin/bash

# Dirección IP o dominio a hacer ping
DESTINO=$1

# Verifica si se pasó el destino como argumento
if [ -z "$DESTINO" ]; then
    echo "Uso: $0 <dirección IP o dominio>"
    exit 1
fi

# Inicializa un contador
contador=1

# Bucle infinito para hacer ping constante
while true; do
    # Hacer ping y comprobar si es exitoso
    ping -c 1 -W 1 "$DESTINO" > /dev/null

    # Verificar si el comando ping fue exitoso
    if [ $? -eq 0 ]; then
        # Si el ping es exitoso, mostrar en verde con el contador
        echo -e "\033[0;32mRespuesta positiva de $DESTINO [Intento #$contador]\033[0m"
    else
        # Si el ping falla, mostrar en rojo con el contador
        echo -e "\033[0;31mNo se pudo conectar a $DESTINO [Intento #$contador]\033[0m"
    fi

    # Incrementar el contador
    ((contador++))

    # Esperar 1 segundo antes de hacer el siguiente ping
    sleep 1
done
