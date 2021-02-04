#!/bin/bash
# @Autor  Kennedy Villa Carolina
#         Ramos Villaseñor Cesar Mauricio
# @Fecha 18/10/2020
# @Descripción Programa que crea loop
# devices para la base de datos del proyecto.
# Ejecutarse como root

# Crear archivos img, se considera que la carpeta /unam-bda ya fue creada
cd /unam-bda
dd if=/dev/zero of=disk11.img bs=100M count=10
dd if=/dev/zero of=disk12.img bs=100M count=10
dd if=/dev/zero of=disk13.img bs=100M count=10

# Comprobar creación de los archivos
du -sh disk*.img

# Crear loop devices asociándolos a su archivo
losetup -fP disk11.img
losetup -fP disk12.img
losetup -fP disk13.img


# Confirmamos creación del loop device
losetup -a

# Dar formato de archivos
mkfs.ext4 disk11.img
mkfs.ext4 disk12.img
mkfs.ext4 disk13.img

# Creación de los puntos de montaje
mkdir /u11 /u12 /u13

# Resta aplicar montaje de manera manual o por medio
# de archivo fstab