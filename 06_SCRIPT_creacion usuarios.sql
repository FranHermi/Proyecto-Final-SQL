use productos;

CREATE USER IF NOT EXISTS 'user01@localhost' IDENTIFIED by 'user01'; -- define al usuario con el nombre "user01" y dominio "localhost" con contraseña "user01"
SHOW GRANTS FOR 'user01'; -- muestra los derechos del 'user01' / tiene todos
GRANT SELECT ON *.* TO 'user01@LOCALHOST'; -- le limito a solo lectura (select) para toda la DB
SHOW GRANTS FOR 'user01'; -- vuelvo a mostrar los derechos del 'user01' / solo tiene select

CREATE USER IF NOT EXISTS 'user02@localhost' IDENTIFIED by 'user02'; -- define al usuario con el nombre "user02" y dominio "localhost" con contraseña "user02"
SHOW GRANTS FOR 'user02'; -- muestra los derechos del 'user02' / tiene todos
GRANT SELECT , ALTER , INSERT ON *.* TO 'user02@localhost'; -- le limito a solo lectura (select) para toda la DB
SHOW GRANTS FOR 'user02'; -- vuelvo a mostrar los derechos del 'user02' / solo puede usar leer (select), modificar (alter) e insertar (insert) 

