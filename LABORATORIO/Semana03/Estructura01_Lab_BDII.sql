/*
Estrutura Base de Datos SQL
*/

CREATE TABLE usuarios(
idu INT,
nivel TINYINT,
usuario VARCHAR(45),
correo VARCHAR(175),
password VARCHAR(45),
nombre VARCHAR(245),
tipo SET('alumno','profesor','admin'),
avatar VARCHAR(45),
PRIMARY KEY(idu)
);

CREATE TABLE usuarios_has_usuarios(
usuarios_idu INT,
usuarios_idu1 INT,
PRIMARY KEY(usuarios_idu,usuarios_idu1)
);
ALTER TABLE usuarios_has_usuarios ADD FOREIGN KEY (usuarios_idu) REFERENCES usuarios(idu);
ALTER TABLE usuarios_has_usuarios ADD FOREIGN KEY (usuarios_idu1) REFERENCES usuarios(idu);

CREATE TABLE configuracion(
idc INT,
idusuario INT,
nombre VARCHAR(32),
valor TEXT,
PRIMARY KEY (idc)
);
ALTER TABLE configuracion ADD FOREIGN KEY (idusuario) REFERENCES usuarios(idu);

CREATE TABLE grupos(
idg INT,
nombre VARCHAR(45),
idusuario INT,
tipo ENUM('curso', 'tablon'),
publico BOOLEAN,
PRIMARY KEY (idg)
);

ALTER TABLE grupos ADD FOREIGN KEY (idusuario) REFERENCES usuarios(idu);

CREATE TABLE mensajes(
idm INT,
idu_de INT,
idu_para INT,
titulo VARCHAR(245),
mensaje TEXT,
idgrupo INT,
fecha DATE,
hora TIME,
tags TEXT,
PRIMARY KEY (idm)
);
ALTER TABLE mensajes ADD FOREIGN KEY (idu_de) REFERENCES usuarios(idu);
ALTER TABLE mensajes ADD FOREIGN KEY (idu_para) REFERENCES usuarios(idu);
ALTER TABLE mensajes ADD FOREIGN KEY (idgrupo) REFERENCES grupos(idg);


CREATE TABLE calendario(
ide INT,
idusuario INT,
nombre VARCHAR(45),
fecha_ini DATE,
fecha_fin DATE,
hora_ini TIME,
hora_fin TIME,
detalles VARCHAR(70),
tipo ENUM('examen','evento','asignacion','alerta','calse'),
img_ini VARCHAR(50),
img_fin VARCHAR(50),
PRIMARY KEY(ide)
);
ALTER TABLE calendario ADD FOREIGN KEY (idusuario) REFERENCES usuarios(idu);

CREATE TABLE grupos_has_calendario(
grupos_idg INT,
calendario_ide INT,
PRIMARY KEY(grupos_idg,calendario_ide)
);
ALTER TABLE grupos_has_calendario ADD FOREIGN KEY (grupos_idg) REFERENCES grupos(idg);
ALTER TABLE grupos_has_calendario ADD FOREIGN KEY (calendario_ide) REFERENCES calendario(ide);

CREATE TABLE calendario_has_mensajes(
calendario_ide INT,
mensajes_idm INT,
PRIMARY KEY(mensajes_idm,calendario_ide)
);
ALTER TABLE calendario_has_mensajes ADD FOREIGN KEY (mensajes_idm) REFERENCES mensajes(idm);
ALTER TABLE calendario_has_mensajes ADD FOREIGN KEY (calendario_ide) REFERENCES calendario(ide);
