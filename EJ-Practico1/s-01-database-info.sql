--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 19/09/2021
--@Descripción: 
--La idea general es tener un script que se encargue de crear un usuario
--desde cero, es decir que si ya existe, lo borra y lo crea de nuevo.

--esta instrucción permite detener la ejecución del script al primer error
--útil para detectar errores de forma rápida.
--al final del script se debe invocar a whenever sqlerror continue none
--para regresar a la configuración original.
whenever sqlerror exit rollback;
-- para propósitos de pruebas y propósitos académicos se incluye el password
-- no hacer esto en sistemas reales.
Prompt conectando como usuario sys
connect sys/system1 as sysdba
declare
 v_count number;
 v_username varchar2(20) := 'ERICK0201';
begin
 select count(*) into v_count from all_users where username=v_username;
 if v_count >0 then
 execute immediate 'drop user '||v_username||  ' cascade';
 end if;
end;
/
Prompt creando al usuario ERICK0201
create user erick0201 identified by erick quota unlimited on users;
grant create session, create table to erick0201;

create table erick0201.database_info(
 instance_name varchar2(16),
 db_domain varchar2(20),
 db_charset varchar2(15),
 sys_timestamp varchar2(40),
 timezone_offset varchar2(10),
 db_block_size_bytes number(5,0),
 os_block_size_bytes number(5,0),
 redo_block_size_bytes number(5,0),
 total_components number(5,0),
 total_components_mb number(10,2),
 max_component_name varchar2(30),
 max_component_desc varchar2(64),
 max_component_mb number(10,0)
);


insert into erick0201.database_info(instance_name, db_domain,
db_charset, sys_timestamp, timezone_offset, db_block_size_bytes,
os_block_size_bytes, redo_block_size_bytes, total_components, 
total_components_mb, max_component_name, max_component_desc, max_component_mb) values (
  -- instance_name
  (select instance_name from v$instance),
  -- db_domain
  (select value from v$parameter where name='db_domain'),
  -- db_charset
  (select value from nls_database_parameters where parameter = 'NLS_CHARACTERSET'),
  -- sys_timestamp
  (SELECT SYSTIMESTAMP FROM DUAL),
  -- timezone_offset
  ( select tz_offset((select sessiontimezone from dual)) from dual),
  -- db_block_size_bytes
  (select value from v$parameter where name = 'db_block_size'),
  -- os_block_size_bytes
  '512',
  -- redo_block_size_bytes
  (select value from v$parameter where name = 'db_block_size'),
  -- total_components
  (select count(occupant_name) from v$sysaux_occupants),
  -- total_components_mb
  (select round(sum(space_usage_kbytes)*0.001, 2) from v$sysaux_occupants),
  -- max_component_name
  (select occupant_name from v$sysaux_occupants 
  where space_usage_kbytes = (select max(space_usage_kbytes) from v$sysaux_occupants)),
  -- max_component_desc
  (select occupant_desc from v$sysaux_occupants 
  where space_usage_kbytes = (select max(space_usage_kbytes) from v$sysaux_occupants)),
  -- max_component_mb
 (select max(space_usage_kbytes)*0.001 from v$sysaux_occupants)
);

Prompt mostrando datos parte 1
set linesize window
select instance_name,db_domain,db_charset,sys_timestamp,timezone_offset
from erick0201.database_info;
Prompt mostrando datos parte 2
select db_block_size_bytes,os_block_size_bytes,redo_block_size_bytes,
 total_components,total_components_mb
from erick0201.database_info;
Prompt mostrando datos parte 3;
select max_component_name,max_component_desc,max_component_mb
from erick0201.database_info;