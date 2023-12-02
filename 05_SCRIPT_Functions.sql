use productos;

create function graf_count (idgraf int)
returns int
deterministic
return (select count(*) from graficas where grafpcie like '%4.0%');