USE PRODUCTOS;
insert into proveedores (nombre, razon_social, direccion, cif) values
('PcCOMPONENTES', 'YF Networks', 'Alhama de Murcia', 'B73347494'),
('AMD', 'Advanced Micro Devices, Inc', 'Santa Clara, California', 'B86833571');
-- SELECT * FROM PROVEEDORES;
-- ---------------------------------------------
insert into graficas (modelo, grafpcie, grafhdmi, 
grafdp, medida, stock, precio, graf_idprov) values
('ASUS TUF GAMING GEFORCE RTX 4080 ', 'PCIe 4.0 X 16 LÍNEAS', 2.1, 1.4, '348,2 X 150 X 75,6 mm',
5, 1399.90, 1),
('Sapphire Pulse AMD Radeon RX 7900 XTX 24GB GDDR6', 'PCIe 4.0 X 16 LÍNEAS', 2.1, 2.1, '313 x 133,75 x 52,67 mm',
4, 1059.00, 2);
insert into graficas (modelo, grafpcie, grafhdmi, 
grafdp, medida, stock, precio, graf_idprov) values
('Sapphire Pulse AMD Radeon RX 7900 XT 20GB GDDR6', 'PCIe 4.0 X 16 LÍNEAS', 2.1, 2.1, '313 x 133,75 x 52,67 mm',
10, 889.90, 1);
-- SELECT * FROM GRAFICAS;
-- ---------------------------------------------
-- SELECT * FROM PROCESADORES;

INSERT INTO procesadores (MODELO, MODELO_GRAFICOS, NUM_CORES_CPU, NUM_THREADS_CPU, BOOST_CLOCK,
BASE_CLOCK, SOLUCION_TERMICA, NUM_CORES_GRAF, TDP_BASE, cpu_idprov) VALUES
('AMD Ryzen 9 5950X','Se requiere tarjeta gráfica',16,32,4.9,3.4,'Not included',0,105,1),
('AMD Ryzen 9 5900X','Se requiere tarjeta gráfica',12,24,4.8,3.7,'Not included',0,105,1),
('AMD Ryzen 7 5800X3D','Se requiere tarjeta gráfica',8,16,4.5,3.4,'Not included',0,105,1),
('AMD Ryzen 7 5800X','Se requiere tarjeta gráfica',8,16,4.7,3.8,'Not included',0,105,1),
('AMD Ryzen 7 5700X','Se requiere tarjeta gráfica',8,16,4.6,3.4,'Not included',0,65,1),
('AMD Ryzen 5 5600X3D','Se requiere tarjeta gráfica',6,12,4.4,3.3,'Not Included',0,105,1),
('AMD Ryzen 5 5600X','Se requiere tarjeta gráfica ',6,12,4.6,3.7,'AMD Wraith Stealth',0,65,1),
('AMD Ryzen 5 5600','Se requiere tarjeta gráfica',6,12,4.4,3.5,'AMD Wraith Stealth',0,65,1),
('AMD Ryzen 5 5500','Se requiere tarjeta gráfica',6,12,4.2,3.6,'AMD Wraith Stealth',0,65,1),
('AMD Ryzen 5 5500H','AMD Radeon Graphics',4,8,4.2,3.3,'Not Included',6,45,1);
INSERT INTO procesadores (MODELO, MODELO_GRAFICOS, NUM_CORES_CPU, NUM_THREADS_CPU, BOOST_CLOCK,
BASE_CLOCK, SOLUCION_TERMICA, NUM_CORES_GRAF, TDP_BASE, cpu_idprov) VALUES
('AMD Ryzen 9 7950X3D','AMD Radeon Graphics',16,32,5.7,4.2,'Not Included',2,120,1),
('AMD Ryzen 9 7950X','AMD Radeon Graphics',16,32,5.7,4.5,'Not included',2,170,1),
('AMD Ryzen 9 7900X3D','AMD Radeon Graphics',12,24,5.6,4.4,'Not included',2,120,1),
('AMD Ryzen 9 7900X','AMD Radeon Graphics',12,24,5.6,4.7,'Not included',2,170,1),
('AMD Ryzen 9 7900','AMD Radeon Graphics',12,24,5.4,3.7,'AMD Wraith Prism',2,65,1),
('AMD Ryzen 7 7800X3D','AMD Radeon Graphics',8,16,5.0,4.2,'Not included',2,120,1),
('AMD Ryzen 7 7700X','AMD Radeon Graphics',8,16,5.4,4.5,'Not included',2,105,1),
('AMD Ryzen 7 7700','AMD Radeon Graphics',8,16,5.3,3.8,'AMD Wraith Prism',2,65,1),
('AMD Ryzen 5 7600X','AMD Radeon Graphics',6,12,5.3,4.7,'Not included',2,105,1),
('AMD Ryzen 5 7600','AMD Radeon Graphics',6,12,5.1,3.8,'AMD Wraith Stealth',2,65,1),
('AMD Ryzen 5 7500F','Se requiere tarjeta gráfica',6,12,5.0,3.7,'AMD Wraith Stealth',0,65,1);
INSERT INTO PROCESADORES (MODELO, MODELO_GRAFICOS, NUM_CORES_CPU, NUM_THREADS_CPU, BOOST_CLOCK,
BASE_CLOCK, SOLUCION_TERMICA, NUM_CORES_GRAF, TDP_BASE, cpu_idprov) VALUES
('AMD Ryzen™ 9 7940HS','AMD Radeon™ 780M',8,16,5.2,4.0,'Not Included',12,54,1),
('AMD Ryzen™ 7 7840HS','AMD Radeon™ 780M',8,16,5.1,3.8,'Not Included',12,54,1),
('AMD Ryzen™ 5 7640HS','AMD Radeon™ 760M',6,12,5.0,4.3,'Not Included',8,54,1),
('AMD Ryzen™ 5 PRO 7545U','AMD Radeon™ 740M',6,12,4.9,3.2,'Not Included',4,30,1),
('AMD Ryzen™ 7 7840U','AMD Radeon™ 780M',8,16,5.1,3.3,'Not Included',12,28,1),
('AMD Ryzen™ 5 7640U','AMD Radeon™ 760M',6,12,4.9,3.5,'Not Included',8,28,1),
('AMD Ryzen™ 5 7545U','AMD Radeon™ 740M',6,12,4.9,3.2,'Not Included',4,28,1);

