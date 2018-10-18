create or replace procedure country_read(id integer) is
cursor temp_cursor is
select * from country where countryID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Country ID: ' || read.countryID || chr(10) || 
							 'Country name: ' || read.countryName);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the country.');
end country_read;

create or replace procedure department_read(id integer) is
cursor temp_cursor is
select * from department where deptID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Department ID: ' || read.deptID || chr(10) ||
		 					 'Department name: ' || read.deptName || chr(10) ||
		 					 'Country ID: ' || read.countryID);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the department.');
end department_read;

create or replace procedure city_read(id integer) is
cursor temp_cursor is
select * from city where cityID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('City ID: ' || read.cityID || chr(10) ||
		 					 'City name: ' || read.cityName || chr(10) ||
		 					 'Department ID: ' || read.deptID);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the city.');
end city_read;

create or replace procedure envelope_read(id integer) is
cursor temp_cursor is
select * from envelope where envelopeID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Envelope ID: ' || read.envelopeID || chr(10) ||
		 					 'Envelope name: ' || read.envelopeName);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the envelope.');
end envelope_read;

create or replace procedure clientType_read(id integer) is
cursor temp_cursor is
select * from client_type where cTypeID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Client type ID: ' || read.cTypeID || chr(10) ||
		 					 'Client type name: ' || read.cTypeName || chr(10) ||
		 					 'Discount: ' || read.cTypeDiscount);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the client type.');
end clientType_read;

create or replace procedure clientEntity_read(id integer) is
cursor temp_cursor is
select * from client_entity where cEntityID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Client entity ID: ' || read.cEntityID || chr(10) ||
		 					 'Client entity name: ' || read.cEntityName);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the client entity.');
end clientEntity_read;

create or replace procedure category_read(id integer) is
cursor temp_cursor is
select * from category where categoryID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Category ID: ' || read.categoryID || chr(10) ||
		 					 'Category name: ' || read.categoryName || chr(10) ||
		 					 'Product type ID: ' || read.pTypeID);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the category.');
end category_read;

create or replace procedure productType_read(id integer) is
cursor temp_cursor is
select * from product_type where pTypeID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Product type ID: ' || read.pTypeID || chr(10) ||
		 					 'Product type name: ' || read.pTypeName);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the product type.');
end productType_read;

create or replace procedure errandState_read(id integer) is
cursor temp_cursor is
select * from errand_state where eStateID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Errand state ID: ' || read.eStateID || chr(10) ||
		 					 'Errand state name: ' || read.eStateName);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the errand state.');
end errandState_read;

create or replace procedure provider_read(id integer) is
cursor temp_cursor is
select * from provider where providerID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Provider ID: ' || read.providerID || chr(10) ||
		 					 'Provider name: ' || read.providerName || chr(10) ||
		 					 'Provider email: ' || read.providerEmail || chr(10) ||
		 					 'Provider phone: ' || read.providerPhone || chr(10) ||
		 					 'Provider address: ' || read.providerAddress || chr(10) ||
		 					 'City ID: ' || read.cityID);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the provider.');
end provider_read;

create or replace procedure product_read(id integer) is
cursor temp_cursor is
select * from product where productID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Product ID: ' || read.productID || chr(10) ||
		 					 'Product name: ' || read.productName || chr(10) ||
		 					 'Product price: ' || read.productPrice || chr(10) ||
		 					 'Product VAT: ' || read.productIVA || '%' ||chr(10) ||
		 					 'Product quantity: ' || read.productQuantity || chr(10) ||
		 					 'Product weight: ' || read.productWeight || chr(10) ||
		 					 'Product state: ' || read.productState || chr(10) ||
		 					 'Category ID: ' || read.categoryID || chr(10) ||
		 					 'Provider ID: ' || read.providerID || chr(10) ||
		 					 'Envelope ID: ' || read.envelopeID);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the product.');
end product_read;

create or replace procedure client_read(id integer) is
cursor temp_cursor is
select * from client where clientID = id;
begin
	for read in temp_cursor loop
		dbms_output.put_line('Client ID: ' || read.clientID || chr(10) ||
		 					 'Client name: ' || read.clientName || chr(10) ||
		 					 'Client email: ' || read.clientEmail || chr(10) ||
		 					 'Client phone: ' || read.clientPhone || chr(10) ||
		 					 'Client address: ' || read.clientAddress || chr(10) ||
		 					 'City ID: ' || read.cityID || chr(10) ||
		 					 'Client entity ID: ' || read.cEntityID || chr(10) ||
		 					 'Client type ID: ' || read.cTypeID);
	end loop;
exception
when others then
	dbms_output.put_line('There has been an error when reading the client.');
end client_read;

create or replace procedure catalogue_read(id integer) is
cursor temp_cursor is
select productName
from catalogue_detail inner join product on catalogue_detail.productID = product.productID
where catalogue_detail.catalogueID = id;
begin
end catalogue_read;