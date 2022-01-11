--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 30/09/2021
--@Descripción: post-creación, crea tablas y vistas
-- diccionario de datos

whenever sqlerror exit rollback;
connect sys/system2 as sysdba
@?/rdbms/admin/catalog.sql;
@?/rdbms/admin/catproc.sql;
@?/rdbms/admin/utlrp.sql;
connect system/system2
@?/sqlplus/admin/pupbld.sql;