-- ----------------------------------------------------------- motherboards -- -----------------------------------------------------------
insert into motherboard (modelo, mothersocket, chipset, mother_ramchannels, precio, mother_idprov) values
('MSI A Pro Max ATX', 'AM4', 'B450M', 2, 49.5785, 1),
('Gigabyte H ATX', 'AM4', 'A520M', 2, 55.53719, 1),
('MSI MPG Gaming Plus ATX', 'AM4', 'B550', 4, 99.0909, 1),
('Gigabyte Aorus Elite ATX', 'AM4', 'X570', 4, 203.3140, 1),
('ASUS TUF GAMING PRO WIFI ATX', 'AM5', 'A620', 4, 206.8429, 1),
('Gigabyte Gaming X AX ATX', 'AM5', 'B650', 4, 176.851239, 1),
('ASUS TUF Gaming Plus Wifi ATX', 'AM5', 'X670E', 4, 231.3223, 1);

-- ----------------------------------------------------------- ram -- -----------------------------------------------------------
insert into ram (modelo, ramddr, gb, ecc, rammhz, precio, ram_idprov) values
('Kingston FURY Beast CL16', 4, 8, 'No', 3200, 18.173559, 1),
('Corsair VENGEANCE LPX CL14', 4, 8, 'No', '2400', 17.3471, 1),
('Kingston FURY Beast CL16', 4, 16, 'No', 3200, 35.5289, 1),
('Corsair VENGEANCE LPX CL18', 4, 16, 'No', '3600', 42.8512, 1),
('Kingston FURY Beast CL18', 4, 32, 'No', 3600, 77.53719, 1),
('Patriot VIPER Steel CL18', 4, 32, 'No', '3600', 74.4214, 1),
('Kingston FURY Beast CL38', 5, 8, 'No', '4800', 34.9008, 1),
('Crucial PC5-38400 CL40', 5, 8, 'No', '4800', 23.1322, 1),
('Kingston FURY Beast CL40', 5, 16, 'No', '5200', 51.2314, 1),
('Corsair VENGEANCE CL40', 5, 16, 'No', '5200', 52.9504, 1),
('Kingston FURY Beast CL40', 5, 32, 'No', '5200', 94.0909, 1),
('Kingston FURY Beast CL40', 5, 32, 'No', '5200', 94.0909, 1);