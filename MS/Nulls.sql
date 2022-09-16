CREATE TABLE ej_null(
  nombre varchar(50),
  id int,
  dt int
)

INSERT INTO ej_null(nombre) VALUES ('abababa')

--IF ID IS NULL RETURN SECOND PARAM
SELECT ISNULL(id, 999) AS id_table FROM ej_null

--ISNULL 'NESTED'
SELECT coalesce(id, dt, 120) FROM ej_null

--RETURNS NULL IF NOMBRE = SECOND PARAM
SELECT nullif(nombre, 'aaaaa') AS null_si FROM ej_null ORDER BY nombre

SELECT * FROM ej_null
