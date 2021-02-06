# @Autor: Kennedy Villa Carolina
#         Ramos Villaseñor Cesar Mauricio
# @Fecha: 02/02/2021 
# @DescripciÓn: Creación del archivo de passwords
# y el pfile de inicio para la base de datos

if ! [ "$USER" = "oracle" ]; then
  echo "---------- ERROR: El script debe ejecutarse como usuario oracle"
  exit 1;
fi;

echo "---------- Estableciendo ORACLE_SID"
export ORACLE_SID=keraproy

archivo_pwd_path="${ORACLE_HOME}"/dbs/orapwkeraproy

echo "---------- Creando el archivo de passwords"
orapwd FILE="${archivo_pwd_path}" FORMAT=12.2 \
  FORCE=Y \
  SYS=password \
  SYSBACKUP=password \

echo "---------- Creando el archivo de parámetros"

echo -e "db_name=keraproy\n
control_files=(/u11/app/oracle/oradata/KERAPROY/control01.ctl,
/u12/app/oracle/oradata/KERAPROY/control02.ctl,
/unam-bda/fast-reco-area/control03.ctl)\n
db_domain='fi.unam'\n
memory_target=768M" >> $ORACLE_HOME/dbs/initkeraproy.ora

echo "---------- Listo! ----------"
