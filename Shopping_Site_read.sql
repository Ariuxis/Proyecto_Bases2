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

create or replace procedure catalogue_read(catalogue_id integer) is
cursor temp_cursor is
select productName, cDetailPrice, cDetailQuantity, product.productID
from catalogue_detail inner join product on catalogue_detail.productID = product.productID
where catalogue_detail.catalogueID = catalogue_id;
sDate date;
eDate date;
begin
	if catalogue_validation(catalogue_id) = true then
		select catalogueSDate, catalogueEDate into sDate, eDate
		from catalogue where catalogueID = catalogue_id;
		dbms_output.put_line('Catalogue ID: ' || catalogue_id || chr(10) ||
							 'Catalogue start date: ' || sDate || chr(10) ||
							 'Catalogue end date: ' || eDate || chr(10) || chr(10) ||
							 'Product list');
		for read in temp_cursor loop
			dbms_output.put_line('Product ID: ' || read.productID || ' ' ||
								 'Product name: ' || read.productName || ' | ' ||
								 'Quantity: ' || read.cDetailQuantity || ' | ' ||
								 'Price: ' || read.cDetailPrice);
		end loop;
	else
		dbms_output.put_line('Catalogue ID does not exist.');
	end if;
end catalogue_read;

create or replace procedure errand_read(errand_id integer) is
cursor temp_cursor is
select eDetailPrice, eDetailQuantity, productName 
from errand_detail inner join product on errand_detail.productID = product.productID
where errand_detail.errandID = errand_id;
eDate date;
name nchar(20);
state nchar(15);
begin
	if errand_validation(errand_id) = true then
		select errandDate, clientName, eStateName into eDate, name, state
		from errand_state inner join errand on errand_state.eStateID = errand.eStateID
		inner join client on errand.clientID = client.clientID
		where errandID = errand_id;
		dbms_output.put_line('Errand ID: ' || errand_id || chr(10) ||
							 'Errand date: ' || eDate || chr(10) ||
							 'Errand state: ' || state || chr(10) ||
							 'Client name: ' || name || chr(10) || chr(10) ||
							 'Product list');
		for read in temp_cursor loop
			dbms_output.put_line('Product name: ' || read.productName || ' ' ||
								 'Quantity: ' || read.eDetailQuantity || ' | ' ||
								 'Price: ' || read.eDetailPrice);
		end loop;
	else
		dbms_output.put_line('Errand ID does not exist.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when reading the errand.');
end errand_read;

create or replace procedure bill_read(bill_id integer) is
cursor temp_cursor is
select bDetailPrice, bDetailQuantity, productName 
from bill_detail inner join product on bill_detail.productID = product.productID
where bill_detail.billID = bill_id;
bDate date;
dDate date;
name nchar(20);
errand_id integer;
begin
	if bill_validation(bill_id) = true then
		select billDate, clientName, billDeliveryDate, bill.errandID 
		into bDate, name, dDate, errand_id
		from bill inner join errand on bill.errandID = errand.errandID
		inner join client on errand.clientID = client.clientID
		where billID = bill_id;
		dbms_output.put_line('Bill ID: ' || bill_id || chr(10) ||
							 'Bill date: ' || bDate || chr(10) ||
							 'Bill delivery date: ' || dDate || chr(10) ||
							 'Errand ID: ' || errand_id || chr(10) ||
							 'Client name: ' || name || chr(10) || chr(10) ||
							 'Product list');
		for read in temp_cursor loop
			dbms_output.put_line('Product name: ' || read.productName || ' ' ||
								 'Quantity: ' || read.bDetailQuantity || ' | ' ||
								 'Price: ' || read.bDetailPrice);
		end loop;
	else
		dbms_output.put_line('Bill ID does not exist.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when reading the bill.');
end bill_read;
