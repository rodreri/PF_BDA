# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 11/01/2022
# @Descripción: permite crear los directorios para 
# Data files, Redo Logs y Control Files

# cambiando al directorio donde se almacenan los datos
cd /u01/app/oracle/oradata
mkdir MIPIPROY

# cambiando dueño y permisos
chown oracle:oinstall MIPIPROY
chmod 750 MIPIPROY

# creando directorios auxiliares
cd /u022
mkdir -p app/oracle/oradata/MIPIPROY
cd /u023
mkdir -p app/oracle/oradata/MIPIPROY

# cambiando dueño y permisos
cd /u022
chown -R oracle:oinstall *
chmod -R 750 *
cd /u023
chown -R oracle:oinstall *
chmod -R 750 *