DELETE FROM clients
WHERE id_clients = 8;

DELETE FROM clientes
WHERE (id = 3 = 4 = 5);

-- DELETE: borra el registro.
-- Adicionalmente filtrar con WHERE por id y limitarlo.
DELETE FROM authors WHERE author_id = 161 LIMIT 1;

-- UPDATE: actualizar datos de una tupla existente.
-- También se debe filtrar con WHERE
UPDATE clients
SET active = 0
WHERE client_id = 80
LIMIT 1;

UPDATE clients
SET active = 0
WHERE client_id IN (1,6,8,27,90)
    OR NAME like '%Lopez%';


-- TRUNCATE: Borra todo el contenido de una tabla
TRUNCATE transactions;
select client_id, name from clients order by rand() limit 10; en está sentencia RAND() permite ordenar de forma aleatoria, no recomendado hacerlo en producción.
select client_id, name from clients where active <> 1; en donde <> significa que es diferente

