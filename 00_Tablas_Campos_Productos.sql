DROP SCHEMA IF EXISTS productos;
CREATE SCHEMA IF NOT EXISTS  productos; 
USE productos;

create table if not exists proveedores(
idprov INT not null auto_increment ,
nombre VARCHAR (50) ,
razon_social VARCHAR (50) ,
direccion VARCHAR (50) ,
cif varchar (50) ,
cuil int ,
PRIMARY KEY (idprov)
);

-- drop table if exists compras;
create table if not exists compras(
idcompra int not null auto_increment,
numero_compra varchar(20) not null,
idprov_com int not null,
idproducto int not null,
producto varchar(100) not null,
cant_com float not null default '0',
precio float not null default '0',
descuento float not null default '0',
precio_final float not null default '0',
PRIMARY KEY (idcompra)
);
-- drop table if exists usuarios;
create table if not exists usuarios(
iduser int not null auto_increment,
dni int not null,
complete_name varchar(50),
mail varchar(50),
tarjeta int,
PRIMARY KEY (iduser)
);
-- drop table if exists ventas;
create table if not exists ventas(
idventa int not null auto_increment,
numero_venta int not null,
iduser_vent int not null,
cant_vent float not null default '0',
precio float not null default '0',
descuento float not null default '0',
precio_final float not null default '0',
PRIMARY KEY (idventa)
);

create table if not exists graficas(
idgraf INT not null auto_increment,
modelo VARCHAR (50) ,
grafpcie VARCHAR (50) ,
grafhdmi float ,
grafdp FLOAT ,
medida VARCHAR (50) ,
fecha date ,
stock int default '0',
precio VARCHAR (50) ,
moneda varchar (10) default '€',
graf_idprov int ,
PRIMARY KEY (idgraf)
);

create table if not exists procesadores(
idcpu INT not null auto_increment ,
MODELO VARCHAR (256) ,
MODELO_GRAFICOS VARCHAR (256) ,
NUM_CORES_CPU int ,
NUM_THREADS_CPU int ,
BOOST_CLOCK float ,
BASE_CLOCK float ,
SOLUCION_TERMICA VARCHAR (128) ,
NUM_CORES_GRAF INT ,
TDP_BASE FLOAT ,
MEDIDA_TDP VARCHAR (5) DEFAULT 'Watts' ,
cpusocket VARCHAR (50) default 'AM4',
fecha date,
stock int DEFAULT 0 ,
precio float ,
moneda varchar (10) default '€' ,
cpu_idprov int ,
PRIMARY KEY (idcpu)
);
-- drop table if exists motherboard;
create table if not exists motherboard(
idmother INT not null auto_increment ,
modelo VARCHAR (50) ,
mothersocket VARCHAR (50) ,
chipset varchar(8),
vrms int ,
mother_ramchannels int ,
motherddr int ,
pcie1 VARCHAR (50) ,
pcie2 VARCHAR (50) ,
pcie3 VARCHAR (50) ,
fecha date ,
stock int default '0',
precio VARCHAR (50) ,
moneda varchar (10) default '€' ,
mother_idprov int ,
PRIMARY KEY (idmother)
);
-- drop table if exists ram;
create table if not exists ram(
idram INT not null auto_increment ,
modelo VARCHAR (50) ,
ramddr int ,
gb float,
ecc VARCHAR (8) ,
rammhz float ,
fecha date ,
stock int default '0',
precio float ,
moneda varchar (10) default '€' ,
ram_idprov int ,
PRIMARY KEY (idram)
);

alter table compras
add constraint fk_compras_idprov foreign key (idprov_com) 
references proveedores(idprov) ON UPDATE CASCADE;

alter table ventas
add constraint fk_ventas_iduser foreign key (iduser_vent) 
references usuarios(iduser) ON UPDATE CASCADE;

alter table graficas
add constraint fk_graf_idprov foreign key (graf_idprov) 
references proveedores(idprov) ON UPDATE CASCADE;

alter table procesadores
add constraint fk_cpu_idprov foreign key (cpu_idprov) 
references proveedores(idprov) ON UPDATE CASCADE;

alter table motherboard
add constraint fk_mother_idprov foreign key (mother_idprov) 
references proveedores(idprov) ON UPDATE CASCADE;

alter table ram
add constraint fk_ram_idprov foreign key (ram_idprov) 
references proveedores(idprov) ON UPDATE CASCADE;
/*
select * from graficas
where modelo like '%ASUS%';

SELECT *
FROM proveedores left JOIN graficas
ON proveedores.idprov = graficas.idgraf;

select modelo from graficas
where idgraf in 
(select idgraf from graficas where grafpcie like '%4.0%16%');
*/
-- truncate table graficas;


