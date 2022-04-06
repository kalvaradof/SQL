Parte 1
-- Crear una base de datos con nombre “Posts”.
CREATE DATABASE Posts;
\c posts;

-- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción.
-- SERIAL PRIMARY KEY LE DA UN CORRELATIVO A LOS "INSERT" POR LO QUE NO SE DEBE NOMBRAR
CREATE TABLE posts (id SERIAL PRIMARY KEY nombre_usuario VARCHAR(50) NOT NULL, fecha_creacion DATE NOT NULL, contenido VARCHAR(50) NOT NULL, descripcion VARCHAR(300) NOT NULL);
-- PRIMARY KEY tiene x defecto el NOT NULL
-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion) VALUES ('Pamela', '2022-04-05', 'contenido', 'observaciones blah blah');
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion) VALUES ('Pamela', '2021-08-11', 'otro contenido', 'observaciones blah blah blah');
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion) VALUES ('Carlos', '2022-07-10', 'otro contenido', 'observaciones blah blah blah');
--  Modificar la tabla post, agregando la columna título.
ALTER TABLE post ADD title VARCHAR(45);

-- Agregar título a las publicaciones ya ingresadas.
UPDATE posts SET titulo='ejemplo titulo1' WHERE id=1;
UPDATE posts SET titulo='ejemplo titulo2' WHERE id=2;
UPDATE posts SET titulo='ejemplo titulo3' WHERE id=3;

-- Insertar 2 post para el usuario "Pedro".
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Pedro', '2022-02-13', 'otro contenido', 'observaciones blah blah blah', 'ejemplo titulo 4');
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Pedro', '2022-06-15', 'otro contenido', 'observaciones blah blah blah', 'ejemplo titulo 5');

-- Eliminar el post de Carlos.
DELETE FROM post WHERE id=3;

-- Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Carlos', '2022-04-09', 'contenido', 'observaciones blah blah blah', 'ejemplo titulo 6');

Parte 2
-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
CREATE TABLE Comentarios (id SERIAL PRIMARY KEY, post_id INT NOT NULL, fecha_creacion DATE NOT NULL, hora_creacion TIME NOT NULL, contenido VARCHAR(50) NOT NULL, FOREIGN KEY(post_id) REFERENCES post(id))

-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (1, '2022-02-13', '12:30:50', 'ejemplo comentario 1');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (2, '2022-02-13', '22:35:54', 'ejemplo comentario 2');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (6, '2022-02-13', '23:02:08', 'ejemplo comentario 1');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (6, '2022-02-13', '21:20:05', 'ejemplo comentario 2');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (6, '2022-02-13', '14:15:13','ejemplo comentario 3');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (6, '2022-02-13', '05:09:18', 'ejemplo comentario 4');

-- Crear un nuevo post para "Margarita".
INSERT INTO post(post_id, fecha_creacion, contenido, descripcion, titulo) VALUES ('Margarita', '1995-02-28', 'Ejemplo de contenido Margarita', 'Ejemplo de descripcion Margarita', 'Titulo Margarita');

-- Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (7, '2023-05-13', '07:09:19','ejemplo comentario 1');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (7, '2020-06-24', '03:06:28', 'ejemplo comentario 2');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (7, '2018-07-31', '20:59:17', 'ejemplo comentario 3');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (7, '2017-10-23', '16:45:18', 'ejemplo comentario 4');
INSERT INTO comentarios (post_id, fecha_creacion, hora_creacion, contenido) VALUES (7, '2015-12-30', '08:28:38', 'ejemplo comentario 5');

-- mostrar tabla
\dt;