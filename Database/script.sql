create database CG;

use CG;
create table tipoUsuario(
id_tip int not null auto_increment primary key,
nombre varchar(30) not null
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
fecha timestamp not null,
perfil varchar(30) not null
);

insert into usuario values(null, 'Wilkens', 'Mompoint','informatica2020.cg@gmail.com',sha1('21chichi'),sha1('mwforlife24@gmail.com'),null,'me.jpg');

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
telefono varchar(20) not null,
id_tip int not null references tipoPersonal(id_tip),
cargo varchar(60) not null,
foto varchar(30) not null,
fecha timestamp
);


create table estadomenu(
id_est int not null auto_increment primary key,
nombre varchar(30) not null
);

insert into estadomenu values(null, "Habilitado");
insert into estadomenu values(null, "Deshabilitado");


create table menu(
id_men int not null auto_increment primary key,
nombre varchar(64) not null,
ubicacion varchar(60) null,
id_est int not null references estadomenu(id_est)
);

insert into menu values(null, "Inicio", "index.php",1);
insert into menu values(null, "Equipo", "#",1);
insert into menu values(null, "Galeria", "Galeria",1);
insert into menu values(null, "Documentos","#",1);
insert into menu values(null, "Comunicados","#",1);
insert into menu values(null, "Escuela","#",1);
insert into menu values(null, "Retorno a Clases","#",1);

create table tiposub(
id_tip int not null auto_increment primary key,
nombre varchar(30) not null
);

insert into tiposub values(null, "Documento");
insert into tiposub values(null, "Pagina Interna");
insert into tiposub values(null, "Pagina Externa");

create table submenu(
id_sub int not null auto_increment primary key,
nombre varchar(64) not null,
id_men int not null,
ubicacion varchar(60) null,
id_tip int not null references tiposub(id_tip),
id_est int not null references estadomenu(id_est)
);

insert into submenu value(null,"Equipo Directivo",2,"Equipo-Directivo",2,1);
insert into submenu value(null,"Coordinadores Academicos",2,"Coordinadores-academicos",2,1);
insert into submenu value(null,"Cuerpo Docente PLOC",2,"Cuerpo-Docente",2,1);
insert into submenu value(null,"Profesores De Asignatura",2,"Profesores-de-Asignaturas",2,1);
insert into submenu value(null,"Equipo Programa de Integración PIE",2,"PIE",2,1);
insert into submenu value(null,"Inspectores",2,"Inspectores",2,1);


insert into submenu value(null,"Reglamento Interno",4,"media/documentos/Reglamentos/REGLAMENTO-INTERNO-2022.pdf",1,1);
insert into submenu value(null,"Reglamento De Evaluación",4,"media/documentos/Reglamentos/REGLAMENTO-DE-EVALUACION-2022.pdf",1,1);
insert into submenu value(null,"Reglamento Convivenvia Escolar",4,"media/documentos/Reglamentos/REGLAMENTO-CONVIVENVIA-ESCOLAR-2022.pdf",1,1);

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
periodo varchar(40),
id_est int not null references estadoAdmision(id_est)
);

insert into admision values(null, "2021-11-15","2022-02-15","2022", 2);

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

create table comunicados(
id_com int not null auto_increment primary key,
titulo varchar(40) not null,
descripcion varchar(200) not null,
fechaHora datetime not null,
comunicado_text varchar(1000) not null
);

create table cursos(
id_cur int not null auto_increment primary key,
nombre int not null
);

insert into cursos(nombre) values('1 Basico A');
insert into cursos(nombre) values('1 Basico B');
insert into cursos(nombre) values('2 Basico A');
insert into cursos(nombre) values('2 Basico B');
insert into cursos(nombre) values('3 Basico A');
insert into cursos(nombre) values('3 Basico B');
insert into cursos(nombre) values('4 Basico A');
insert into cursos(nombre) values('4 Basico B');
insert into cursos(nombre) values('5 Basico A');
insert into cursos(nombre) values('5 Basico B');
insert into cursos(nombre) values('6 Basico A');
insert into cursos(nombre) values('6 Basico B');
insert into cursos(nombre) values('7 Basico A');
insert into cursos(nombre) values('7 Basico B');
insert into cursos(nombre) values('8 Basico A');
insert into cursos(nombre) values('8 Basico B');
insert into cursos(nombre) values('1 Medio A');
insert into cursos(nombre) values('1 Medio B');
insert into cursos(nombre) values('2 Medio A');
insert into cursos(nombre) values('2 Medio B');
insert into cursos(nombre) values('3 Medio');
insert into cursos(nombre) values('4 Medio');
insert into cursos(nombre) values('Prekinder A');
insert into cursos(nombre) values('Prekinder B');
insert into cursos(nombre) values('Kinder A');
insert into cursos(nombre) values('Kinder B');