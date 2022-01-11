# !bin/bash
# @Autor: Erick Rodrigo Minero Pineda
# @Fecha creación: 11/01/2022
# @Descripción: creación del archivo de passwords y parámetros.

export ORACLE_SID=mipiproy

# Creando el archivo de passwords
orapwd FILE='$ORACLE_HOME/dbs/orapwmipiproy' format=12.2 SYS=Hola1234* force=y

# Creando el archivo de parametros
touch $ORACLE_HOME/dbs/initmipiproy.ora

echo "db_name='mipiproy'" >> $ORACLE_HOME/dbs/initmipiproy.ora
echo "memory_target=768MB" >> $ORACLE_HOME/dbs/initmipiproy.ora
echo "control_files=(/u021/app/oracle/oradata/ERMPBDA2/control01.ctl,/u022/app/oracle/oradata/ERMPBDA2/control02.ctl,/u023/app/oracle/oradata/ERMPBDA2/control03.ctl))" >> $ORACLE_HOME/dbs/initmipiproy.ora