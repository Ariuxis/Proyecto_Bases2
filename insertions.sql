set serveroutput on

begin 
country_register(2, 'Venezuela');
end;

begin
department_register(1, 'Valle del cauca', 1);
end;

begin
city_register(1, 'Cali', 1);
end;

begin
clientType_register(1, 'Normal', 0);
clientType_register(2, 'Preferential', 10);
end;

begin
clientEntity_register(1, 'Natural');
clientEntity_register(2, 'Juridical');
end;

begin
client_register(2, 'Antonio', 'me@me.com', 7984561230, 'Avenida', 1, 1, 1);
end;

begin
envelope_register(1, 'Caja');
envelope_register(2, 'Bolsa');
envelope_register(3, 'Envase');
envelope_register(4, 'Otro');
end;

begin
producttype_register(1, 'Ferreteros');
producttype_register(2, 'Comestibles');
producttype_register(3, 'Electrónicos');
end;

begin
provider_register(1, 'Yu', 'me@mail.com', 1237894560, 'Carrera', 1);
end;

begin
catalogue_register(3, to_date('2018/03/01', 'yyyy/mm/dd'), to_date('2018/04/01', 'yyyy/mm/dd'));
end;

begin
category_register(2, 'Celular', 3);
category_register(3, 'Laptop', 3);
commit;
end;

begin
product_register(1, 'Doritos', 1.05, 8, 100, 0.025, 'Disponible', 1, 1, 2);
product_register(2, 'Cheese Tris', 1.15, 8, 100, 0.040, 'Disponible', 1, 1, 2);
product_register(3, 'Pocophone F1', 300, 12, 50, 0.180, 'Disponible', 2, 1, 1);
commit;
end;

select * from catalogue;

