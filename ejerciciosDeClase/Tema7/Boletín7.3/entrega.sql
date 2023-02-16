-- Título, precio y notas de los libros (titles) que tratan de cocina, ordenados de mayor a menor precio.

GO
USE pubs

SELECT title, price, notes
FROM titles
WHERE type LIKE '%cook'
ORDER BY price DESC

-- ID, descripción y nivel máximo y mínimo de los puestos de trabajo (jobs) que pueden tener un nivel 110.
GO
USE pubs

SELECT *
FROM jobs
WHERE min_lvl <= 110 AND max_lvl >= 110

-- Título, ID y tema de los libros que contengan la palabra "and” en las notas

GO
USE pubs

SELECT title, title_id, type
FROM titles
WHERE notes LIKE '%and%'

-- Nombre y ciudad de las editoriales (publishers) de los Estados Unidos que no estén en California ni en Texas

GO
USE pubs

SELECT pub_name, city
FROM publishers
WHERE country = 'USA' AND city NOT IN ('California', 'Texas')

-- Título, precio, ID de los libros que traten sobre psicología o negocios y cuesten entre 10 y 20 dólares.

GO
USE pubs

SELECT title, price, title_id
FROM titles
WHERE (type LIKE '%psych%' OR type LIKE '%business%') AND price BETWEEN 10 AND 20

-- Nombre completo (nombre y apellido) y dirección completa de todos los autores que no viven en California ni en Oregón.

GO
USE pubs

SELECT au_fname + ' ' + au_lname AS 'Full Name', address
FROM authors
WHERE state NOT IN ('CA', 'OR')

-- Nombre completo y dirección completa de todos los autores cuyo apellido empieza por D, G o S.

GO
USE pubs

SELECT au_fname + ' ' + au_lname AS 'Full Name', address
FROM authors
WHERE au_lname LIKE '[DGS]%'

-- ID, nivel y nombre completo de todos los empleados con un nivel inferior a 100, ordenado alfabéticamente

GO
USE pubs

SELECT emp_id, job_lvl, fname + ' ' + lname AS 'Full Name'
FROM employee
WHERE job_lvl < 100
ORDER BY fname, lname

-- Inserta un nuevo autor.

GO

USE pubs

INSERT INTO authors VALUES
('333-22-4444', 'Jimenez', 'David', '123456789012', 'Calle 2', 'Los Angeles', 'CA', '41927', 1)

-- Inserta dos libros, escritos por el autor que has insertado antes y publicados por la editorial "Ramona publishers”.

GO

USE pubs

INSERT INTO titles (title_id, title, type, pub_id, price) VALUES
('L1', 'Los 3 Cerditos', 'Infantil', '1756', 10),
('L2', 'Las 48 Leyes del Poder', 'Psicologico', '1756', 19.95)

INSERT INTO titleauthor (au_id, title_id) VALUES
('333-22-4444', 'L1'),
('333-22-4444', 'L2')

-- Modifica la tabla jobs para que el nivel mínimo sea 90.

USE pubs

UPDATE jobs
SET min_lvl = 90
WHERE min_lvl < 90

-- Crea una nueva editorial (publihers) con ID 9908, nombre Mostachon Books y sede en Utrera.

GO

USE pubs

INSERT INTO publishers (pub_id, pub_name, city, country) VALUES
('9908', 'Mostachon Books', 'Utrera', 'Spain')

-- Cambia el nombre de la editorial con sede en Alemania para que se llame "Machen Wücher" y traslasde su sede a Stuttgart

GO

USE pubs

BEGIN TRANSACTION [UPDATE_OF_PUBLISHERS]

UPDATE publishers
SET pub_name = 'Machen Wücher'
WHERE country = 'Germany'

UPDATE publishers
SET city = 'Stuttgart'
WHERE country = 'Germany'

SELECT * FROM publishers
WHERE country = 'Germany'

WAITFOR DELAY '00:00:10'

COMMIT TRANSACTION [UPDATE_OF_PUBLISHERS]

ROLLBACK TRANSACTION [UPDATE_OF_PUBLISHERS]
