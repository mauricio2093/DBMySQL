INSERT INTO authors(
        author_id,
        `name`,
        nationality
) 
    VALUES(
        '',
        'Juan Rulfo',
        'MEX'
    );

INSERT INTO authors(
        `name`,
        nationality
) 
    VALUES(
        'Gabriel Garcia Marquez',
        'COL'
    );

INSERT INTO authors
    VALUES(
        'Juan Gabriel Vasquez',
        'COL'
    );

INSERT INTO `clients`(`name`, email, birthdate, gender, active) 
VALUES('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
-- ON DUPLICATE KEY IGNORE ALL  Nunca usar no se puede ignorar los errores
ON DUPLICATE KEY UPDATE SET active = VALUES(active)

-- Ver desde la consola con flechas hacia arriba muestra comandos anteriores
