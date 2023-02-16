-- Crea una nueva editorial (publihers) con ID 9908, nombre Mostachon Books y sede en Utrera.

GO

USE pubs

INSERT INTO publishers (pub_id, pub_name, city, country) VALUES
('9908', 'Mostachon Books', 'Utrera', 'Spain')
