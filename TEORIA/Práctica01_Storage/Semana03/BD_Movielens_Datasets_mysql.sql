CREATE DATABASE movielens_datasets;

USE movielens_datasets;

CREATE TABLE peliculas(
id_pelicula INTEGER PRIMARY KEY
);

CREATE TABLE usuarios(
id_usuario INTEGER PRIMARY KEY
);

CREATE TABLE usuario_califica_peliculas(
id_usuario INTEGER,
id_pelicula INTEGER,
calificacion INTEGER
);

ALTER TABLE usuario_califica_peliculas ADD FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula);
ALTER TABLE usuario_califica_peliculas ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

/*//Sentencias de prueba

USE movie_ratings;
TRUNCATE usuario_califica_peliculas;

DROP DATABASE movie_ratings;
*/