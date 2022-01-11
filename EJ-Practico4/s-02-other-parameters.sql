--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 5/10/2021
--@Descripción: respaldando datos en tabla

-- conectando como sys
connect sys/system2 as sysdba

create table erick0204.t02_other_parameters as (
  select num, name, value, default_value, isses_modifiable as
  is_session_modifiable, issys_modifiable as is_system_modifiable
  from  v$system_parameter
);