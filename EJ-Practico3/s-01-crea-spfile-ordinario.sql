--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 30/09/2021
--@Descripción: permite crear spfile (binario)

whenever sqlerror exit rollback;
connect sys/hola1234* as sysdba
startup nomount

create spfile='/u01/app/oracle/product/19.3.0/dbhome_1/dbs/spfileermpbda2.ora'
from pfile='/u01/app/oracle/product/19.3.0/dbhome_1/dbs/initermpbda2.ora';