create or replace procedure errand_register(client_id integer) is
errorFound exception;
begin
	if errandDate_validation() = true then
		insert into errand (errandID, errandDate, clientID, eStateID) 
							values (errand_sequence.nextval, sysdate, client_id, 1);
		dbms_output.put_line('Errand registered: ' || errand_sequence.currval);
	else
		dbms_output.put_line('There is no catalogue available currently.');
		raise errorFound;
	end if;
exception
when dup_val_on_index then
	dbms_output.put_line('Errand ID is already registered.');
	raise errorFound;
when others then
	dbms_output.put_line('There has been error when registering the errand.');
	raise errorFound;
end errand_register;

create or replace procedure errand_cancel(id integer) is
begin
	update errand set eStateID = 3 where errandID = id;
	if sql%rowcount = 0 then
		dbms_output.put_line('Errand ID does not exist.');
	else
		dbms_output.put_line('Errand has been cancelled.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when cancelling the errand.');
end errand_cancel;

create or replace procedure errandDetail_register(errand_id integer, product_id integer, 
												  quantity integer) is
total numeric(8, 2);
eDate date;
errorFound exception;
begin
	select errandDate into eDate from errand where errandID = errand_id;
	if errand_validation(errand_id) = true and 
	catalogueProduct_validation(product_id, get_catalogueID(eDate)) = true then
		if errandState_validation(errand_id) = true then
			total := total_price(get_catalogueID(eDate), product_id, quantity);
			insert into errand_detail(errandID, productID, eDetailQuantity, eDetailPrice)
									  values(errand_id, product_id, quantity, total);
			dbms_output.put_line('Errand detail registered.' || chr(10) || 
								 'Errand ID: ' || errand_id || chr(10) || 
								 'Product ID: ' || product_id || chr(10) ||
								 'Quantity: ' || quantity || chr(10) ||
								 'Total price: ' || total);
		else
			dbms_output.put_line('The errand is not in the "In process" state.');
			raise errorFound;
		end if;
	else
		dbms_output.put_line('IDs does not exist.');
		raise errorFound;
	end if;
exception
when dup_val_on_index then
	dbms_output.put_line('That product has been already registered on the selected errand.');
	raise errorFound;
when others then
	dbms_output.put_line('There has been an error when registering the errand detail.');
	raise errorFound;
end errandDetail_register;

create or replace procedure errandDetail_update(errand_id integer, product_id integer,
												quantity integer) is
total numeric(8, 2);
eDate date;
begin
	if errand_validation(errand_id) = true and product_validation(product_id) = true then
		if errandState_validation(errand_id) = true then
			select errandDate into eDate from errand where errandID = errand_id;
			total := total_price(get_catalogueID(eDate), product_id, quantity);
			update errand_detail set eDetailQuantity = quantity, eDetailPrice = total
				   where errandID = errand_id and productID = product_id;
			dbms_output.put_line('Errand detail updated.' || chr(10) || 
								 'Errand ID: ' || errand_id || chr(10) || 
								 'Product ID: ' || product_id || chr(10) ||
								 'Quantity: ' || quantity || chr(10) ||
								 'Total price: ' || total);
		else
			dbms_output.put_line('The errand is not in the "In process" state.');
		end if;
	else
		dbms_output.put_line('IDs does not exist.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when updating the errand detail.');
end errandDetail_update;

create or replace procedure errandDetail_delete(errand_id integer, product_id integer) is
begin
	delete from errand_detail where errandID = errand_id and productID = product_id;
	if sql%rowcount = 0 then
		dbms_output.put_line('IDs does not exist.');
	else
		dbms_output.put_line('Product ' || product_id || ' deleted from errand.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when deleting the product from the errand.');
end errandDetail_delete;

create or replace procedure errand_read(errand_id integer) is
cursor temp_cursor is
select eDetailPrice, eDetailQuantity, productName 
from errand inner join errand_detail on errand.errandID = errand_detail.errandID
inner join product on errand_detail.productID = product.productID
where errand.errandID = errand_id;
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

create or replace procedure errand_invoicing(id integer) is

begin
	if errand_validation(errand_id) = true then

	else
		dbms_output.put_line('Errand ID does not exist.');
	end if;
exception
when others then
	dbms_output.put_line('There has been an error when invoicing the errand.');
end errand_invoicing;