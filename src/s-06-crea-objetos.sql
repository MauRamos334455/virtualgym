--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Hewlett-Packard
-- Project :      modelo_relacional.DM1
-- Author :       Mauricio Ramos
--
-- Date Created : Tuesday, February 02, 2021 13:38:56
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: CLIENTE 
--

CREATE TABLE user_gym.CLIENTE(
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(50)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40),
    EMAIL               VARCHAR2(30)     NOT NULL,
    USERNAME            VARCHAR2(30)     NOT NULL,
    PASSWORD            VARCHAR2(40)     NOT NULL,
    DIRECCION           VARCHAR2(200)    NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    CURP                VARCHAR2(20)     NOT NULL,
    FOTO                BLOB             NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (CLIENTE_ID)
    USING INDEX TABLESPACE users
) TABLESPACE users
;



-- 
-- TABLE: SESION 
--

CREATE TABLE user_gym.SESION(
    SESION_ID         NUMBER(10, 0)    NOT NULL,
    TIPO              VARCHAR2(15)     NOT NULL,
    NUMERO            NUMBER(10, 0)    NOT NULL,
    FECHA_INICIO      DATE             NOT NULL,
    DURACION          VARCHAR2(40)     NOT NULL,
    TOTAL_CALORIAS    NUMBER(14, 4)    NOT NULL,
    CLIENTE_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (SESION_ID)
    USING INDEX TABLESPACE users, 
    CONSTRAINT RefCLIENTE28 FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE users
;



-- 
-- TABLE: CALORIAS 
--

CREATE TABLE user_gym.CALORIAS(
    CALORIA_ID    NUMBER(10, 0)    NOT NULL,
    VALOR         NUMBER(13, 3)    NOT NULL,
    TIEMPO        DATE             NOT NULL,
    SESION_ID     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK20 PRIMARY KEY (CALORIA_ID)
    USING INDEX TABLESPACE users, 
    CONSTRAINT RefSESION21 FOREIGN KEY (SESION_ID)
    REFERENCES SESION(SESION_ID)
) TABLESPACE users
;



-- 
-- TABLE: CREDENCIAL 
--

CREATE TABLE user_gym.CREDENCIAL(
    CREDENCIAL_ID    VARCHAR2(40)     NOT NULL,
    FOLIO            VARCHAR2(8)      NOT NULL,
    FECHA_INICIO     DATE             NOT NULL,
    FECHA_FIN        DATE             NOT NULL,
    CODIGO_BARRAS    VARCHAR2(13)     NOT NULL,
    CLIENTE_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (CREDENCIAL_ID)
    USING INDEX TABLESPACE users, 
    CONSTRAINT RefCLIENTE15 FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE users
;



-- 
-- TABLE: EXPEDIENTE_CLIENTE 
--

CREATE TABLE user_gym.EXPEDIENTE_CLIENTE(
    EXPEDIENTE_CLIENTE_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_REGISTRO           DATE             NOT NULL,
    PESO                     NUMBER(14, 4),
    MASA_CORPORAL            NUMBER(14, 4),
    ESTATURA                 NUMBER(14, 4),
    CLIENTE_ID               NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY (EXPEDIENTE_CLIENTE_ID)
    USING INDEX TABLESPACE users, 
    CONSTRAINT RefCLIENTE29 FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE users
;



-- 
-- TABLE: SENSOR 
--

CREATE TABLE user_gym.SENSOR(
    SENSOR_ID       NUMBER(10, 0)    NOT NULL,
    NUM_SERIE       VARCHAR2(20)     NOT NULL,
    FECHA_COMPRA    DATE             NOT NULL,
    MARCA           VARCHAR2(30)     NOT NULL,
    CLIENTE_ID      NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY (SENSOR_ID)
    USING INDEX TABLESPACE users, 
    CONSTRAINT RefCLIENTE16 FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE users
;

--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Hewlett-Packard
-- Project :      modelo_relacional.DM1
-- Author :       Mauricio Ramos
--
-- Date Created : Tuesday, February 02, 2021 13:40:55
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: EMPLEADO 
--

CREATE TABLE admin_gym.EMPLEADO(
    EMPLEADO_ID           NUMBER(10, 0)    NOT NULL,
    NOMBRE                VARCHAR2(80)     NOT NULL,
    AP_PAT                VARCHAR2(40)     NOT NULL,
    AP_MAT                VARCHAR2(40),
    CURP                  VARCHAR2(20)     NOT NULL,
    NUM_TRABAJADOR        NUMBER(40, 0)    NOT NULL,
    RFC                   VARCHAR2(20)     NOT NULL,
    FECHA_NACIMIENTO      DATE             NOT NULL,
    EMAIL                 VARCHAR2(30)     NOT NULL,
    FOTO                  BLOB             NOT NULL,
    HUELLA_IZQ_PULGAR     BLOB,
    HUELLA_IZQ_INDICE     BLOB,
    HUELLA_IZQ_MENIQUE    BLOB,
    HUELLA_IZQ_ANULAR     BLOB,
    HUELLA_IZQ_MEDIO      BLOB,
    HUELLA_DER_PULGAR     BLOB,
    HUELLA_DER_INDICE     BLOB,
    HUELLA_DER_MENIQUE    BLOB,
    HUELLA_DER_ANULAR     BLOB,
    HUELLA_DER_MEDIO      BLOB,
    TIPO                  VARCHAR2(1)      NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (EMPLEADO_ID)
    USING INDEX TABLESPACE info_gym
) TABLESPACE info_gym
;



-- 
-- TABLE: ADMINISTRATIVO 
--

CREATE TABLE admin_gym.ADMINISTRATIVO(
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    USER           VARCHAR2(30)     NOT NULL,
    PASSWORD       VARCHAR2(30)     NOT NULL,
    ROL            VARCHAR2(40)     NOT NULL,
    CERTIFICADO    BLOB             NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (EMPLEADO_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefEMPLEADO131 FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: DISCIPLINA 
--

CREATE TABLE admin_gym.DISCIPLINA(
    DISCIPLINA_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE            VARCHAR2(20)     NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(200)    NOT NULL,
    ICONO            BLOB             NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (DISCIPLINA_ID)
    USING INDEX TABLESPACE info_gym
) TABLESPACE info_gym
;



-- 
-- TABLE: GIMNASIO 
--

CREATE TABLE admin_gym.GIMNASIO(
    GIMNASIO_ID    NUMBER(10, 0)     NOT NULL,
    FOLIO          VARCHAR2(5)       NOT NULL,
    NOMBRE         VARCHAR2(50)      NOT NULL,
    DIRECCION      VARCHAR2(200)     NOT NULL,
    LATITUD        NUMBER(40, 20)    NOT NULL,
    LONGITUD       NUMBER(40, 20)    NOT NULL,
    TELEFONO       VARCHAR2(15)      NOT NULL,
    PAG_WEB        VARCHAR2(50)      NOT NULL,
    GERENTE_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (GIMNASIO_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefEMPLEADO301 FOREIGN KEY (GERENTE_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: STATUS_DISP 
--

CREATE TABLE admin_gym.STATUS_DISP(
    STATUS_ID      NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(5)      NOT NULL,
    DESCRIPCION    VARCHAR2(100)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (STATUS_ID)
    USING INDEX TABLESPACE info_gym
) TABLESPACE info_gym
;



-- 
-- TABLE: DISPOSITIVO 
--

CREATE TABLE admin_gym.DISPOSITIVO(
    INVENTARIO_ID       NUMBER(10, 0)    NOT NULL,
    NUM_INVENTARIO      VARCHAR2(18)     NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(200)    NOT NULL,
    FECHA_ADQ           DATE             NOT NULL,
    FECHA_STATUS        DATE             NOT NULL,
    STATUS_ACTUAL_ID    NUMBER(10, 0)    NOT NULL,
    GIMNASIO_ID         NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (INVENTARIO_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefGIMNASIO241 FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO(GIMNASIO_ID),
    CONSTRAINT RefSTATUS_DISP71 FOREIGN KEY (STATUS_ACTUAL_ID)
    REFERENCES STATUS_DISP(STATUS_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: GIMNASIO_EMPLEADO 
--

CREATE TABLE admin_gym.GIMNASIO_EMPLEADO(
    GIMANSIO_EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    EMPLEADO_ID             NUMBER(10, 0)    NOT NULL,
    GIMNASIO_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY (GIMANSIO_EMPLEADO_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefGIMNASIO191 FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO(GIMNASIO_ID),
    CONSTRAINT RefEMPLEADO201 FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: GYM_MATERIAL_MULTIMEDIA 
--

CREATE TABLE admin_gym.GYM_MATERIAL_MULTIMEDIA(
    MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    TIPO             VARCHAR2(1)      NOT NULL,
    CONTENIDO        BLOB             NOT NULL,
    FECHA_INICIO     DATE             NOT NULL,
    FECHA_FIN        DATE             NOT NULL,
    GIMNASIO_ID      NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (MULTIMEDIA_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefGIMNASIO11 FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO(GIMNASIO_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: HISTORICO_STATUS_DISP 
--

CREATE TABLE admin_gym.HISTORICO_STATUS_DISP(
    HISTORICO_ID     NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS     DATE             NOT NULL,
    STATUS_ID        NUMBER(10, 0)    NOT NULL,
    INVENTARIO_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (HISTORICO_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefDISPOSITIVO231 FOREIGN KEY (INVENTARIO_ID)
    REFERENCES DISPOSITIVO(INVENTARIO_ID),
    CONSTRAINT RefSTATUS_DISP41 FOREIGN KEY (STATUS_ID)
    REFERENCES STATUS_DISP(STATUS_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: INSTRUCTOR 
--

CREATE TABLE admin_gym.INSTRUCTOR(
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    CEDULA         VARCHAR2(40)     NOT NULL,
    AÑOS_EXP       NUMBER(10, 0)    NOT NULL,
    SUPLENTE_ID    VARCHAR2(40)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (EMPLEADO_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefEMPLEADO141 FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: SALA 
--

CREATE TABLE admin_gym.SALA(
    SALA_ID             NUMBER(10, 0)    NOT NULL,
    CLAVE               VARCHAR2(3)      NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    CAPACIDAD           NUMBER(10, 0)    NOT NULL,
    EMPLEADO_SALA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (SALA_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefADMINISTRATIVO111 FOREIGN KEY (EMPLEADO_SALA_ID)
    REFERENCES ADMINISTRATIVO(EMPLEADO_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: SALA_DISCIPLINA 
--

CREATE TABLE admin_gym.SALA_DISCIPLINA(
    SALA_DISCIPLINA_ID    NUMBER(10, 0)    NOT NULL,
    SALA_ID               NUMBER(10, 0)    NOT NULL,
    DISCIPLINA_ID         NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY (SALA_DISCIPLINA_ID)
    USING INDEX TABLESPACE info_gym, 
    CONSTRAINT RefSALA91 FOREIGN KEY (SALA_ID)
    REFERENCES SALA(SALA_ID),
    CONSTRAINT RefDISCIPLINA101 FOREIGN KEY (DISCIPLINA_ID)
    REFERENCES DISCIPLINA(DISCIPLINA_ID)
) TABLESPACE info_gym
;



-- 
-- TABLE: URL_INSTRUCTOR 
--

CREATE TABLE admin_gym.URL_INSTRUCTOR(
    URL_ID         NUMBER(10, 0)    NOT NULL,
    DIRECCION      VARCHAR2(50)     NOT NULL,
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY (URL_ID), 
    CONSTRAINT RefINSTRUCTOR121 FOREIGN KEY (EMPLEADO_ID)
    REFERENCES INSTRUCTOR(EMPLEADO_ID)
) TABLESPACE info_gym
;

prompt ====== Creando índices en info_gym_ix ======

create index gim_direccion_ix on admin_gym.GIMNASIO(DIRECCION)
TABLESPACE info_gym_ix;

create index gim_latitud_ix on admin_gym.GIMNASIO(LATITUD)
TABLESPACE info_gym_ix;

create index gim_longitud_ix on admin_gym.GIMNASIO(LONGITUD)
TABLESPACE info_gym_ix;

create unique index emp_email_iux on admin_gym.EMPLEADO(EMAIL)
TABLESPACE info_gym_ix;

create unique index emp_rfc_iux on admin_gym.EMPLEADO(RFC)
TABLESPACE info_gym_ix;

create unique index emp_num_trabajador_iux on admin_gym.EMPLEADO(NUM_TRABAJADOR)
TABLESPACE info_gym_ix;

create unique index adm_user_iux on admin_gym.ADMINISTRATIVO(USER)
TABLESPACE info_gym_ix;

create unique index adm_password_iux on admin_gym.ADMINISTRATIVO(PASSWORD)
TABLESPACE info_gym_ix;

prompt ====== Creando índices en users_ix ======

create unique index cli_username_iux on user_gym.CLIENTE(USERNAME)
TABLESPACE users_ix;

create unique index cli_password_iux on user_gym.CLIENTE(PASSWORD)
TABLESPACE users_ix;

create index cli_direccion_ix on user_gym.CLIENTE(DIRECCION)
TABLESPACE users_ix;

create unique index cre_codigo_barras_iux on user_gym.CREDENCIAL(CODIGO_BARRAS)
TABLESPACE users_ix;

create index ses_fecha_dia_ix on user_gym.SESION(FECHA_INICIO)
TABLESPACE users_ix;

create index ses_fecha_mes_ix on user_gym.SESION(FECHA_INICIO)
TABLESPACE users_ix;

create index ses_fecha_ano_ix on user_gym.SESION(FECHA_INICIO)
TABLESPACE users_ix;

create index ses_duracion_ix on user_gym.SESION(DURACION)
TABLESPACE users_ix;

create index ses_total_calorias_ix on user_gym.SESION(TOTAL_CALORIAS)
TABLESPACE users_ix;

create index cal_valor_ix on user_gym.CALORIAS(VALOR)
TABLESPACE users_ix;

create index cal_tiempo_ix on user_gym.CALORIAS(TIEMPO)
TABLESPACE users_ix;

prompt ====== Creando índices en blobtbs1 ======

create index emp_foto_iux on admin_gym.EMPLEADO(FOTO)
TABLESPACE blobtbs1;

create unique index emp_hip_iux on admin_gym.EMPLEADO(HUELLA_IZQ_PULGAR)
TABLESPACE blobtbs1;

create unique index emp_hii_iux on admin_gym.EMPLEADO(HUELLA_IZQ_INDICE)
TABLESPACE blobtbs1;

create unique index emp_himenique_iux on admin_gym.EMPLEADO(HUELLA_IZQ_MENIQUE)
TABLESPACE blobtbs1;

create unique index emp_hia_iux on admin_gym.EMPLEADO(HUELLA_IZQ_ANULAR)
TABLESPACE blobtbs1;

create unique index emp_himedio_iux on admin_gym.EMPLEADO(HUELLA_IZQ_MEDIO)
TABLESPACE blobtbs1;

create unique index emp_hdp_iux on admin_gym.EMPLEADO(HUELLA_DER_PULGAR)
TABLESPACE blobtbs1;

create unique index emp_hdi_iux on admin_gym.EMPLEADO(HUELLA_DER_INDICE)
TABLESPACE blobtbs1;

create unique index emp_hdmenique_iux on admin_gym.EMPLEADO(HUELLA_DER_MENIQUE)
TABLESPACE blobtbs1;

create unique index emp_hda_iux on admin_gym.EMPLEADO(HUELLA_DER_ANULAR)
TABLESPACE blobtbs1;

create unique index emp_hdmedio_iux on admin_gym.EMPLEADO(HUELLA_DER_MEDIO)
TABLESPACE blobtbs1;

create unique index gmm_contenido_iux on admin_gym.CONTENIDO(GYM_MATERIAL_MULTIMEDIA)
TABLESPACE blobtbs1;

create unique index adm_certificado_iux on admin_gym.ADMINISTRATIVO(CERTIFICADO)
TABLESPACE blobtbs1;

create unique index dis_icono_iux on admin_gym.DISCIPLINA(ICONO)
TABLESPACE blobtbs1;

create unique index cli_foto_iux on admin_gym.CLIENTE(FOTO)
TABLESPACE blobtbs1;


