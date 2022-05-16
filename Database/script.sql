create database CG;

use CG;
create table tipoUsuario(
id_tip int not null auto_increment primary key
);

insert into tipoUsuario values(null, 'Administrador');
insert into tipoUsuario values(null, 'Usuario');

create table usuario(
id_usu int not null auto_increment primary key,
nombre varchar(60) not null,
apellido varchar(60) not null,
correo varchar(60) not null,
contraseña varchar(64) not null,
token varchar(64) not null,
fecha timestamp not null
);

insert into usuario values(null, 'Wilkens', 'Mompoint','informatica2020.cg@gmail.com',sha1('21chichi'),sha1('mwforlife24@gmail.com'),null);

create table tipoPersonal(
id_tip int not null auto_increment primary key,
nombre varchar(60) not null
);

insert into tipoPersonal values(null, 'Equipo Directivo');
insert into tipoPersonal values(null, 'Coordinadores Academicos');
insert into tipoPersonal values(null, 'Profesores Lider PLOC');
insert into tipoPersonal values(null, 'Profesores de Asignaturas');
insert into tipoPersonal values(null, 'Equipo Programa de Integración PIE');
insert into tipoPersonal values(null, 'Asistentes de Apoyo Profesional');
insert into tipoPersonal values(null, 'Asistentes Técnicos de Aula');
insert into tipoPersonal values(null, 'Asistentes Inspectores de Patio');
insert into tipoPersonal values(null, 'Asistentes de Servicio');

create table Personal(
id_per int not null auto_increment primary key,
nombre varchar(60) not null,
apellido varchar(60) not null,
correo varchar(60) not null,
id_tip int not null references tipoPersonal(id_tip),
cargo varchar(60) not null,
foto varchar(30) not null,
fecha timestamp
);

create table menu(
id_men int not null auto_increment primary key,
nombre varchar(64) not null,
ubicacion varchar(60) null
);

create table submenu(
id_sub int not null auto_increment primary key,
nombre varchar(64) not null,
id_men int not null,
ubicacion varchar(60) null
);

create table estadoAdmision(
id_est int not null auto_increment primary key,
nombre varchar(60) not null
);

insert into estadoAdmision values(null, 'Abierto');
insert into estadoAdmision values(null, 'Cerrado');

create table admision(
id_ad int not null auto_increment primary key,
fecha_inicio date not null,
fecha_termino date not null,
id_est int not null references estadoAdmision(id_est)
);

create table tipoContenido(
id_tip int not null auto_increment primary key,
nombre varchar(40) not null
);

insert into tipoContenido values(null, 'Imagen');
insert into tipoContenido values(null, 'Video');

create table galeria(
id_gal int not null auto_increment primary key,
nombre varchar(40) not null,
link varchar(200) not null,
id_tip int not null references tipoContenido(id_tip),
fecha date not null
);