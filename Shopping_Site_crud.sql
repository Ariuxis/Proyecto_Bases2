create or replace procedure country_register(id integer, name nchar) is
begin
	insert into country (countryID, countryName) values (id, name);
	dbms_output.put_line('Country registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	update country set countryID = id, countryName = name;
	dbms_output.put_line('Country has been updated: ' || id || name);
when others then
	dbms_output.put_line('There has been an error when registering the country.');
end country_register;

create or replace procedure department_register(id integer, name nchar, country_id integer) is
begin
	insert into department (deptID, deptName, countryID) values (id, name, country_id);
	dbms_output.put_line('Department registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Department id is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the department.');
end department_register;

create or replace procedure city_register(id integer, name nchar, dept_id integer) is
begin
	insert into city (cityID, cityName, deptID) values (id, name, dept_id);
	dbms_output.put_line('City registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('City id is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the city.');
end city_register;


create or replace procedure clientType_register(id integer, name nchar, discount smallint) is
begin
	insert into client_type (cTypeID, cTypeName, cTypeDiscount) values (id, name, discount);
	dbms_output.put_line('Client type registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Client type id is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the client type.');
end clientType_register;

create or replace procedure clientEntity_register(id integer, name nchar) is
begin
	insert into client_entity (cEntityID, cEntityName) values (id, name);
	dbms_output.put_line('Client entity registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Client entity id is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the client entity.');
end clientEntity_register;


create or replace function client_validation(id in client.clientID%type) return boolean is
temporal nchar(1);
begin
	select 'x' into temporal from client where id = clientID;
	return true;
exception
when no_data_found then
	return false;
end;


create or replace procedure client_register(id integer, 
											name nchar,
											email nchar,
											phone nchar,
											address varchar2,
											city_id integer,
											cType_id integer,
											cEntity_id integer) is
begin
	if client_validation(id) = false then
		insert into client (clientID, clientName, clientEmail, clientPhone, 
							clientAddress, cityID, cTypeID, cEntityID) 
							values (id, name, email, phone, address, city_id, cType_id, cEntity_id);
		dbms_output.put_line('Client registered: ' || id || ' ' || name);
	else
		dbms_output.put_line('Client ' || id || ' is already registered.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when registering the client.');
end client_register;