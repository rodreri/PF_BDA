--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 11/01/2022
--@Descripción: permite crear spfile (binario)

whenever sqlerror exit rollback;
connect sys/hola1234* as sysdba
startup nomount

create spfile='/u01/app/oracle/product/19.3.0/dbhome_1/dbs/spfilemipiproy.ora'
from pfile='/u01/app/oracle/product/19.3.0/dbhome_1/dbs/initmipiproy.ora';