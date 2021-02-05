-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 04/02/2021
-- @DescripciÓn: Configuraciones para el modo
-- archive log en la base de datos

connect sys/systemgym as sysdba

prompt Generando pfile de backup
create pfile='pfilebackupkeraproy.ora' from spfile;

prompt Estableciendo archive process
alter system set log_archive_max_processes=10 scope=spfile;
alter system 
  set log_archive_dest_1='LOCATION=/unam-bda/archivelogs/KERAPROY/disk_a MANDATORY' 
  scope=spfile;
alter system 
  set log_archive_dest_2='LOCATION=/unam-bda/archivelogs/KERAPROY/disk_b'
  scope=spfile;
alter system set log_archive_format='arch_keraproy_%t_%s_%r.arc' scope=spfile;
alter system set log_archive_min_succeed_dest=1 scope=spfile;

prompt Reiniciar instancia, arrancarla en modo mount y ejecutar:
prompt alter database archivelog, alter database open
--shutdown
--startup mount
--alter database archivelog;
--alter database open;