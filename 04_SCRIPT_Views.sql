use productos;

create view vw_pcie4x16 as
select modelo from graficas
where idgraf in 
(select idgraf from graficas where grafpcie like '%4.0%16%');

create view vw_pccomponentes as
select * from proveedores where idprov = 1;
-- ------------------------------------FILTROS DE PROCESADORES---------------------------------------------------------------
SELECT * FROM PROCESADORES;

CREATE VIEW VW_RYZEN3 AS
SELECT * FROM PROCESADORES WHERE MODELO LIKE '%Ryzen 3%';
SELECT * FROM VW_RYZEN3;
-- drop view VW_RYZEN3;

CREATE VIEW VW_RYZEN5 AS
SELECT * FROM PROCESADORES WHERE MODELO LIKE '%Ryzen 5%';
SELECT * FROM VW_RYZEN5;
-- drop view VW_RYZEN5;

CREATE VIEW VW_RYZEN7 AS
SELECT * FROM PROCESADORES WHERE MODELO LIKE '%Ryzen 7%';
SELECT * FROM VW_RYZEN7;
-- drop view VW_RYZEN7;

CREATE VIEW VW_RYZEN9 AS
SELECT * FROM PROCESADORES WHERE MODELO LIKE '%Ryzen 9%';
SELECT * FROM VW_RYZEN9;
-- drop view VW_RYZEN9;

CREATE VIEW VW_RYZEN3D AS
SELECT * FROM PROCESADORES WHERE MODELO LIKE '%3D%' ORDER BY MODELO;