# VALIDATION #
create or replace function catalogue_validation(id integer, sDate date, eDate date) return boolean is
value varchar(1);
begin
	select 'x' into value from catalogue 
	where ((sDate between catalogueSDate and catalogueEDate) or
	(eDate between catalogueSDate and catalogueEDate)) and catalogueID != id;
	return false;
exception
when no_data_found then
	return true;
end;

# CREATE #
create or replace procedure country_register(id integer, name nchar) is
begin
	insert into country (countryID, countryName) values (id, name);
	dbms_output.put_line('Country registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Country ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the country.');
end country_register;

create or replace procedure department_register(id integer, name nchar, country_id integer) is
begin
	insert into department (deptID, deptName, countryID) values (id, name, country_id);
	dbms_output.put_line('Department registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Department ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the department.');
end department_register;

create or replace procedure city_register(id integer, name nchar, dept_id integer) is
begin
	insert into city (cityID, cityName, deptID) values (id, name, dept_id);
	dbms_output.put_line('City registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('City ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the city.');
end city_register;


create or replace procedure clientType_register(id integer, name nchar, discount smallint) is
begin
	insert into client_type (cTypeID, cTypeName, cTypeDiscount) values (id, name, discount);
	dbms_output.put_line('Client type registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Client type ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the client type.');
end clientType_register;

create or replace procedure clientEntity_register(id integer, name nchar) is
begin
	insert into client_entity (cEntityID, cEntityName) values (id, name);
	dbms_output.put_line('Client entity registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Client entity ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the client entity.');
end clientEntity_register;

create or replace procedure client_register(id integer, 
											name nchar,
											email nchar,
											phone nchar,
											address varchar2,
											city_id integer, 	
											cType_id integer,
											cEntity_id integer) is
begin
	insert into client (clientID, clientName, clientEmail, clientPhone, 
						clientAddress, cityID, cTypeID, cEntityID) 
						values (id, name, email, phone, address, city_id, cType_id, cEntity_id);
	dbms_output.put_line('Client registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Client ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the client.');
end client_register;

create or replace procedure envelope_register(id integer, name nchar) is
begin
	insert into envelope (envelopeID, envelopeName) values (id, name);
	dbms_output.put_line('Envelope registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Envelope ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the envelope.');
end envelope_register;

create or replace procedure productType_register(id integer, name nchar) is
begin
	insert into product_type (pTypeID, pTypeName) values (id, name);
	dbms_output.put_line('Product type registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Product type ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the product type.');
end productType_register;

create or replace procedure category_register(id integer, name nchar, pType_id integer) is
begin
	insert into category (categoryID, categoryName, pTypeID) values (id, name, pType_id);
	dbms_output.put_line('Category registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Category ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the category.');
end category_register;

create or replace procedure provider_register(id integer,
											  name nchar,
											  email nchar,
											  phone nchar,
											  address varchar2,
											  city_id integer) is
begin
	insert into provider (providerID, providerName, providerEmail, 
						  providerPhone, providerAddress, cityID)
						  values (id, name, email, phone, address, city_id);
	dbms_output.put_line('Provider registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Provider ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the provider.');
end provider_register;

create or replace procedure errandState_register(id integer, name nchar) is
begin
	insert into errand_state (eStateID, eStateName) values (id, name);
	dbms_output.put_line('Errand state registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Errand state ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the errand state.');
end errandState_register;

create or replace procedure catalogue_register(id integer, sDate date, eDate date) is
begin
if catalogue_validation(id, sDate, eDate) = true and sDate < eDate then
	insert into catalogue (catalogueID, catalogueSDate, catalogueEDate) values (id, sDate, eDate);
	dbms_output.put_line('Catalogue registered: ' || id);
else
	dbms_output.put_line('Catalogue dates are invalid.');
end if;
exception
when dup_val_on_index then
	dbms_output.put_line('Catalogue ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the catalogue.');
end catalogue_register;

create or replace procedure catalogueDetail_register(catalogue_id integer, product_id integer, 
													 price numeric, quantity smallint) is
begin
	insert into catalogue_detail (catalogueID, productID, cDetailPrice, cDetailQuantity)
								  values (catalogue_id, product_id, price, quantity);
	dbms_output.put_line('Catalogue detail registered.');
exception
when dup_val_on_index then
	dbms_output.put_line('Catalogue detail IDs are already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the catalogue detail.');
end catalogueDetail_register;

create or replace procedure product_register(id integer, 
											 name nchar,
											 price numeric,
											 IVA smallint,
											 quantity smallint,
											 weight numeric, 	
											 state nchar,
											 category_id integer,
											 provider_id integer,
											 envelope_id integer) is
begin
	insert into product (productID, productName, productPrice, productIVA, productQuantity,
						 productWeight, productState, categoryID, providerID, envelopeID) 
						 values (id, name, price, IVA, quantity, weight, state, category_id, 
						 	     provider_id,envelope_id);
	dbms_output.put_line('Product registered: ' || id || ' ' || name);
exception
when dup_val_on_index then
	dbms_output.put_line('Product ID is already registered.');
when others then
	dbms_output.put_line('There has been an error when registering the product.');
end product_register;
