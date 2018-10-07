create or replace procedure country_delete(id integer) is
temp_name nchar(20); 
begin
	delete from country where countryID = id returning countryName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Country ID does not exist.');
	else
		dbms_output.put_line('Country deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the country.');
end country_delete;

create or replace procedure department_delete(id integer) is
temp_name nchar(30); 
begin
	delete from department where deptID = id returning deptName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Department ID does not exist.');
	else
		dbms_output.put_line('Department deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the department.');
end department_delete;

create or replace procedure city_delete(id integer) is
temp_name nchar(30); 
begin
	delete from city where cityID = id returning cityName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('City ID does not exist.');
	else
		dbms_output.put_line('City deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the city.');
end city_delete;

create or replace procedure errandState_delete(id integer) is
temp_name nchar(15); 
begin
	delete from errand_state where eStateID = id returning eStateName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Errand state ID does not exist.');
	else
		dbms_output.put_line('Errand state deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the errand state.');
end errandState_delete;

create or replace procedure clientType_delete(id integer) is
temp_name nchar(15); 
begin
	delete from client_type where cTypeID = id returning cTypeName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Client type ID does not exist.');
	else
		dbms_output.put_line('Client type deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the client type.');
end clientType_delete;

create or replace procedure clientEntity_delete(id integer) is
temp_name nchar(15); 
begin
	delete from client_entity where cEntityID = id returning cEntityName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Client entity ID does not exist.');
	else
		dbms_output.put_line('Client entity deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the client entity.');
end clientEntity_delete;

create or replace procedure envelope_delete(id integer) is
temp_name nchar(15); 
begin
	delete from envelope where envelopeID = id returning envelopeName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Envelope ID does not exist.');
	else
		dbms_output.put_line('Envelope deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the envelope.');
end envelope_delete;

create or replace procedure productType_delete(id integer) is
temp_name nchar(15); 
begin
	delete from product_type where pTypeID = id returning pTypeName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Product type ID does not exist.');
	else
		dbms_output.put_line('Product type deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the product type.');
end productType_delete;

create or replace procedure category_delete(id integer) is
temp_name nchar(15); 
begin
	delete from category where categoryID = id returning categoryName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Category ID does not exist.');
	else
		dbms_output.put_line('Category deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the category.');
end category_delete;

create or replace procedure catalogue_delete(id integer) is
begin
	delete from catalogue where catalogueID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Catalogue ID does not exist.');
	else
		dbms_output.put_line('Category deleted: ' || id);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the catalogue.');
end catalogue_delete;

create or replace procedure catalogueDetail_delete(catalogue_id integer, product_id integer) is
begin
	delete from catalogue_detail where catalogueID = catalogue_id and productID = product_id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Catalogue detail IDs does not exist.');
	else
		dbms_output.put_line('Category detail deleted: ' || catalogue_id || ' ' || product_id);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the catalogue detail.');
end catalogueDetail_delete;

create or replace procedure client_delete(id integer) is
temp_name nchar(20);
begin
	delete from client where clientID = id returning clientName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Client ID does not exist.');
	else
		dbms_output.put_line('Client deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the client.');
end client_delete;

create or replace procedure provider_delete(id integer) is
temp_name nchar(15);
begin
	delete from provider where providerID = id returning providerName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Provider ID does not exist.');
	else
		dbms_output.put_line('Provider deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the provider.');
end provider_delete;

create or replace procedure product_delete(id integer) is
temp_name nchar(15);
begin
	delete from product where productID = id returning productName into temp_name;
	if sql%rowcount = 0 then
		dbms_output.put_line('Product ID does not exist.');
	else
		dbms_output.put_line('Product deleted: ' || temp_name);
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the product.');
end product_delete;