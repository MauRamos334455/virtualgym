-- @Autor: Kennedy villa carolina
--         Ramos villaseñor cesar mauricio
-- @Fecha: 02/02/2021 
-- @Descripción: Creación de los objetos
-- para la base de datos (tablas, índices, constraints)

-- 
-- table: empleado 
--
create table admin_gym.empleado(
    empleado_id           number(10, 0)    not null,
    nombre                varchar2(80)     not null,
    ap_pat                varchar2(40)     not null,
    ap_mat                varchar2(40),
    curp                  varchar2(20)     not null,
    num_trabajador        number(40, 0)    not null,
    rfc                   varchar2(20)     not null,
    fecha_nacimiento      date             not null,
    email                 varchar2(30)     not null,
    foto                  blob             not null,
    huella_izq_pulgar     blob,
    huella_izq_indice     blob,
    huella_izq_menique    blob,
    huella_izq_anular     blob,
    huella_izq_medio      blob,
    huella_der_pulgar     blob,
    huella_der_indice     blob,
    huella_der_menique    blob,
    huella_der_anular     blob,
    huella_der_medio      blob,
    tipo                  varchar2(1)      not null,
    constraint empleado_pk primary key (empleado_id)
    using index (
        create unique index emp_pk_ix on empleado(empleado_id)
        tablespace info_gym_idx
) tablespace info_gym
lob (foto) store as securefile (tablespace blobtbs1)
lob (huella_izq_pulgar) store as securefile (tablespace blobtbs1)
lob (huella_izq_indice) store as securefile (tablespace blobtbs1)
lob (huella_izq_menique) store as securefile (tablespace blobtbs1)
lob (huella_izq_anular) store as securefile (tablespace blobtbs1)
lob (huella_izq_medio) store as securefile (tablespace blobtbs1)
lob (huella_der_pulgar) store as securefile (tablespace blobtbs1)
lob (huella_der_indice) store as securefile (tablespace blobtbs1)
lob (huella_der_menique) store as securefile (tablespace blobtbs1)
lob (huella_der_anular) store as securefile (tablespace blobtbs1)
lob (huella_der_medio) store as securefile (tablespace blobtbs1);

-- 
-- table: administrativo 
--
create table admin_gym.administrativo(
    empleado_id    number(10, 0)    not null,
    user           varchar2(30)     not null,
    password       varchar2(30)     not null,
    rol            varchar2(40)     not null,
    certificado    blob             not null,
    constraint administrativo_pk primary key (empleado_id)
    using index (
        create unique index adm_pk_ix on administrativo(empleado_id)
        tablespace info_gym_idx
    ), 
    constraint adm_empleado_id_fk foreign key (empleado_id)
    references admin_gym.empleado(empleado_id)
) tablespace info_gym
lob (certificado) store as securefile (tablespace blobtbs1);

-- 
-- table: disciplina 
--
create table admin_gym.disciplina(
    disciplina_id    number(10, 0)    not null,
    clave            varchar2(20)     not null,
    nombre           varchar2(40)     not null,
    descripcion      varchar2(200)    not null,
    icono            blob             not null,
    constraint disciplina_pk primary key (disciplina_id)
    using index (
        create unique index dis_pk_ix on disciplina(disciplina_id)
        tablespace info_gym_idx
    )
) tablespace info_gym
lob (icono) store as securefile (tablespace blobtbs1);

-- 
-- table: gimnasio 
--
create table admin_gym.gimnasio(
    gimnasio_id    number(10, 0)     not null,
    folio          varchar2(5)       not null,
    nombre         varchar2(50)      not null,
    direccion      varchar2(200)     not null,
    latitud        number(40, 20)    not null,
    longitud       number(40, 20)    not null,
    telefono       varchar2(15)      not null,
    pag_web        varchar2(50)      not null,
    gerente_id     number(10, 0)     not null,
    constraint gimnasio_pk primary key (gimnasio_id)
    using index (
        create unique index gim_pk_ix on gimnasio(gimnasio_id)
        tablespace info_gym_idx
    ), 
    constraint gim_gerente_id_fk foreign key (gerente_id)
    references admin_gym.empleado(empleado_id)
) tablespace info_gym
;

-- 
-- table: status_disp 
--
create table admin_gym.status_disp(
    status_id      number(10, 0)    not null,
    clave          varchar2(5)      not null,
    descripcion    varchar2(100)    not null,
    constraint status_disp_pk primary key (status_id)
    using index (
        create unique index sd_pk_ix on status_disp(status_id)
        tablespace info_gym_idx
    )
) tablespace info_gym;

-- 
-- table: dispositivo 
--
create table admin_gym.dispositivo(
    dispositivo_id       number(10, 0)    not null,
    num_inventario      varchar2(18)     not null,
    nombre              varchar2(40)     not null,
    descripcion         varchar2(200)    not null,
    fecha_adq           date             not null,
    fecha_status        date             not null,
    status_actual_id    number(10, 0)    not null,
    gimnasio_id         number(10, 0)    not null,
    constraint dispositivo_pk primary key (inventario_id)
    using index (
        create unique index dis_pk_ix on dispositivo(dispositivo_id)
        tablespace info_gym_idx
    ),
    constraint dis_gimnasio_id_fk foreign key (gimnasio_id)
    references admin_gym.gimnasio(gimnasio_id),
    constraint dis_status_actual_id_fk foreign key (status_actual_id)
    references admin_gym.status_disp(status_id)
) tablespace info_gym;

-- 
-- table: gimnasio_empleado 
--
create table admin_gym.gimnasio_empleado(
    gimansio_empleado_id    number(10, 0)    not null,
    empleado_id             number(10, 0)    not null,
    gimnasio_id             number(10, 0)    not null,
    constraint gimnasio_empleado_pk primary key (gimansio_empleado_id)
    using index (
        create unique index ge_pk_ix on gimnasio_empleado(gimnasio_empleado_id)
        tablespace info_gym_idx
    ), 
    constraint ge_gimnasio_id_fk foreign key (gimnasio_id)
    references gimnasio(gimnasio_id),
    constraint ge_empleado_id_fk foreign key (empleado_id)
    references admin_gym.empleado(empleado_id)
) tablespace info_gym;

-- 
-- table: gym_material_multimedia 
--
create table admin_gym.gym_material_multimedia(
    gym_material_multimedia_id    number(10, 0)    not null,
    tipo             varchar2(1)      not null,
    contenido        blob             not null,
    fecha_inicio     date             not null,
    fecha_fin        date             not null,
    gimnasio_id      number(10, 0)    not null,
    constraint gym_material_multimedia_pk primary key (gym_material_multimedia_id)
    using index (
        create unique index gmm_pk_ix on gym_material_multimedia(gym_material_multimedia_id)
        tablespace info_gym_idx,
    constraint gmm_gimnasio_id_fk foreign key (gimnasio_id)
    references admin_gym.gimnasio(gimnasio_id)
) tablespace info_gym
lob (contenido) store as securefile (tablespace blobtbs1);

-- 
-- table: historico_status_disp 
--
create table admin_gym.historico_status_disp(
    historico_status_disp_id     number(10, 0)    not null,
    fecha_status     date             not null,
    status_id        number(10, 0)    not null,
    inventario_id    number(10, 0)    not null,
    constraint historico_status_disp_pk primary key (historico_status_disp_id)
    using index (
        create unique index hsd_pk_ix on historico_status_disp(historico_status_disp_id)
        tablespace info_gym_idx
    ), 
    constraint hsd_inventario_id_fk foreign key (inventario_id)
    references admin_gym.dispositivo(inventario_id),
    constraint hsd_status_id_fk foreign key (status_id)
    references admin_gym.status_disp(status_id)
) tablespace info_gym
;

-- 
-- table: instructor 
--
create table admin_gym.instructor(
    empleado_id    number(10, 0)    not null,
    cedula         varchar2(40)     not null,
    años_exp       number(10, 0)    not null,
    suplente_id    varchar2(40)     not null,
    constraint instructor_pk primary key (empleado_id)
    using index (
        create unique index ins_pk_ix on instructor(empleado_id)
        tablespace info_gym_idx, 
    constraint ins_empleado_id_fk foreign key (empleado_id)
    references admin_gym.empleado(empleado_id)
) tablespace info_gym;

-- 
-- table: sala 
--
create table admin_gym.sala(
    sala_id             number(10, 0)    not null,
    clave               varchar2(3)      not null,
    nombre              varchar2(40)     not null,
    capacidad           number(10, 0)    not null,
    empleado_sala_id    number(10, 0)    not null,
    constraint sala_pk primary key (sala_id)
    using index (
        create unique index sal_pk_ix on sala(sala_id)
        tablespace info_gym_idx
    ), 
    constraint sal_empleado_sala_id_fk foreign key (empleado_sala_id)
    references admin_gym.administrativo(empleado_id)
) tablespace info_gym;

-- 
-- table: sala_disciplina 
--
create table admin_gym.sala_disciplina(
    sala_disciplina_id    number(10, 0)    not null,
    sala_id               number(10, 0)    not null,
    disciplina_id         number(10, 0)    not null,
    constraint sala_disciplina_pk primary key (sala_disciplina_id)
    using index (
        create unique index sd_pk_ix on sala_disciplina(sala_disciplina_id)
        tablespace info_gym_idx
    ), 
    constraint sd_sala_id_fk foreign key (sala_id)
    references admin_gym.sala(sala_id),
    constraint sd_disciplina_id_fk foreign key (disciplina_id)
    references admin_gym.disciplina(disciplina_id)
) tablespace info_gym;

-- 
-- table: url_instructor 
--
create table admin_gym.url_instructor(
    url_instructor_id         number(10, 0)    not null,
    direccion      varchar2(50)     not null,
    empleado_id    number(10, 0)    not null,
    constraint url_instructor_pk primary key (url_instructor_id)
    using index (
        create unique index ui_pk_ix on url_instructor(url_instructor_id)
        tablespace info_gym_idx
    ),
    constraint ui_empleado_id_fk foreign key (empleado_id)
    references admin_gym.instructor(empleado_id)
) tablespace info_gym
;

-- 
-- table: cliente 
--
create table user_gym.cliente(
    cliente_id          number(10, 0)    not null,
    nombre              varchar2(50)     not null,
    ap_paterno          varchar2(40)     not null,
    ap_materno          varchar2(40),
    email               varchar2(30)     not null,
    username            varchar2(30)     not null,
    password            varchar2(40)     not null,
    direccion           varchar2(200)    not null,
    fecha_nacimiento    date             not null,
    curp                varchar2(20)     not null,
    foto                blob             not null,
    constraint cliente_pk primary key (cliente_id)
    using index (
        create unique index cli_pk_ix on cliente(cliente_id)
        tablespace users_idx
    )
) tablespace users
lob (foto) store as securefile (tablespace blobtbs1);

-- 
-- table: sesion 
--
grant references 
create table user_gym.sesion(
    sesion_id         number(10, 0)    not null,
    tipo              varchar2(15)     not null,
    numero            number(10, 0)    not null,
    fecha_inicio      date             not null,
    duracion          varchar2(40)     not null,
    total_calorias    number(14, 4)    not null,
    cliente_id        number(10, 0)    not null,
    empleado_id       number(10,0)     not null,
    sala_id           number(10,0)     not null
    constraint sesion_pk primary key (sesion_id)
    using index (
        create unique index ses_pk_ix on sesion(sesion_id)
        tablespace users_idx
    ), 
    constraint ses_cliente_id_fk foreign key (cliente_id)
    references user_gym.cliente(cliente_id)
) tablespace users
;

-- 
-- table: caloria 
--

create table user_gym.caloria(
    caloria_id    number(10, 0)    not null,
    valor         number(13, 3)    not null,
    tiempo        date             not null,
    sesion_id     number(10, 0)    not null,
    constraint caloria_pk primary key (caloria_id)
    using index (
        create unique index cal_pk_ix on caloria(caloria_id)
        tablespace users_idx
    ), 
    constraint cal_sesion_id_fk foreign key (sesion_id)
    references user_gym.sesion(sesion_id)
) tablespace users
;

-- 
-- table: credencial 
--
create table user_gym.credencial(
    credencial_id    varchar2(40)     not null,
    folio            varchar2(8)      not null,
    fecha_inicio     date             not null,
    fecha_fin        date             not null,
    codigo_barras    varchar2(13)     not null,
    cliente_id       number(10, 0)    not null,
    constraint credencial_pk primary key (credencial_id)
    using index (
        create unique index cre_pk_ix on credencial(credencial_id)
        tablespace users_idx
    ), 
    constraint cre_cliente_id_fk foreign key (cliente_id)
    references user_gym.cliente(cliente_id)
) tablespace users
;

-- 
-- table: expediente_cliente 
--
create table user_gym.expediente_cliente(
    expediente_cliente_id    number(10, 0)    not null,
    fecha_registro           date             not null,
    peso                     number(14, 4),
    masa_corporal            number(14, 4),
    estatura                 number(14, 4),
    cliente_id               number(10, 0)    not null,
    constraint expediente_cliente_pk primary key (expediente_cliente_id)
    using index (
        create unique index ec_pk_ix on expediente_cliente(expediente_cliente_id)
        tablespace users_idx
    ), 
    constraint ec_cliente_id_fk foreign key (cliente_id)
    references user_gym.cliente(cliente_id)
) tablespace users
;

-- 
-- table: sensor 
--
create table user_gym.sensor(
    sensor_id       number(10, 0)    not null,
    num_serie       varchar2(20)     not null,
    fecha_compra    date             not null,
    marca           varchar2(30)     not null,
    cliente_id      number(10, 0)    not null,
    constraint sensor_pk primary key (sensor_id)
    using index (
        create unique index sen_pk_ix on sensor(sensor_id)
        tablespace users_idx
    ), 
    constraint sen_cliente_id_fk foreign key (cliente_id)
    references user_gym.cliente(cliente_id)
) tablespace users
;

-- union de módulos
grant references on user_gym.sesion to admin_gym;

alter table user_gym.sesion add constraint empleado_id_fk 
foreign key (empleado_id) 
references admin_gym.instructor(empleado_id);

alter table user_gym.sesion add constraint sesion_id_fk 
foreign key (sesion_id) 
references admin_gym.sala(sala_id);


----------------------------------------------------------------------
prompt ====== creando índices en info_gym_ix ======

create index gim_direccion_ix on admin_gym.gimnasio(direccion)
tablespace info_gym_idx;

create index gim_latitud_ix on admin_gym.gimnasio(latitud)
tablespace info_gym_idx;

create index gim_longitud_ix on admin_gym.gimnasio(longitud)
tablespace info_gym_idx;

create unique index emp_email_iux on admin_gym.empleado(email)
tablespace info_gym_idx;

create unique index emp_rfc_iux on admin_gym.empleado(rfc)
tablespace info_gym_idx;

create unique index emp_num_trabajador_iux on admin_gym.empleado(num_trabajador)
tablespace info_gym_idx;

create unique index adm_user_iux on admin_gym.administrativo(user)
tablespace info_gym_idx;

create unique index adm_password_iux on admin_gym.administrativo(password)
tablespace info_gym_idx;

prompt ====== creando índices en users_ix ======

create unique index cli_username_iux on user_gym.cliente(username)
tablespace users_idx;

create unique index cli_password_iux on user_gym.cliente(password)
tablespace users_idx;

create index cli_direccion_ix on user_gym.cliente(direccion)
tablespace users_idx;

create unique index cre_codigo_barras_iux on user_gym.credencial(codigo_barras)
tablespace users_idx;

create index ses_fecha_dia_ix on user_gym.sesion(fecha_inicio)
tablespace users_idx;

create index ses_fecha_mes_ix on user_gym.sesion(fecha_inicio)
tablespace users_idx;

create index ses_fecha_ano_ix on user_gym.sesion(fecha_inicio)
tablespace users_idx;

create index ses_duracion_ix on user_gym.sesion(duracion)
tablespace users_idx;

create index ses_total_calorias_ix on user_gym.sesion(total_calorias)
tablespace users_idx;

create index cal_valor_ix on user_gym.caloria(valor)
tablespace users_idx;

create index cal_tiempo_ix on user_gym.caloria(tiempo)
tablespace users_idx;

prompt ====== creando índices en blobtbs1 ======

create index emp_foto_iux on admin_gym.empleado(foto)
tablespace blobtbs1;

create unique index emp_hip_iux on admin_gym.empleado(huella_izq_pulgar)
tablespace blobtbs1;

create unique index emp_hii_iux on admin_gym.empleado(huella_izq_indice)
tablespace blobtbs1;

create unique index emp_himenique_iux on admin_gym.empleado(huella_izq_menique)
tablespace blobtbs1;

create unique index emp_hia_iux on admin_gym.empleado(huella_izq_anular)
tablespace blobtbs1;

create unique index emp_himedio_iux on admin_gym.empleado(huella_izq_medio)
tablespace blobtbs1;

create unique index emp_hdp_iux on admin_gym.empleado(huella_der_pulgar)
tablespace blobtbs1;

create unique index emp_hdi_iux on admin_gym.empleado(huella_der_indice)
tablespace blobtbs1;

create unique index emp_hdmenique_iux on admin_gym.empleado(huella_der_menique)
tablespace blobtbs1;

create unique index emp_hda_iux on admin_gym.empleado(huella_der_anular)
tablespace blobtbs1;

create unique index emp_hdmedio_iux on admin_gym.empleado(huella_der_medio)
tablespace blobtbs1;

create unique index gmm_contenido_iux on admin_gym.contenido(gym_material_multimedia)
tablespace blobtbs1;

create unique index adm_certificado_iux on admin_gym.administrativo(certificado)
tablespace blobtbs1;

create unique index dis_icono_iux on admin_gym.disciplina(icono)
tablespace blobtbs1;

create unique index cli_foto_iux on admin_gym.cliente(foto)
tablespace blobtbs1;