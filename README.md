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

KERAPROY_DEDICATED =
 (DESCRIPTION =
  (ADDRESS_LIST =
   (ADDRESS = (PROTOCOL = TCP) (HOST = pc-XXX.fi.unam) (PORT = 1521))
  )
  (CONNECT_DATA =
   (SERVICE_NAME = keraproy.fi.unam)
   (SERVER=DEDICATED)
  )
 )

KERAPROY_SHARED =
 (DESCRIPTION =
  (ADDRESS_LIST =
   (ADDRESS = (PROTOCOL = TCP) (HOST = pc-XXX.fi.unam) (PORT = 1521))
  )
  (CONNECT_DATA =
   (SERVICE_NAME = keraproy.fi.unam)
   (SERVER=SHARED)
  )
 )

## Modo archive log
- Es necesario crear los siguientes directorios y permisos antes de ejecutar el 
- script, como usuario root

mkdir -p /unam-bda/archivelogs/KERAPROY/disk_a
mkdir -p /unam-bda/archivelogs/KERAPROY/disk_b
chown -R oracle:oinstall /unam-bda/archivelogs
chmod -R 750 /unam-bda/archivelogs

## Esquema de respaldos

## Complete Media Recovery