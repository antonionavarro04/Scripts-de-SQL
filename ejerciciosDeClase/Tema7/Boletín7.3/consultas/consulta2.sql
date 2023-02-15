-- ID, descripción y nivel máximo y mínimo de los puestos de trabajo (jobs) que pueden tener un nivel 110.
GO
USE pubs

SELECT *
FROM jobs
WHERE min_lvl <= 110 AND max_lvl >= 110
