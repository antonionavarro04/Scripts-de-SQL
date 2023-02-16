-- Modifica la tabla jobs para que el nivel mínimo sea 90.

USE pubs

UPDATE jobs
SET min_lvl = 90
WHERE min_lvl < 90
