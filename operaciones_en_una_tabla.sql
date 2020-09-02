-- psql para entrar

-- Crear Base de datos post pero tablas deben ser en plural por convencion.
CREATE DATABASE posts;

--\c posts chequea si fue creada la base de datos. 

--Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,descripción
CREATE TABLE post(id SERIAL PRIMARY KEY, nombre_de_usuario VARCHAR(70), fecha DATE, contenido VARCHAR(100), descripcion VARCHAR(70));
--\d post  para chequear si esta creada la tabla.

--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" 
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion) VALUES('Pamela',   
'2019-04-03', 'holasoypamela','mujer');
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion) VALUES('Carlos',   
'2015-02-08', 'holasoycarlos','hombre');
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion) VALUES('Pamela',   
'2018-02-02', 'holasoypameladenuevo','soymujer');

--Modificar la tabla post, agregando la columna título 
ALTER TABLE post ADD COLUMN titulo VARCHAR(70);

--Agregar título a las publicaciones ya ingresadas
UPDATE post SET titulo= 'este es chilena' WHERE id= 1;
UPDATE post SET titulo= 'esta del peru' WHERE id= 3;
UPDATE post SET titulo= 'este es superchilena' WHERE id= 2; 

--Insertar 2 post para el usuario "Pedro"
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion,titulo) VALUES('Pedro',   
'2020-07-04', 'otom','chileno','rut');
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion,titulo) VALUES('Pedro',   
'2020-07-04', 'otom','chileno','rut');

--Eliminar el post de Carlos
DELETE FROM post WHERE nombre_de_usuario= 'Carlos'

--Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion,titulo) VALUES('Carlos',   
'2019-04-11', 'extranjero','chileno','suizo');


--PARTE 2 ---

--Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts
CREATE TABLE comentarios(id SERIAL PRIMARY KEY, fecha_y_hora_de_creacion TIMESTAMP, contenido VARCHAR(70))
CREATE TABLE comentarios(id SERIAL PRIMARY KEY, fecha_y_hora_de_creacion TIMESTAMP, contenido VARCHAR(70), post_id INT, FOREIGN KEY(post_id) REFERENCES post(id));
ALTER TABLE comentarios ALTER COLUMN post_id SET NOT NULL;

--Crear 2 comentarios para el post de "Pamela"

INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-21 11:30:20','esto es','1');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-22 11:30:21','esto ya es de','3');

-- 4 comentarios para post de "Carlos" 
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:22','asi','6');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:22','asino','6');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:22','asinomas','6');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:22','asisi','6');

--Crear un nuevo post para "Margarita"
INSERT INTO post(nombre_de_usuario, fecha, contenido, descripcion,titulo) VALUES('Margarita','2020-10-12','ops','chilena','nope');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:23','marg','7');

--Ingresar 5 comentarios para el post de Margarita
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:23','don','7');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:23','yap','7');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:23','dale','7');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:23','vamos','7');
INSERT INTO comentarios(fecha_y_hora_de_creacion, contenido, post_id) VALUES('2020-03-18 11:30:23','gracias','7'); 

--fin 