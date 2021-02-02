#@Autor:            Carolina Kennedy Villa
#@Fecha creación:   17/10/2020
#@Descripción: 		Creando el archivo de passwords y de parámetros

if ! [ "$USER" = "oracle" ]; then
	echo "---------- ERROR: No es usuario oracle"
	exit 1;
fi;

echo "---------- Estableciendo ORACLE_SID"
export ORACLE_SID=ckvbda2

archivoPwd="${ORACLE_HOME}"/dbs/orapwckvbda2

echo "---------- Creando el archivo de passwords"
orapwd FILE="${archivoPwd}" FORMAT=12.2 \
	FORCE=Y \
	SYS=password \

echo "---------- Creando el archivo de parámetros"

echo -e "db_name=ckvbda2\n
control_files=(/u01/app/oracle/oradata/CKVBDA2/control01.ctl,
/u02/app/oracle/oradata/CKVBDA2/control02.ctl,
/u03/app/oracle/oradata/CKVBDA2/control03.ctl)\n
memory_target=768MB" >> $ORACLE_HOME/dbs/initckvbda2.ora

echo "---------- Listo! ----------"