# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 23/09/2021
# @Descripción: se crearán 2 dispositivos de este tipo disk2.img y disk3.img que
# será montados en /u02 y /u03 respectivamente. Posteriormente serán creados otros más.
# Este ejercicio permitirá contar con 3 estructuras de directorios para distribuir
# los archivos de la base de datos: /u01 (ya existente), /u02 y /u03.

# Creando la carpeta
mkdir /unam-bda

# Localizandonos en la carpeta
cd /unam-bda

# Creando archivos binarios
dd if=/dev/zero of=disk2.img bs=100M count=10
dd if=/dev/zero of=disk3.img bs=100M count=10

# Comprobar la creación de los archivos
du -sh disk*.img 

# Crear cada loop device asociándolo a su archivo creado
losetup -fP disk2.img
losetup -fP disk3.img

# confirmar la creación del loop device
losetup -a

# Dar formato a los archivos creados para que puedan ser montados
mkfs.ext4 disk2.img
mkfs.ext4 disk3.img

# Crear el directorio u02 y u03 donde los dispositivos serán montados
mkdir /u02
mkdir /u03