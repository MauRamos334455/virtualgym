-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 05/02/2021
-- @DescripciÓn: Carga inicial de datos para
-- la BD

connect admin_gym/kera
whenever sqlerror exit rollback
--TABLA: ADMINISTRATIVO

whenever sqlerror continue none
commit;