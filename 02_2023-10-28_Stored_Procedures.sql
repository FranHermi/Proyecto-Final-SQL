USE PRODUCTOS;
-- drop procedure if exists SP_INSERT_PROV;
DELIMITER //
CREATE PROCEDURE SP_INSERT_PROV (IN NOMBRE_n CHAR(50), IN RAZON_SOCIAL_n CHAR(50) ,
                                 IN DIRECCION_n CHAR(50) , IN CIF_n CHAR(20)) -- damos nombre a los parámetros que cargaremos con los datos que se insertarán en nuestra tabla proveedores
BEGIN
	SET @ConteoProveedor = (select count(*) from proveedores where CIF = CIF_n); -- primero hacemos una busqueda de proveedores que coincidad con el cif ingresado como parametro
    
	if @ConteoProveedor > 0 then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'EL REGISTRO YA EXISTE'; -- si el counteo da mayor a cero (es decir que existen proveedores con ek mismo cif) no nos deja crear el nuevo campo
	ELSEIF NOMBRE_n = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: NO SE PUDO CREAR EL PRODUCTO'; -- si le damos un valor vacio no nos deja ingresarlo
	ELSEIF RAZON_SOCIAL_n = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: NO SE PUDO CREAR EL PRODUCTO'; -- si le damos un valor vacio no nos deja ingresarlo
	ELSEIF DIRECCION_n = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: NO SE PUDO CREAR EL PRODUCTO'; -- si le damos un valor vacio no nos deja ingresarlo
	ELSEIF CIF_n = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: NO SE PUDO CREAR EL PRODUCTO'; -- si le damos un valor vacio no nos deja ingresarlo
	else
		insert into PROVEEDORES (NOMBRE , RAZON_SOCIAL , DIRECCION , CIF)
        values (NOMBRE_n , RAZON_SOCIAL_n , DIRECCION_n , CIF_n);
	END IF;
END //
DELIMITER ;
-- select * from proveedores;
CALL SP_INSERT_PROV('ASUS' , 'ASUSTeK Computer Inc' , 'DISTRITO BEITOU, TAIPEI, TAIWAN' , 'B63550222');
CALL SP_INSERT_PROV('GIGABYTE' , 'GIGABYTE TECHNOLOGY' , 'NUEVO TAIPEI, TAIWAN' , 'B65161242');
/*
CALL SP_INSERT_PROV('' , 'GIGABYTE TECHNOLOGY' , 'NUEVO TAIPEI, TAIWAN' , 'B65161242'); -- pruebas de que no deja ingresar campos vacios
CALL SP_INSERT_PROV('GIGABYTE' , '' , 'NUEVO TAIPEI, TAIWAN' , 'B65161242');
CALL SP_INSERT_PROV('GIGABYTE' , 'GIGABYTE TECHNOLOGY' , '' , 'B65161242');
CALL SP_INSERT_PROV('GIGABYTE' , 'GIGABYTE TECHNOLOGY' , 'NUEVO TAIPEI, TAIWAN' , '');
*/
-- DROP PROCEDURE SP_INSERT_PROV;
-- delete proveedores from proveedores where idprov=6;

SELECT * FROM PROVEEDORES;
-- drop procedure if exists SP_Graf_maxPrice;
DELIMITER //
CREATE PROCEDURE SP_Graf_maxPrice (IN MAXprecio float)
BEGIN
	 select p.nombre,
     count(g.graf_idprov) as 'Cantidad Graficas por Proveedor',
     max(g.precio) as 'Mayor precio Gráficas'
     from graficas as g
     join proveedores as p
     group by p.nombre
     having max(g.precio) > MAXprecio -- este bloque busca las graficas con un precio mayor al buscado (MAXprecio)
     ;
END //
DELIMITER ;
call SP_Graf_maxPrice(800);
call SP_Graf_maxPrice(1400);

-- -------------------------------------------------- SP de compra para ram -- ----------------------------------------------------
-- DROP PROCEDURE IF EXISTS SP_COMPRA_ram;
DELIMITER //
CREATE PROCEDURE SP_COMPRA_ram (IN idram_compra int , IN cantidad_compra float ,
										 IN precio_compra float, IN descuento_compra float) -- declaro los datos de entrada para la compra id, cantidad, precio y descuento
BEGIN -- ram_idprov
	DECLARE preciofinal_compra float; -- declaro la variable con el precio_compra tras aplicarle el descuento_compra
    DECLARE modelo_compra varchar(256);  -- declaro la variable con el modelo correspondiente al idram_compra
    DECLARE idprov_compra0 INT; -- declaro la variable que guarda el id del proveedor del producto
    SET preciofinal_compra = precio_compra - (descuento_compra / 100 * precio_compra);
    SET modelo_compra = (select modelo from ram where idram = idram_compra);
    SET idprov_compra0 = (SELECT ram_idprov FROM ram WHERE idram = idram_compra);
    
    
		INSERT INTO compras (numero_compra , idprov_com , idproducto, producto, cant_com, precio , descuento, precio_final)
		VALUES ( concat(year(curdate()), month(curdate()), day(curdate()), '/', hour(curtime()), minute(curtime()), second(curtime())) , 
        idprov_compra0, idram_compra , modelo_compra, cantidad_compra, precio_compra, descuento_compra, preciofinal_compra); -- inserto los datos en la tabla 'compras' con un numero de compra unico que se relaciona a la date y time del momento

    UPDATE ram SET stock = stock + cantidad_compra WHERE idram = idram_compra; -- modifico el stock sumandole el que se compró
    UPDATE ram SET precio = preciofinal_compra * 1.3 WHERE idram = idram_compra; -- le dejamos un margen del 30% sobre el precio de compra

	SELECT * FROM ram WHERE idram = idram_compra; -- llamo todos los datos de este producto para que se vean los cambios
