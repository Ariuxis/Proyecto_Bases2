create or replace procedure country_update(id integer, name nchar) is
begin
	update country set countryName = name where countryID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Country ID does not exist.');
	else
		dbms_output.put_line('Country updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the country.');
end country_update;

create or replace procedure department_update(id integer, name nchar, country_id integer) is
begin
	update department set deptName = name, countryID = country_id where deptID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Department ID does not exist.');
	else
		dbms_output.put_line('Department updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the department.');
end department_update;

create or replace procedure catalogue_update(id integer, sDate date, eDate date) is
begin
if catalogueDate_validation(id, sDate, eDate) = true and sDate < eDate then
	update catalogue set catalogueSDate = sDate, catalogueEDate = eDate where catalogueID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Catalogue ID does not exist.');
	else
		dbms_output.put_line('Catalogue updated: ' || id || ' New dates: ' || sDate || ' - ' || eDate);
	end if;
else
	dbms_output.put_line('Catalogue dates are invalid.');
end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the catalogue.');
end catalogue_update;

create or replace procedure catalogueDetail_update(catalogue_id integer, product_id integer,
												   price numeric, quantity smallint) is
begin
	update catalogue_detail set cDetailPrice = price, cDetailQuantity = quantity
		   where catalogueID = catalogue_id and productID = product_id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Catalogue detail IDs does not exist.');
	else
		dbms_output.put_line('Catalogue detail updated: ' || catalogue_ID || ' ' || product_id);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the catalogue detail.');
end catalogueDetail_update;

create or replace procedure city_update(id integer, name nchar, dept_id integer) is
begin
	update city set cityName = name, deptID = dept_id where cityID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('City ID does not exist.');
	else
		dbms_output.put_line('City updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the city.');
end city_update;

create or replace procedure category_update(id integer, name nchar, pType_id integer) is
begin
	update category set categoryName = name, pTypeID = pType_id where categoryID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Category ID does not exist.');
	else
		dbms_output.put_line('Category updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the category.');
end category_update;

create or replace procedure clientType_update(id integer, name nchar, discount integer) is
begin
	update client_Type set cTypeName = name, cTypeDiscount = discount where cTypeID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Client type ID does not exist.');
	else
		dbms_output.put_line('Client type updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the client type.');
end clientType_update;


create or replace procedure clientEntity_update(id integer, name nchar) is
begin
	update client_Entity set cEntityName = name where cEntityID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Client entity ID does not exist.');
	else
		dbms_output.put_line('Client entity updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the client entity.');
end clientEntity_update;


create or replace procedure productType_update(id integer, name nchar) is
begin
	update product_Type set pTypeName = name where pTypeID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Product type ID does not exist.');
	else
		dbms_output.put_line('Product type updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the product type.');
end productType_update;

create or replace procedure errandState_update(id integer, name nchar) is
begin
	update errand_State set eStateName = name where eStateID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Errand state ID does not exist.');
	else
		dbms_output.put_line('Errand state updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the errand state.');
end errandState_update;

create or replace procedure envelope_update(id integer, name nchar) is
begin
	update Envelope set envelopeName = name where envelopeID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Envelope ID does not exist.');
	else
		dbms_output.put_line('Envelope updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the envelope.');
end envelope_update;

create or replace procedure provider_update(id integer,
											name nchar,
											email nchar,
											phone nchar,
											address varchar2,
											city_id integer) is
begin
	update provider set providerName = name, providerEmail = email, 
		   providerPhone = phone, providerAddress = address, cityID = city_id 
		   where providerID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Provider ID does not exist.');
	else
		dbms_output.put_line('Provider updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the provider.');
end provider_update;

create or replace procedure client_update(id integer, 
										  name nchar,
										  email nchar,
										  phone nchar,
										  address varchar2,
										  city_id integer, 	
										  cType_id integer,
										  cEntity_id integer) is
begin
	update client set clientName = name, clientEmail = email, 
		   clientPhone = phone, clientAddress = address, cityID = city_id,
		   cTypeID = cType_id, cEntityID = cEntity_id 
		   where clientID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Client ID does not exist.');
	else
		dbms_output.put_line('Client updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the Client.');
end client_update;

create or replace procedure product_update(id integer, 
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
	update product set productName = name, productPrice = price, productIVA = IVA,
		   productQuantity = quantity, productWeight = weight, productState = state,
		   categoryID = category_id, providerID = provider_id, envelopeID = envelope_id 
		   where productID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Product ID does not exist.');
	else
		dbms_output.put_line('Product updated: ' || id || ' New name: ' || name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the product.');
end product_update;