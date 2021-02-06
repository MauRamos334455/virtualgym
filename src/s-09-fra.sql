-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 05/02/2021
-- @DescripciÓn: Configuraciones para la
-- FRA en la base de datos

connect sys/systemgym as sysdba

create pfile from spfile;
alter system set db_recovery_file_dest_size=1354m scope=both;
alter system set db_recovery_file_dest='/unam-bda/fast-reco-area' scope=both;
alter system set db_flashback_retention_target=1440 scope=both;