--@Autor: Erick Rodrigo Minero Pineda
--@Fecha creación: 2/10/2021
--@Descripción: permite crear pfile desde spfile
-- crea tabla con parametros

-- conectando como sys
connect sys/system2 as sysdba

-- creando el pfile
create pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt' from spfile;

-- creando el usuario
create user erick0204 identified by erick quota unlimited on users;
grant create session, create table, create sequence, create procedure to erick0204;

-- creando tabla
create table erick0204.t01_spparameters(
 name varchar2(80),
 value varchar2(255)
);

insert into erick0204.t01_spparameters(name, value)
  select name,value from v$spparameter where value is not null
;

-- Sección de preguntas y respuestas:
-- 1. Observar que los parámetros mostrados en el archivo e-02-spparameter-pfile.txt tienen 2
-- formatos: algunos inician con <oracle_sid>.__ y otro grupo inicia con *.
-- ¿Qué diferencia existe entre estos 2 grupos?
-- Respuesta: 
-- ==========Los parametros que incian con * son los parametros que yo cree para poder
-- iniciar la base mientras que los otros los creo la propia base.

-- 2. Comparar los 2 archivos e-01-spparameter-alert-log.txt y e-02-spparameter-pfile.txt así como
-- el contenido de la tabla t01_spparameters. Confirmar que en los 3 casos, existen los mismos
-- parámetros con los mismos valores. De encontrar diferencias mencionarlas.
-- Respuesta:
-- ==========Si son los mismos parametros, solo en el caso del e-02-spparameter-pfile.tx
--  se muestran otros parametros que no fueron creados por el dba.