END //
DELIMITER ;
-- -------------------------------------------------- SP de compra para prcesadores -- ----------------------------------------------------

-- DROP PROCEDURE IF EXISTS SP_COMPRA_procesadores;
DELIMITER //
CREATE PROCEDURE SP_COMPRA_procesadores (IN idcpu_compra int , IN cantidad_compra float ,
										 IN precio_compra float, IN descuento_compra float)
BEGIN
	DECLARE preciofinal_compra float;
    DECLARE modelo_compra varchar(256);
    DECLARE idprov_compra1 INT;
    SET preciofinal_compra = precio_compra - (descuento_compra / 100 * precio_compra);
    SET modelo_compra = (select modelo from procesadores where idcpu = idcpu_compra);
    SET idprov_compra1 = (SELECT cpu_idprov FROM procesadores WHERE idcpu = idcpu_compra);
    
    
		INSERT INTO compras (numero_compra , idprov_com , idproducto, producto, cant_com, precio , descuento, precio_final)
		VALUES ( concat(year(curdate()), month(curdate()), day(curdate()), '/', hour(curtime()), minute(curtime()), second(curtime())) , 
        idprov_compra1, idcpu_compra , modelo_compra, cantidad_compra, precio_compra, descuento_compra, preciofinal_compra);

    UPDATE PROCESADORES SET stock = stock + cantidad_compra WHERE idcpu = idcpu_compra;
    UPDATE PROCESADORES SET precio = preciofinal_compra * 1.3 WHERE idcpu = idcpu_compra; -- le dejamos un margen del 30% sobre el precio de compra

	SELECT * FROM procesadores WHERE idcpu = idcpu_compra;
END //
DELIMITER ;
/*
SELECT * FROM log_auditoria_cpu1;
SELECT * FROM log_auditoria_cpu2;
select * from compras;*/
-- ------------------------------------------------------- SP de compra para graficas -- ----------------------------------------------
-- DROP PROCEDURE IF EXISTS SP_COMPRA_graficas;
DELIMITER //
CREATE PROCEDURE SP_COMPRA_graficas (IN idgraf_compra int , IN cantidad_compra float ,
										 IN precio_compra float, IN descuento_compra float)
BEGIN
	DECLARE preciofinal_compra float;
    DECLARE modelo_compra varchar(256);
    DECLARE idprov_compra2 INT;
    SET preciofinal_compra = precio_compra - (descuento_compra / 100 * precio_compra);
    SET modelo_compra = (select modelo from graficas where idgraf = idgraf_compra);
    SET idprov_compra2 = (SELECT graf_idprov FROM graficas WHERE idgraf = idgraf_compra);
    
    
		INSERT INTO compras (numero_compra , idprov_com , idproducto, producto, cant_com, precio , descuento, precio_final)
		VALUES ( concat(year(curdate()), month(curdate()), day(curdate()), '/', hour(curtime()), minute(curtime()), second(curtime())) , 
        idprov_compra2, idgraf_compra , modelo_compra, cantidad_compra, precio_compra, descuento_compra, preciofinal_compra);

    UPDATE graficas SET stock = stock + cantidad_compra WHERE idgraf = idgraf_compra;
    UPDATE graficas SET precio = preciofinal_compra * 1.3 WHERE idgraf = idgraf_compra; -- le dejamos un margen del 30% sobre el precio de compra

	SELECT * FROM graficas WHERE idgraf = idgraf_compra;
END //
DELIMITER ;
/*
SELECT * FROM log_auditoria_graf1;
SELECT * FROM log_auditoria_graf2;
select * from compras;*/
-- ------------------------------------------------------- SP de compra para motherboard -- ----------------------------------------------
-- DROP PROCEDURE IF EXISTS SP_COMPRA_motherboards;
DELIMITER //
CREATE PROCEDURE SP_COMPRA_motherboards (IN idmother_compra int , IN cantidad_compra float ,
										 IN precio_compra float, IN descuento_compra float)
BEGIN
	DECLARE preciofinal_compra float;
    DECLARE modelo_compra varchar(256);
    DECLARE idprov_compra3 INT;
    SET preciofinal_compra = precio_compra - (descuento_compra / 100 * precio_compra);
    SET modelo_compra = (select modelo from motherboard where idmother = idmother_compra);
    SET idprov_compra3 = (SELECT mother_idprov FROM motherboard WHERE idmother = idmother_compra);
    
    
		INSERT INTO compras (numero_compra , idprov_com , idproducto, producto, cant_com, precio , descuento, precio_final)
		VALUES ( concat(year(curdate()), month(curdate()), day(curdate()), '/', hour(curtime()), minute(curtime()), second(curtime())) , 
        idprov_compra3, idmother_compra , modelo_compra, cantidad_compra, precio_compra, descuento_compra, preciofinal_compra);

    UPDATE motherboard SET stock = stock + cantidad_compra WHERE idmother = idmother_compra;
    UPDATE motherboard SET precio = preciofinal_compra * 1.3 WHERE idmother = idmother_compra; -- le dejamos un margen del 30% sobre el precio de compra

	SELECT * FROM motherboard WHERE idmother = idmother_compra;
END //
DELIMITER ;
