-- Inserta dos libros, escritos por el autor que has insertado antes y publicados por la editorial "Ramona publishers”.

GO

USE pubs

INSERT INTO titles (title_id, title, type, pub_id, price) VALUES
('L1', 'Los 3 Cerditos', 'Infantil', '1756', 10),
('L2', 'Las 48 Leyes del Poder', 'Psicologico', '1756', 19.95)

INSERT INTO titleauthor (au_id, title_id) VALUES
('333-22-4444', 'L1'),
('333-22-4444', 'L2')
