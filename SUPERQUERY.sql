-- Super Querys

--Cambiamos ENG por GBR en la nacionalidad de los autores
SELECT DISTINCT nationality from authors;

UPDATE authors set nationality = 'GBR' WHERE nationality = 'ENG';

SELECT count(book_id), sum(1) from books;

--Colocamos operaciones en las columnas
SELECT sum(price) from books WHERE sellable =1;
SELECT sum(price*copies) from books WHERE sellable =1;
SELECT sellable, sum(price*copies) from books GROUP BY sellable;

SELECT count(book_id), sum(if(year < 1950, 1, 0)) as '<1950' from books;
SELECT count(book_id) from books WHERE year < 1950;

SELECT count(book_id), 
    sum(if(year < 1950, 1, 0)) as '<1950', 
    sum(if(year < 1950, 0, 1)) as '>1950' 
FROM books;

SELECT count(book_id), 
    sum(if(year < 1950, 1, 0)) as '<1950', 
    sum(if(year >= 1950 and year < 1990, 1, 0)) as '<1990',
    sum(if(year >= 1990 and year < 2000, 1, 0)) as '<2000',
    sum(if(year >= 2000, 1, 0)) as '<hoy' 
FROM books;

SELECT nationality, count(book_id), 
    sum(if(year < 1950, 1, 0)) as '<1950', 
    sum(if(year >= 1950 and year < 1990, 1, 0)) as '<1990',
    sum(if(year >= 1990 and year < 2000, 1, 0)) as '<2000',
    sum(if(year >= 2000, 1, 0)) as '<hoy' 
FROM books as b
JOIN authors as a
    ON a.author_id = b.author_id
GROUP BY a.nationality
HAVING a.nationality IS NOT NULL;```
