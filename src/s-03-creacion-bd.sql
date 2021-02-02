-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 02/02/2021 
-- @DescripciÓn: Creación de la base de datos
-- para Virtual Gym, junto con su diccionario de datos

connect sys/systemgym as sysdba
startup nomount
whenever sqlerror exit rollback
create database keraproy
  user sys identified by systemgym
  user system identified by systemgym
  logfile group 1 (
    '/u11/app/oracle/oradata/KERAPROY/redo01a.log',
    '/u12/app/oracle/oradata/KERAPROY/redo01b.log',
    '/u13/app/oracle/oradata/KERAPROY/redo01c.log') size 150m blocksize 512,
  group 2 (
    '/u11/app/oracle/oradata/KERAPROY/redo02a.log',
    '/u12/app/oracle/oradata/KERAPROY/redo02b.log',
    '/u13/app/oracle/oradata/KERAPROY/redo02c.log') size 150m blocksize 512,
  group 3 (
    '/u11/app/oracle/oradata/KERAPROY/redo03a.log',
    '/u12/app/oracle/oradata/KERAPROY/redo03b.log',
    '/u13/app/oracle/oradata/KERAPROY/redo03c.log') size 150m blocksize 512
  maxloghistory 2
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/u14/app/oracle/oradata/KERAPROY/system01.dbf'
    size 700m reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/u14/app/oracle/oradata/KERAPROY/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize unlimited
  default temporary tablespace temptbs1
    tempfile '/u14/app/oracle/oradata/KERAPROY/temp01.dbf'
    size 20m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/u14/app/oracle/oradata/KERAPROY/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

alter user sys identified by systemgym;
alter user system identified by systemgym;

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

connect system/systemgym
@?/sqlplus/admin/pupbld.sql

whenever sqlerror continue none;