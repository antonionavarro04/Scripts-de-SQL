USE EjercicioCheck
ALTER TABLE CriaturasExtrañas
ADD CONSTRAINT CK_Imaginacion CHECK (Historieta <> (CAST(ID AS VARCHAR(4)) + 'Pecadores' + CAST(NumeroPie AS VARCHAR(2))))