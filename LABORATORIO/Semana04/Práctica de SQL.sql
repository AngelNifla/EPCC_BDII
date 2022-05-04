/*
1. Listar todos los usuarios que sean del tipo "alumno" y que tengas "eventos" programas en el calendario durante el mes de mayo, se debe considerar:
  - Los datos personales del usuario y su correo electrónico.
  - La cantidad de grupos a los que pertenece.
  - La cantidad de mensajes enviados durante el año.
*/
USE bd;
SELECT u.usuario Usuario_Alumno,u.nombre Nombre_usuario,u.tipo Tipo,u.correo Correo, c.nombre Evento, COUNT(u.idu) Num_Grupo, COUNT(u.idu) Num_Mensajes
FROM usuarios u
INNER JOIN
calendario c
ON u.idu = c.idusuario 
INNER JOIN
grupos g
ON u.idu = g.idusuario
INNER JOIN
mensajes m
ON u.idu = m.idu_de
WHERE u.tipo = "alumno" AND c.tipo = "evento" AND MONTH(c.fecha_ini) = 3 AND YEAR(m.fecha) = 2022
ORDER BY Usuario_Alumno;

/*
2. Listar todas las alertas creadas por los docentes considerando:
  - Datos personales del usuario y su correo electrónico.
  - Que se haya enviado un mensaje hasta antes del medio día en el mes de abril.
  - Sólo docentes que estén en el grupo "curso".
*/

USE bd;
SELECT u.usuario Usuario_Profesor,u.nombre Nombre_usuario,u.tipo Tipo,u.correo Correo, c.nombre Alerta
FROM usuarios u
INNER JOIN calendario c
ON u.idu=c.idusuario
INNER JOIN mensajes m
ON u.idu=m.idu_de 
INNER JOIN  grupos g
ON u.idu=g.idusuario 
WHERE u.tipo = "docente" AND c.tipo= "alerta" AND YEAR(m.fecha) = 2022 AND
MONTH(m.fecha) <= 4 AND HOUR(m.hora) <= 12 AND g.tipo="curso"
ORDER BY Usuario_Profesor;