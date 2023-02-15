-- Nombre completo (nombre y apellido) y dirección completa de todos los autores que no viven en California ni en Oregón.

GO
USE pubs

SELECT au_fname + ' ' + au_lname AS 'Full Name', address
FROM authors
WHERE state NOT IN ('CA', 'OR')
