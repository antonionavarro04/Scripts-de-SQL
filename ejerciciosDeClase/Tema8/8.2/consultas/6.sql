-- 6. Número de autores que han escrito cada libro (title_id y numero de autores).
USE pubs

SELECT title_id AS 'Título', COUNT(*) AS 'Número de Autores'
FROM titleauthor
GROUP BY title_id
ORDER BY COUNT(*) DESC

GO
