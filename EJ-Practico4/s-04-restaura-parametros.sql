--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 6/10/2021
--@Descripción: restaurando parametros

connect sys/system2 as sysdba
shutdown immediate

create spfile='/u01/app/oracle/product/19.3.0/dbhome_1/dbs/spfileermpbda2.ora'
from pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt';

startup