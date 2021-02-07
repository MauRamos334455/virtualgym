-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 04/02/2021
-- @DescripciÓn: Configuraciones para el modo
-- compartidoy dedicado para la conexión con la base.

connect sys/systemgym as sysdba
whenever sqlerror exit rollback

prompt Ajustando parametros para activar modo compartido...
alter system set dispatchers='(dispatchers=6) (protocol=tcp)' scope=both;
alter system set shared_servers=60 scope=both;

prompt Actualizando listener...
alter system register;

prompt Imprimiendo resultados en BD...
select program, pid, pname from v$process
where pname like 'S0%' or pname like 'D0%'
order by program;
 
prompt Imprimiendo resultados en LISTENER...
!lsnrctl services

prompt ****¡TERMINADO!****
whenever sqlerror continue none
