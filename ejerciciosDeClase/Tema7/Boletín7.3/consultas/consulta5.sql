-- Título, precio, ID de los libros que traten sobre psicología o negocios y cuesten entre 10 y 20 dólares.

GO
USE pubs

SELECT title, price, title_id
FROM titles
WHERE (type LIKE '%psych%' OR type LIKE '%business%') AND price BETWEEN 10 AND 20
