connect admin_gym/kera;
whenever sqlerror exit rollback
create table empleado(
    empleado_id           number(10, 0)    not null,
    nombre                varchar2(80)     not null,
    ap_pat                varchar2(40)     not null,
    ap_mat                varchar2(40),
    curp                  varchar2(20)     not null,
    num_trabajador        number(38, 0)    not null,
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
    )
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
create table administrativo(
    empleado_id    number(10, 0)    not null,
    username           varchar2(30)     not null,
    password       varchar2(30)     not null,
    rol            varchar2(40)     not null,
    certificado    blob             not null,
    constraint administrativo_pk primary key (empleado_id)
    using index (
        create unique index adm_pk_ix on administrativo(empleado_id)
        tablespace info_gym_idx
    ),
    constraint adm_empleado_id_fk foreign key (empleado_id)
    references empleado(empleado_id)
) tablespace info_gym
lob (certificado) store as securefile (tablespace blobtbs1);
whenever sqlerror continue none;

create table gimnasio(
    gimnasio_id    number(10, 0)     not null,
    folio          varchar2(5)       not null,
    nombre         varchar2(50)      not null,
    direccion      varchar2(200)     not null,
    latitud        number(38, 20)    not null,
    longitud       number(38, 20)    not null,
    telefono       varchar2(15)      not null,
    pag_web        varchar2(50)      not null,
    gerente_id     number(10, 0)     not null,
    constraint gimnasio_pk primary key (gimnasio_id)
    using index (
        create unique index gim_pk_ix on gimnasio(gimnasio_id)
        tablespace info_gym_idx
    ), 
    constraint gim_gerente_id_fk foreign key (gerente_id)
    references admin_gym.empleado(empleado_id),
    constraint folio_uk unique(folio)
    using index (
      create unique index folio_uk_ix on gimnasio(folio)
      tablespace info_gym_idx
    ),
    constraint pag_web_chk check (pag_web in 'www')
    using index tablespace info_gym_idx
) tablespace info_gym
;