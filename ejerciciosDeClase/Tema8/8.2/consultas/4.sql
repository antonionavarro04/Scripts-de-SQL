-- 4. Número de editoriales en cada país. Incluye el país.
USE pubs

SELECT country AS 'País', COUNT(*) AS 'Número de Editoriales'
FROM publishers
GROUP BY country
ORDER BY COUNT(*) DESC

GO
