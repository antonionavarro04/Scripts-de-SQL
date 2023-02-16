-- Cambia el nombre de la editorial con sede en Alemania para que se llame "Machen Wücher" y traslasde su sede a Stuttgart

GO

USE pubs

BEGIN TRANSACTION [UPDATE_OF_PUBLISHERS]

UPDATE publishers
SET pub_name = 'Machen Wücher'
WHERE country = 'Germany'

UPDATE publishers
SET city = 'Stuttgart'
WHERE country = 'Germany'

SELECT * FROM publishers
WHERE country = 'Germany'

WAITFOR DELAY '00:00:10'

COMMIT TRANSACTION [UPDATE_OF_PUBLISHERS]

ROLLBACK TRANSACTION [UPDATE_OF_PUBLISHERS]
