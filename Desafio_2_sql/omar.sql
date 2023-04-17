DROP DATABASE IF EXISTS "desafio_2_sergio_araya_ghiani_999";
CREATE DATABASE "desafio_2_sergio_araya_ghiani_999";
\c "desafio_2_sergio_araya_ghiani_999"

CREATE TABLE IF NOT EXISTS inscritos(cantidad INT, fecha DATE, fuente VARCHAR);
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );

-- Cantidad de registros
SELECT COUNT(*) AS total_registros FROM inscritos;

-- Total de inscritos
SELECT SUM(cantidad) AS total_inscritos from inscritos;

-- Registros de mayor antiguedad
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

-- Inscritos por día
SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos GROUP BY fecha ORDER BY fecha;

-- Inscritos por fuente
SELECT fuente, SUM(cantidad) AS inscritos_por_fuente FROM inscritos GROUP BY fuente;

-- Día que se inscribieron mayor cantidad de personas y cantidad
SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos GROUP BY fecha ORDER BY inscritos_por_dia DESC LIMIT 1; 

-- Día que se inscribieron la mayor cantidad de personas por blog y cuantidad
SELECT * FROM inscritos WHERE fuente = 'Blog' ORDER BY cantidad DESC LIMIT 1;

-- Promedio de personas inscritas por día
SELECT SUM(cantidad) / COUNT(DISTINCT(fecha)) AS promedio_inscritos_por_dia FROM inscritos;

-- Días que se inscribieron mas de cincuenta personas
SELECT fecha, SUM(cantidad) AS inscritos FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50 ORDER BY fecha;

-- Personas se inscribieron en promedio a partir del tercer día
SELECT SUM(cantidad) / COUNT(DISTINCT(fecha)) AS promedio_inscritos_por_dia FROM inscritos WHERE fecha >= '2021-03-01';

