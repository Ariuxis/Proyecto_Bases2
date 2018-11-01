create or replace procedure errand_register(client_id integer, eDate date) is
errorFound exception;
begin
	if errandDate_validation(eDate) = true then
		insert into errand (errandID, errandDate, clientID, eStateID, catalogueID) 
							values (errand_sequence.nextval, eDate, client_id, 1, 
									get_catalogueID(eDate));
		dbms_output.put_line('Errand registered: ' || errand_sequence.currval);
	else
		dbms_output.put_line('There is no catalogue available currently.');
		raise errorFound;
	end if;
exception
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

create or replace procedure billDetail_register(bill_id integer, product_id integer, 
												catalogue_id integer, quantity integer) is
total numeric(8, 2);
errorFound exception;
begin
	total := total_price(catalogue_id, product_id, quantity);
	insert into bill_detail (billID, productID, bDetailQuantity, bDetailPrice)
							 values (bill_id, product_id, quantity, total);
exception
when others then
	dbms_output.put_line('There has been an error when registering the bill detail.');
	raise errorFound;
end billDetail_register;

create or replace procedure unsoldDetail_register(unsold_id integer, product_id integer, 
												catalogue_id integer, quantity integer) is
total numeric(8, 2);
errorFound exception;
begin
	total := total_price(catalogue_id, product_id, quantity);
	insert into unsold_detail (unsoldID, productID, uDetailQuantity, uDetailPrice)
							 values (unsold_id, product_id, quantity, total);
exception
when others then
	dbms_output.put_line('There has been an error when registering the unsold detail.');
	raise errorFound;
end unsoldDetail_register;

create or replace procedure errand_invoicing(errand_id integer) is
cursor temp_cursor is
select errand.catalogueID, eDetailQuantity, cDetailQuantity, product.productID, cDetailPrice
from errand inner join errand_detail on errand_detail.errandID = errand.errandID
inner join product on errand_detail.productID = product.productID
inner join catalogue_detail on product.productID = catalogue_detail.productID
where errand_detail.errandID = errand_id and catalogue_detail.catalogueID = errand.catalogueID;
errorFound exception;
registered boolean := false;
begin
	savepoint invoice;
		if errand_validation(errand_id) = true then
			if errandState_validation(errand_id) = true then
				insert into bill (billID, billDate, billDeliveryDate, errandID)
							  	  values (bill_sequence.nextval, sysdate, sysdate + 8, errand_id);
				for read in temp_cursor loop
					if read.cDetailQuantity < read.eDetailQuantity then
						if read.cDetailQuantity != 0 then
							billDetail_register(bill_sequence.currval, read.productID, 
												read.catalogueID, read.cDetailQuantity);
							registered := true;
						end if;
						update errand set eStateID = 2 where errandID = errand_id;
						catalogueDetail_update(read.catalogueID, read.productID, read.cDetailPrice, 0);
						insert into unsold (unsoldID, errandID) 
											values (unsold_sequence.nextval, errand_id);
						unsoldDetail_register(unsold_sequence.currval, read.productID, read.catalogueID, 
											 (read.cDetailQuantity - read.eDetailQuantity) * -1);
					else
						catalogueDetail_update(read.catalogueID, read.productID, read.cDetailPrice, 
											   read.cDetailQuantity - read.eDetailQuantity);
						update errand set eStateID = 2 where errandID = errand_id;
						billDetail_register(bill_sequence.currval, read.productID,
											read.catalogueID, read.eDetailQuantity);

					end if;
				end loop;
			else
				dbms_output.put_line('Errand has already been invoiced.');
				raise errorFound;
			end if;
		else
			dbms_output.put_line('Errand ID does not exist.');
			raise errorFound;
		end if;
		if registered = false then
			dbms_output.put_line('There is no stock available for any product in the errand.');
			rollback to savepoint invoice;
			errand_cancel(errand_id);
		end if;
	commit;
	dbms_output.put_line('Errand succesfully invoiced.');
exception
when others then
	dbms_output.put_line('There has been an error when invoicing the errand.');
	rollback to savepoint invoice;
end errand_invoicing;

create or replace procedure errandDetail_register(errand_id integer, product_id integer, 
												  quantity integer) is
total numeric(8, 2);
eDate date;
errorFound exception;
begin
	select errandDate into eDate from errand where errandID = errand_id;
	if quantity != 0 then
		if catalogueProduct_validation(product_id, get_catalogueID(eDate)) = true then
			total := total_price(get_catalogueID(eDate), product_id, quantity);
			insert into errand_detail(errandID, productID, eDetailQuantity, eDetailPrice)
									  values(errand_id, product_id, quantity, total);
			dbms_output.put_line('Errand detail registered.' || chr(10) || 
								 'Errand ID: ' || errand_id || chr(10) || 
								 'Product ID: ' || product_id || chr(10) ||
								 'Quantity: ' || quantity || chr(10) ||
								 'Total price: ' || total);
		else
			dbms_output.put_line('The product does not exist in a valid catalogue.');
			raise errorFound;
		end if;
	else
		dbms_output.put_line('Quantity cannot be zero.');
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

create or replace procedure errand_create(errand_xml xml) is
-- cursor temp_cursor is
-- iterate through xml
begin
	set transaction name errand_creation;
	-- errand_register(errandID);
	-- for read in temp_cursor loop
	-- errandDetail_register(errandID, productID, quantity)
	-- end loop;
	-- In the previous commented block, the corresponding arguments must be extracted from XML.
	commit;
exception
when others then
	rollback errand_creation;
end errand_create;

