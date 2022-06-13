ALTER table authors add colum birthyear 
INTEGER default 1930 after name;

ALTER table authors 
MODIFY colum birthyear year default 1920 
;

MYSQLDUMP -u "usuario" -p "name de mysql" -d | more >"nombre del archivo que quieres guardar .sql"```
