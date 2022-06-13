-- Tipos de columna
SELECT * FROM authors;

DESCRIBE authors;           
            -- ver los tipos de datos
DESC books;

SHOW FULL COLUMNS FROM books;

SELECT * 
FROM clients
WHERE client_id = 4;

-- Para usar \G  En MySQL Ctrl + Alt + Enter -- or  -- Despues de ejecutar ir sobre status en la tabla click derecho click 'Open Value in Viewer'

SELECT name, email, gender 
FROM clients
LIMIT 10;

SELECT name, birthdate
FROM clients
WHERE gender = 'F';

SELECT YEAR(birthdate) FROM clients;

SELECT NOW();                   -- TIEMPO actual
SELECT YEAR(NOW())              -- solo año del tiempo actual

SELECT name, YEAR(NOW()) - YEAR(birthdate) AS age       -- funcion para mostrar la edad 
FROM clients
WHERE gender = 'F';

SELECT * FROM clients WHERE name like '%Saavedra';

SELECT COUNT(*) FROM books;

SELECT T1.C AS quantityBooks, T2.C AS quantityAuthors, T3.C AS quantityClients
FROM (SELECT COUNT(*) AS C  FROM books) AS T1, 
(SELECT COUNT(*)  AS C FROM authors) AS T2,
(SELECT COUNT(*)  AS C FROM clients) AS T3;

-- Listar todos los autores con ID entre 1 y 5 con los filtro mayor y menor igual
SELECT * FROM authors WHERE author_id > 0 AND author_id <= 5;

-- Listar todos los autores con ID entre 1 y 5 con el filtro BETWEEN
SELECT * FROM authors WHERE author_id BETWEEN 1 AND 5;

-- Listar los libros con filtro de author_id entre 1 y 5
SELECT book_id, author_id, title FROM books WHERE author_id BETWEEN 1 AND 5;

-- Listar nombre y titulo de libros mediante el JOIN de las tablas books y authors
SELECT b.book_id, a.name, a.author_id, b.title
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5;

-- Listar transactions con detalle de nombre, titulo y tipo. Con los filtro genero = F y tipo = Vendido.
-- Haciendo join entre transactions, books y clients.
SELECT c.name, b.title, t.type
FROM transactions AS t
JOIN books AS b
    ON t.book_id = b.book_id
JOIN clients AS c
    ON t.client_id = c.client_id
WHERE c.gender = 'F'
    AND t.type = 'sell';

-- Listar transactions con detalle de nombre, titulo, autoor y tipo. Con los filtro genero = M y de tipo = Vendido y Devuelto.
-- Haciendo join entre transactions, books, clients y authors.
SELECT c.name, b.title, a.name, t.type
FROM transactions AS t
JOIN books AS b
    ON t.book_id = b.book_id
JOIN clients AS c
    ON t.client_id = c.client_id
JOIN authors AS a
    ON b.author_id = a.author_id
WHERE c.gender = 'M'
    AND t.type IN ('sell', 'lend');


-- 1. ¿Qué nacionalidades hay?
-- Mediante la clausula DISTINCT trae solo los elementos distintos
SELECT DISTINCT nationality 
FROM authors
ORDER BY 1;

-- 2. ¿Cuántos escritores hay de cada nacionalidad?
-- IS NOT NULL para traer solo los valores diferentes de nulo
-- NOT IN para traer valores que no sean los declarados (RUS y AUT)
SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
	AND nationality NOT IN ('RUS','AUT')
GROUP BY nationality
ORDER BY c_authors DESC, nationality ASC;


----- Agregar precios
UPDATE books 
    SET price = FLOOR(RAND()*(35-10+1))+10
    WHERE book_id between 1 and 198 ;

-- 4. ¿Cuál es el promedio/desviación standard del precio de libros?
SELECT a.nationality,  
    AVG(b.price) AS promedio,      -- promedio 
    STDDEV(b.price) AS std          -- desviacion estandar
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
GROUP BY a.nationality
ORDER BY promedio DESC;

-- 5. ¿Cuál es el promedio/desviación standard del precio de libros por nacionalidad?
-- Agrupar por la columna pivot
SELECT a.nationality,
    COUNT(b.book_id) AS libros,  
    AVG(b.price) AS promedio, 
    STDDEV(b.price) AS std 
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
GROUP BY a.nationality
ORDER BY libros DESC;

-- 6. ¿Cuál es el precio máximo/mínimo de un libro?
SELECT nationality, MAX(price), MIN(price)
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
GROUP BY nationality;

-- 7. ¿cómo quedaría el reporte de préstamos?
-- CONCAT: para concatenar en cadenas de texto.
-- TO_DAYS: recibe un timestamp ó un datetime
SELECT c.name, t.type, b.title, 
    CONCAT(a.name, " (", a.nationality, ")") AS autor,
    TO_DAYS(NOW()) - TO_DAYS(t.created_at)
FROM transactions AS t
LEFT JOIN clients AS c
    ON c.client_id = t.client_id
LEFT JOIN books AS b
    ON b.book_id = t.book_id
LEFT JOIN authors AS a
    ON b.author_id = a.author_id;
SELECT TO_DAYS(NOW())                --trae los días desde el día 0 del año cero hasta hoy.
SELECT TO_DAYS('0000-01-01');        --el día uno

