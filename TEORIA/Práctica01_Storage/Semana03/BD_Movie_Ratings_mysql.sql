CREATE DATABASE movie_ratings;

USE movie_ratings;

CREATE TABLE peliculas(
nombre_pelicula VARCHAR(100)PRIMARY KEY
);

CREATE TABLE usuarios(
nombre_usuario VARCHAR(100) PRIMARY KEY
);
USE movie_ratings;

CREATE TABLE usuario_califica_peliculas(
nombre_usuario VARCHAR(100),
nombre_pelicula VARCHAR(100),
calificacion INTEGER
);

ALTER TABLE usuario_califica_peliculas ADD FOREIGN KEY (nombre_pelicula) REFERENCES peliculas(nombre_pelicula);
ALTER TABLE usuario_califica_peliculas ADD FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario);

/*//Sentencias de prueba
INSERT INTO usuarios(nombre_usuario) VALUES ('Monica T');

USE movie_ratings;

SELECT database();
TRUNCATE usuario_califica_peliculas;

DROP DATABASE movie_ratings;
*/


