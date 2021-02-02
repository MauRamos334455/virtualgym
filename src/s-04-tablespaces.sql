-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 02/02/2021 
-- @Descripción: Creación de la base de datos
-- para Virtual Gym

connect sys/systemgym as sysdba

create tablespace blobtbs1 
	datafile '/u14/app/oracle/oradata/KERAPROY/blob01.dbf' size 550m
	autoextend on next 5120k maxsize unlimited;

create tablespace info_gym 
	datafile '/u14/app/oracle/oradata/KERAPROY/info_gym01.dbf' size 500m
	extent management local autollocate
	segment space management auto;

create tablespace info_gym_idx
	datafile '/u14/app/oracle/oradata/KERAPROY/info_gym_idx01.dbf' size 250m
	extent management local autollocate
	segment space management auto;

create tablespace users
	datafile '/u14/app/oracle/oradata/KERAPROY/users01.dbf' size 500m
	extent management local autollocate; 

create tablespace users_idx
	datafile '/u14/app/oracle/oradata/KERAPROY/users_idx01.dbf' size 250m
	extent management local autollocate; 

whenever sqlerror continue none;