-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 02/02/2021 
-- @DescripciÓn: Creación de los usuarios
-- para la manipulación de los módulos de la base
-- de datos

connect sys/systemgym as sysdba
whenever sqlerror exit rollback

prompt Creando usuarios...
create user admin_gym identified by kera
  default tablespace info_gym
  temporary tablespace temptbs1
  quota unlimited on info_gym
  quota unlimited on info_gym_idx
  quota unlimited on blobtbs1;

create user user_gym identified by kera
  default tablespace users
  temporary tablespace temptbs1
  quota unlimited on users
  quota unlimited on users_idx
  quota unlimited on blobtbs1;


prompt Otorgando privilegios...
grant create table, create session, create any index, create procedure, references
 to admin_gym;
grant create table, create session, create any index, create procedure, references
 to user_gym;

prompt ****¡TERMINADO!****
whenever sqlerror continue none
