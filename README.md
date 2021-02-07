# VirtualGym

## Antes de la creación de la BD
- Las contraseñas de SYS y SYSBACKUP deben de ser hola1234%
- Antes de ejecutar el s-03, deberás de exportar ORACLE_SID=keraproy
y entrar a sqlplus como sys e iniciar en nomount
- Antes de crear la base, hay que crear el spfile del pfile
- Para eliminar todos los objetos de los usuarios, basta con eliminar
- a los usuarios admin_gym y user_gym
- Se debe editar el archivo fstab y añadir el montaje de los discos /u11, /u12
- y /u13, /u14 no se simulo como un loop device.

## Conexiones para modo dedicado y compartido
- Para el modo compartido se estima un shared server por cada 10 conexiones
- Se estiman 1 125 000 conexiones (el 75% de 1500 usuarios por 1000 gimnasios)
- Para fines del proyecto se decidieron crear 60
- Ademas de ejecutar el script correspondiente, es necesario editar el archivo
- TNSNAMES.ORA con los siguiente, donde XXX depende del host

     ### Conexiones para KERAPROY
      KERAPROY_DEDICATED =
        (DESCRIPTION =
          (ADDRESS_LIST =
            (ADDRESS = (PROTOCOL = TCP) (HOST = pc-crv.fi.unam) (PORT = 1521))
          )
          (CONNECT_DATA =
            (SERVICE_NAME = keraproy.fi.unam)
            (SERVER=DEDICATED)
          )
        )
      
       KERAPROY_SHARED =
         (DESCRIPTION =
           (ADDRESS_LIST =
             (ADDRESS = (PROTOCOL = TCP) (HOST = pc-crv.fi.unam) (PORT = 1521))
           )
           (CONNECT_DATA =
             (SERVICE_NAME = keraproy.fi.unam)
             (SERVER=SHARED)
           )
         )


## Modo archive log
- Es necesario crear los siguientes directorios y permisos antes de ejecutar el script, como usuario root
     ###
      mkdir -p /unam-bda/archivelogs/KERAPROY/disk_a
      mkdir -p /unam-bda/archivelogs/KERAPROY/disk_b (CAMBIO POSTERIOR A LA FRA)
      chown -R oracle:oinstall /unam-bda/archivelogs
      chmod -R 750 /unam-bda/archivelogs

## Habilitar FRA
- Nos conectamos a la BD target
     ###
      connect target "sys@keraproy as sysdba"

- Configuramos la ruta del backup
     ###
      configure channel device type disk format '/unam-bda/backups/backup_%U.bkp' maxpiecesize 5G;
      configure controlfile autobackup format for device type disk to '/unam-bda/backups/ctl_file%F.bkp';

- Hacer Full Backup
     ###
      backup database plus archivelog tag autos_full_inicial;

- Eliminar archivos obsoletos
     ###
      report obsolete;
      delete obsolete;

- Simular carga diaria (sólo se estima)

- Realizar backup nivel 0
     ###
      backup as backupset incremental level 0 database plus archivelog tag autos_backup_nivel_0_1; 

- Realizar backup incremental diferencial
     ###
      backup as backupset incremental level 1 cumulative database plus archivelog tag autos_backup_nivel_1_1;

- Con base al valor de los tamaños de los backups, se calcula por medio de la fórmula el valor final. 
     ### Valores de variables para FRA
      605.43M Backup 0
      15M Incremental diferencial 1 (Estimación sobre 5M reales)
      587.5K Redo en días productivos
      4112.5K Redo semanales
      17.83M Control File
      1M Flashbacklogs
      31.5K Redo member semanal

- Tenemos un total de 1354M (incluyendo 10% extra) estimados para la FRA. 
Con base a este valor más el almacenado de más archivos y que es más recomendable 
no escatimar, decidimos establecer un valor de 2000M.

## Esquema de respaldos
- Se realizarán backups incrementales nivel 0 y nivel 1 diferencial.
- Se realizará cada domingo a las 3:00 AM un backup incremental nivel 0. Seguidamente
cada día a la estimación del horario de comida nacional, se realizará un backup
incremental nivel 1 diferencial.
- Las ubicaciones de respaldo están en la FRA: /unam-bda/fast-reco-area
- La política de retención decidida es de tipo Window based, con un margen de
14 días, por posibles percances. Comenzando los lunes. De esta forma se conservará
un backup nivel 0 y a la mitad del margen de ventana se generará otro, 
para hacer recovery se consideraran estos dos backups así como todos los archive 
generados entre el primer nivel 0 hasta el momento de recovery. De esta forma ,
en un momento de recovery es mas probable contar con dos backups cero por si
uno falla. Finalmente, se plantea hacer un full backup cada mes.
- 5G Disponibles o 3G

## Complete Media Recovery
- Se decidió eliminar los datafile: 
     ###
      /u14/app/oracle/oradata/KERAPROY/users01.dbf  (MODO MANUAL)
      /u14/app/oracle/oradata/KERAPROY/info_gym01.dbf  (MODO DRA)

### Manual
- Ejecutar script s-12-complete-media-recovery.rman a través de RMAN

### Automático
- Ejecutar en RMAN:
     ###
        list failure
        advise failure

- Leer script en:
/u01/app/oracle/diag/rdbms/keraproy/keraproy/hm/reco_495320205.hm
- Contenido generado del script (Ejemplo):
     ### restore and recover datafile
         sql 'alter database datafile 5 offline';
         restore ( datafile 5 );
         recover datafile 5;
         sql 'alter database datafile 5 online';




