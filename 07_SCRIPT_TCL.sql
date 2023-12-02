USE PRODUCTOS;
SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT=0;
SELECT @@FOREIGN_KEY_CHECKS;
SET  @@FOREIGN_KEY_CHECKS = 0;

SELECT * FROM GRAFICAS;
START TRANSACTION; -- INICIO LA TRANSACCION
DELETE FROM GRAFICAS WHERE IDGRAF>1; -- ELIMINO TODOS LOS REGISTROS CON PRECIO INFERIOR A 1060
SELECT * FROM GRAFICAS; -- LLAMO A TODOS LOS REGISTROS DE LA TABLA PARA ASEGURARME QUE SE BORRARON

-- ROLLBACK; -- HAGO UN ROLLBACK HASTA ANTES DE BORRAR LOS REGISTROS
-- SELECT * FROM GRAFICAS; -- VERIFICO QUE SE ANULÓ LA SENTENCIA DELETE
COMMIT; -- VERIFICO LA TRANSACCION

START TRANSACTION;
insert into graficas (IDGRAF, modelo, grafpcie, grafhdmi, 
grafdp, medida, stock, precio, graf_idprov) values
(2,'Sapphire Pulse AMD Radeon RX 7900 XTX 24GB GDDR6', 'PCIe 4.0 X 16 LÍNEAS', 2.1, 2.1, '313 x 133,75 x 52,67 mm',
4, 1059.00, 2),
(3,'Sapphire Pulse AMD Radeon RX 7900 XT 20GB GDDR6', 'PCIe 4.0 X 16 LÍNEAS', 2.1, 2.1, '313 x 133,75 x 52,67 mm',
10, 889.90, 1);
SELECT * FROM GRAFICAS; -- LLAMO A TODOS LOS REGISTROS DE LA TABLA PARA ASEGURARME QUE SE INSERTARON
-- ROLLBACK; -- HAGO UN ROLLBACK HASTA ANTES DE INSERTAR LOS REGISTROS
-- SELECT * FROM GRAFICAS; -- VERIFICO QUE SE ANULÓ LA SENTENCIA INSERT
-- COMMIT; -- VERIFICO LA TRANSACCION

-- -----------------------------------------------------------------------------------------
START TRANSACTION;
SELECT * FROM PROCESADORES;
DELETE FROM PROCESADORES WHERE IDCPU>=21;
-- ROLLBACK;
-- COMMIT;
START TRANSACTION; -- INICIO LA TRANSACCION
INSERT INTO PROCESADORES (IDCPU, MODELO, MODELO_GRAFICOS, NUM_CORES_CPU, NUM_THREADS_CPU, BOOST_CLOCK, -- INSERTO EL PRIMER LOTE DE VALORES
BASE_CLOCK, SOLUCION_TERMICA, NUM_CORES_GRAF, TDP_BASE, cpu_idprov) VALUES
(21,'AMD Ryzen 5 7500F','Se requiere tarjeta gráfica',6,12,5.0,3.7,'AMD Wraith Stealth',0,65,1),
(22,'AMD Ryzen™ 9 7940HS','AMD Radeon™ 780M',8,16,5.2,4.0,'Not Included',12,54,1),
(23,'AMD Ryzen™ 7 7840HS','AMD Radeon™ 780M',8,16,5.1,3.8,'Not Included',12,54,1),
(24,'AMD Ryzen™ 5 7640HS','AMD Radeon™ 760M',6,12,5.0,4.3,'Not Included',8,54,1);
SAVEPOINT LOTE01; -- DEFINO EL PRIMER SAVEPOINT
SELECT * FROM PROCESADORES; -- VERIFICO QUE SE CARGARON LOS CAMPOS
INSERT INTO PROCESADORES (IDCPU, MODELO, MODELO_GRAFICOS, NUM_CORES_CPU, NUM_THREADS_CPU, BOOST_CLOCK, -- INSERTO EL SEGUNDO LOTE
BASE_CLOCK, SOLUCION_TERMICA, NUM_CORES_GRAF, TDP_BASE, cpu_idprov) VALUES
(25,'AMD Ryzen™ 5 PRO 7545U','AMD Radeon™ 740M',6,12,4.9,3.2,'Not Included',4,30,1),
(26,'AMD Ryzen™ 7 7840U','AMD Radeon™ 780M',8,16,5.1,3.3,'Not Included',12,28,1),
(27,'AMD Ryzen™ 5 7640U','AMD Radeon™ 760M',6,12,4.9,3.5,'Not Included',8,28,1),
(28,'AMD Ryzen™ 5 7545U','AMD Radeon™ 740M',6,12,4.9,3.2,'Not Included',4,28,1);
SAVEPOINT LOTE02; -- DEFINO EL SEGUNDO SAVEPOINT
SELECT * FROM PROCESADORES; -- VERIFICO QUE SE CARGARON LOS CAMPOS
-- RELEASE LOTE01; -- ELIMINO EL PRIMER SAVEPOINT
-- ROLLBACK TO LOTE01; -- VUELVO AL PRIMER SAVEPOINT, "BORRANDO" LOS DATOS DEL 25 AL 28
-- SELECT * FROM PROCESADORES; -- VERIFICO
COMMIT; -- CONFIRMO LA TRANSACCION