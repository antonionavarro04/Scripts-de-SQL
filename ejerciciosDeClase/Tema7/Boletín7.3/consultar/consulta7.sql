-- Nombre completo y dirección completa de todos los autores cuyo apellido empieza por D, G o S.

GO
USE pubs

SELECT au_fname + ' ' + au_lname AS 'Full Name', address
FROM authors
WHERE au_lname LIKE '[DGS]%'
