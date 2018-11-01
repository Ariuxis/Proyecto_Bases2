create or replace function total_price(catalogue_id integer, product_id integer, 
									   quantity integer) return numeric is
total numeric(8, 2);
begin
	select cDetailPrice * quantity into total from catalogue_detail
	where catalogueID = catalogue_id and productID = product_ID;
	return total;
exception
when no_data_found then
	dbms_output.put_line('IDs does not exist.');
	return 0;
when others then
	dbms_output.put_line('There has been an error when calculating the price.');
	return 0;
end total_price;

create or replace function get_catalogueID(eDate date) return integer is
cDate integer;
errorFound exception;
begin
	select catalogueID into cDate from catalogue 
	where eDate between catalogueSDate and catalogueEDate;
	return cDate;
exception
when no_data_found then
	dbms_output.put_line('No catalogue found in that date.');
	raise errorFound;
when others then
	dbms_output.put_line('There has been an error when getting the catalogue.');
	raise errorFound;
end get_catalogueID;

create or replace function catalogueDate_validation(id integer, sDate date, eDate date) return boolean is
value varchar(1);
begin
	select 'x' into value from catalogue 
	where ((sDate between catalogueSDate and catalogueEDate) or
	(eDate between catalogueSDate and catalogueEDate)) and catalogueID != id;
	return false;
exception
when no_data_found then
	return true;
end catalogueDate_validation;

create or replace function catalogue_validation(id integer) return boolean is
value varchar(1);
begin
	select 'x' into value from catalogue 
	where catalogueID = id;
	return true;
exception
when no_data_found then
	return false;
end catalogue_validation;

create or replace function errandDate_validation(eDate date) return boolean is
value varchar(1);
begin
	select 'x' into value from catalogue 
	where eDate between catalogueSDate and catalogueEDate;
	return true;
exception
when no_data_found then
	return false;
end errandDate_validation;

create or replace function errand_validation(id integer) return boolean is
value varchar(1);
begin
	select 'x' into value from errand
	where errandID = id;
	return true;
exception
when no_data_found then
	return false;
end errand_validation;

create or replace function product_validation(id integer) return boolean is
value varchar(1);
begin
	select 'x' into value from product
	where productID = id;
	return true;
exception
when no_data_found then
	return false;
end product_validation;

create or replace function catalogueProduct_validation(product_id integer, catalogue_id integer) 
													   return boolean is
value varchar(1);
begin
	select 'x' into value 
	from catalogue_detail inner join product on catalogue_detail.productID = product.productID
	where product.productID = product_id and catalogue_detail.catalogueID = catalogue_id;
	return true;
exception
when no_data_found then
	return false;
end catalogueProduct_validation;

create or replace function errandState_validation(id integer) return boolean is
value varchar(1);
begin
	select 'x' into value from errand
	where errandID = id and eStateID = 1;
	return true;
exception
when no_data_found then
	return false;
end errandState_validation;

create or replace function bill_validation(id integer) return boolean is
value varchar(1);
begin
	select 'x' into value from bill
	where billID = id;
	return true;
exception
when no_data_found then
	return false;
end bill_validation;

create or replace function new_quantity(errand_id integer, product_id integer) return integer is
total integer;
errorFound exception;
begin
	select cDetailQuantity - eDetailQuantity into total
	from errand inner join errand_detail on errand.errandID = errand_detail.errandID
	inner join catalogue_detail on errand_detail.productID = catalogue_detail.productID
	inner join catalogue on catalogue_detail.catalogueID = catalogue.catalogueID
	where errand_detail.errandID = errand_id and errand_detail.productID = product_id
	and errandDate between catalogueSDaete and catalogueEDate;
	return total;
exception
when no_data_found then
	dbms_output.put_line('IDs does not exist.');
	raise errorFound;
when others then
	dbms_output.put_line('There has been an error when calculating the new quantity.');
	raise errorFound;
end new_quantity;