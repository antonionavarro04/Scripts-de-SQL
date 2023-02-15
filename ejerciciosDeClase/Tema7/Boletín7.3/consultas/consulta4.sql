-- Nombre y ciudad de las editoriales (publishers) de los Estados Unidos que no estén en California ni en Texas

GO
USE pubs

SELECT pub_name, city
FROM publishers
WHERE country = 'USA' AND city NOT IN ('California', 'Texas')
