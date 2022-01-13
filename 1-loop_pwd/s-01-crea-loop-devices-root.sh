# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 11/01/2022
# @Descripción: se crearán 3 dispositivos de este tipo disk22.img y disk23.img que
# será montados en /u021 /u022 y /u023 respectivamente. Posteriormente serán creados otros más.
# Este ejercicio permitirá contar con 3 estructuras de directorios para distribuir
# los archivos de la base de datos: /u021, /u022 y /u023.

# Creando la carpeta
mkdir /unam-bda-pf

# Localizandonos en la carpeta
cd /unam-bda-pf

# Creando archivos binarios
echo "Creando archivos binarios"
dd if=/dev/zero of=disk22.img bs=100M count=10
dd if=/dev/zero of=disk23.img bs=100M count=10

# Comprobar la creación de los archivos
du -sh disk*.img 

echo "Asociando a cada archivo"
# Crear cada loop device asociándolo a su archivo creado
losetup -fP disk22.img
losetup -fP disk23.img

# confirmar la creación del loop device
losetup -a

echo "Dando formato a los loops"
# Dar formato a los archivos creados para que puedan ser montados
mkfs.ext4 disk22.img
mkfs.ext4 disk23.img

# Crear el directorio u02 y u03 donde los dispositivos serán montados
echo "Creando directorios de montaje"
mkdir /u022
mkdir /u023