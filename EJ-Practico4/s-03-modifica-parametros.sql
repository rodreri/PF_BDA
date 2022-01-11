--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 5/10/2021
--@Descripción: modificando parametros raros

-- conectando como sys
connect sys/system2 as sysdba

alter session set nls_date_format='dd/mm/yyyy hh24:mi:ss';
alter system set db_writer_processes=2 scope=spfile;
alter system set log_buffer=10485760 scope=spfile;
alter system set db_files=250 scope=spfile;
alter system set dml_locks=2500 scope=spfile;
alter system set transactions=600 scope=spfile;
alter system set hash_area_size=2097152 scope=spfile;
alter session set sort_area_size=1048576;
alter system set sql_trace=TRUE scope=memory;
alter system set optimizer_mode='FIRST_ROWS_100' scope=both;
alter session set cursor_invalidation='DEFERRED';

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE erick0204.t03_update_param_session';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE erick0204.t04_update_param_instance';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE erick0204.t05_update_param_spfile';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
  
create table erick0204.t03_update_param_session as
 select name,value
 from v$parameter
 where name in (
 'cursor_invalidation','optimizer_mode',
 'sql_trace','sort_area_size','hash_area_size','nls_date_format',
 'db_writer_processes','db_files','dml_locks','log_buffer','transactions'
 )
 and value is not null;

create table erick0204.t04_update_param_instance as
 select name,value
 from v$system_parameter
 where name in (
 'cursor_invalidation','optimizer_mode',
 'sql_trace','sort_area_size','hash_area_size','nls_date_format',
 'db_writer_processes','db_files','dml_locks','log_buffer','transactions'
 )
 and value is not null;

create table erick0204.t05_update_param_spfile as
 select name,value
 from v$spparameter
 where name in (
 'cursor_invalidation','optimizer_mode',
 'sql_trace','sort_area_size','hash_area_size','nls_date_format',
 'db_writer_processes','db_files','dml_locks','log_buffer','transactions'
 )
 and value is not null;

 -- creando el pfile
create pfile='/unam-bda/ejercicios-practicos/t0204/ e-03-spparameter-pfile.txt' from spfile;