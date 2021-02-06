-- @Autor: Kennedy Villa Carolina
--         Ramos Villaseñor Cesar Mauricio
-- @Fecha: 04/02/2021
-- @Descripción: Comandos para poder emplear la estrategia
-- de respaldos definida (leer README)

--FULL BACKUP (CADA MES)
  configure channel device type disk
  format '/unam-bda/backups/backup_%U.bkp' maxpiecesize 5G;

  configure controlfile autobackup
  format for device type disk to '/unam-bda/backups/ctl_file%F.bkp';

  backup database plus archivelog tag autos_full_inicial;
--BACKUP INCREMENTAL NIVEL 0 CON ARCHIVE LOGS (CADA DOMINGO)
  backup as backupset incremental level 0 database plus archivelog tag
  autos_backup_nivel_0_1;

--BACKUP INCREMENTAL NIVEL 1 DIFERENCIAL (DE LUNES A SABADO)
  backup as backupset incremental level 1 database plus archivelog
  tag autos_backup_nivel_1_1;

--CONFIGURACIÓN DE LA POLÍTICA DE RETENCIÓN (14 DÍAS)
  configure retention policy to recovery window of 14 days;

 