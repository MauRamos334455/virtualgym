# @Autor: Kennedy Villa Carolina
#         Ramos Villaseñor Cesar Mauricio
# @Fecha: 02/02/2021 
# @Descripción: Creación de los directorios necesarios
# para la correcta operación de la base de datos

echo "---------- Creando carpetas de discos u11, u12, u13"
mkdir -p /u11/app/oracle/oradata/KERAPROY
mkdir -p /u12/app/oracle/oradata/KERAPROY
mkdir -p /u13/app/oracle/oradata/KERAPROY
mkdir -p /u14/app/oracle/oradata/KERAPROY

echo "---------- Cambiando dueño"
chown oracle:oinstall /u11/* -R
chown oracle:oinstall /u12/* -R
chown oracle:oinstall /u13/* -R
chown oracle:oinstall /u14/* -R

echo "--------- Cambiando permisos"
chmod 754 /u11/* -R
chmod 754 /u12/* -R
chmod 754 /u13/* -R
chmod 754 /u14/* -R

echo "-------- Terminado"
exit 0