# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 30/09/2021
# @Descripción: permite crear los directorios para 
# Data files, Redo Logs y Control Files

# cambiando al directorio donde se almacenan los datos
cd /u01/app/oracle/oradata
mkdir ERMPBDA2

# cambiando dueño y permisos
chown oracle:oinstall ERMPBDA2
chmod 750 ERMPBDA2

# creando directorios auxiliares
cd /u02
mkdir -p app/oracle/oradata/ERMPBDA2
cd /u03
mkdir -p app/oracle/oradata/ERMPBDA2

# cambiando dueño y permisos
cd /u02
chown -R oracle:oinstall *
chmod -R 750 *
cd /u03
chown -R oracle:oinstall *
chmod -R 750 *