-- ------------------------------------------------------------- bitácoras -- -----------------------------------------
-- ------------------------------- GRAFICAS ----------------------------------------------
drop table if  exists LOG_AUDITORIA_GRAF1;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_GRAF1 -- creo la tabla donde se guardarán todos los registros del esquema
(
ID_LOG INT AUTO_INCREMENT NOT NULL,-- PRIMARY KEY
ACCION VARCHAR(10) ,-- GUARDA SI ES DELETE, UPDATE O INSERT
TABLA VARCHAR(50) ,-- NOMBRE DE LA TABLA AFECTADA
USUARIO VARCHAR(100) , -- QUIÉN EJECUTÓ LA SENTENCIA DML
FECHA_UPD_INS_DEL DATE , -- MOMENTO EN QUE SE GENERÓ LA SENTENCIA DML
HORA_UPD_INS_DEL TIME,
PRIMARY KEY (ID_LOG)
)
;
-- SELECT * FROM LOG_AUDITORIA_GRAF1;

drop table if  exists LOG_AUDITORIA_GRAF2;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_GRAF2 -- creo la tabla donde se guardarán todos los registros de la tabla GRAFICAS QUE SEAN ACTUALIZADOS
(
ID_LOG2 INT AUTO_INCREMENT, -- PK
LOG_MODELO varchar(50) DEFAULT NULL, -- MODELO DE LA GRAFICA AFECTADA
LOG_idgraf int DEFAULT NULL , -- ID DE LA GRAFICA AFECTADO
CAMPO_NUEVO VARCHAR(300), -- LOS CAMPOS MODIFICADO ACTUAL
CAMPO_ANTERIOR VARCHAR(300), -- CAMPO MODIFICADO ANTERIOR
ACCION VARCHAR(10) , -- SI ES DELETE, UPDATE O INSERT
TABLA VARCHAR(50) , -- LA TABLA AFECTADA
USUARIO VARCHAR(100) , -- USUARIO QUIEN REALIZÓ LA SENTENCIA
FECHA_UPD_INS_DEL DATE, -- FECHA EN QUE SE LANZÓ LA SENTENCIA
HORA_UPD_INS_DEL  TIME,
PRIMARY KEY (ID_LOG2)
)
;
-- SELECT * FROM LOG_AUDITORIA_GRAF2;

-- ------------------------------- PROCESADORES ----------------------------------------------
drop table if  exists LOG_AUDITORIA_CPU1;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_CPU1 -- creo la tabla donde se guardarán todos los registros del esquema
(
ID_LOG INT AUTO_INCREMENT NOT NULL,-- PRIMARY KEY
ACCION VARCHAR(10) ,-- GUARDA SI ES DELETE, UPDATE O INSERT
TABLA VARCHAR(50) ,-- NOMBRE DE LA TABLA AFECTADA
USUARIO VARCHAR(100) , -- QUIÉN EJECUTÓ LA SENTENCIA DML
FECHA_UPD_INS_DEL DATE , -- MOMENTO EN QUE SE GENERÓ LA SENTENCIA DML
HORA_UPD_INS_DEL TIME,
PRIMARY KEY (ID_LOG)
)
;
-- SELECT * FROM LOG_AUDITORIA_CPU1;

drop table if  exists LOG_AUDITORIA_CPU2;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_CPU2 -- creo la tabla donde se guardarán todos los registros de la tabla procesadores QUE SEAN ACTUALIZADOS
(
ID_LOG2 INT AUTO_INCREMENT NOT NULL, -- PK
LOG_MODELO varchar(50) DEFAULT NULL, -- MODELO DEL CPU AFECTADO
LOG_idcpu int DEFAULT NULL, -- ID DEL CPU AFECTADO
CAMPO_NUEVO VARCHAR(300), -- LOS CAMPOS MODIFICADO ACTUAL
CAMPO_ANTERIOR VARCHAR(300), -- CAMPO MODIFICADO ANTERIOR
ACCION VARCHAR(10) , -- SI ES DELETE, UPDATE O INSERT
TABLA VARCHAR(50) , -- LA TABLA AFECTADA
USUARIO VARCHAR(100) , -- USUARIO QUIEN REALIZÓ LA SENTENCIA
FECHA_UPD_INS_DEL DATE, -- FECHA EN QUE SE LANZÓ LA SENTENCIA
HORA_UPD_INS_DEL TIME,
PRIMARY KEY (ID_LOG2)
)
;
-- SELECT * FROM LOG_AUDITORIA_CPU2;