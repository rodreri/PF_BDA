# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 4/10/2021
# @Descripción: permite crear los directorios 

# Creando los directorios ejercicios-practicos/t0204
mkdir -p /unam-bda/ejercicios-practicos/t0204

# Asignando dueños
chown erick:oinstall /unam-bda/ejercicios-practicos -R

# Asignando los permisos necesarios
chmod 771 /unam-bda/ejercicios-practicos -R