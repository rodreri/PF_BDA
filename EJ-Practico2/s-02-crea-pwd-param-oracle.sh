# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 23/09/2021
# @Descripción: creación del archivo de passwords y parámetros.

export ORACLE_SID=ermpbda2

# Creando el archivo de passwords
orapwd FILE='$ORACLE_HOME/dbs/orapwermpbda2' format=12.2 SYS=Hola1234* force=y

# Creando el archivo de parametros
touch $ORACLE_HOME/dbs/initermpbda2.ora

echo "db_name='ermpbda2'" >> $ORACLE_HOME/dbs/initermpbda2.ora
echo "memory_target=768MB" >> $ORACLE_HOME/dbs/initermpbda2.ora
echo "control_files=(/u01/app/oracle/oradata/ERMPBDA2/control01.ctl,/u02/app/oracle/oradata/ERMPBDA2/control02.ctl,/u03/app/oracle/oradata/ERMPBDA2/control03.ctl))" >> $ORACLE_HOME/dbs/initermpbda2.ora