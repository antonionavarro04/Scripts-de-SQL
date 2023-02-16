-- Título, ID y tema de los libros que contengan la palabra "and” en las notas

GO
USE pubs

SELECT title, title_id, type
FROM titles
WHERE notes LIKE '%and%'
