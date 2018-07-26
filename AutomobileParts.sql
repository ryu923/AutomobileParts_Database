/* Tables */
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE invoice CASCADE CONSTRAINTS;
DROP TABLE mycart_item CASCADE CONSTRAINTS;
DROP TABLE ship_option CASCADE CONSTRAINTS;
DROP TABLE sales CASCADE CONSTRAINTS;


/* CATEGORY */
CREATE Table category
(   CategoryID      NUMBER(3),
    CategoryName    VARCHAR2(25),  
    CONSTRAINT category_categoryID_pk PRIMARY KEY (CategoryID));

INSERT INTO category (CategoryID, CategoryName)
    VALUES (1, 'Engine');
    
INSERT INTO category (CategoryID, CategoryName)
    VALUES (2, 'Body');  

INSERT INTO category (CategoryID, CategoryName)
    VALUES (3, 'Window');

INSERT INTO category (CategoryID, CategoryName)
    VALUES (4, 'Light');

INSERT INTO category (CategoryID, CategoryName)
    VALUES (5, 'Wheels');

INSERT INTO category (CategoryID, CategoryName)
    VALUES (6, 'Tires');

INSERT INTO category (CategoryID, CategoryName)
    VALUES (7, 'Paint');

DESC category;    
SELECT * FROM category;


/* PRODUCT */
CREATE Table product
(   ProductID           NUMBER(5),
    Name                VARCHAR2(25),
    ShortDescription    VARCHAR2(25),
    LongDescription     VARCHAR2(100),
    CategoryID          NUMBER(3),
    ImageFile           VARCHAR2(10),
    Price               NUMBER(8,2),
    Quantity            NUMBER(5),
    
    CONSTRAINT product_productID_pk PRIMARY KEY (ProductID),
    CONSTRAINT product_categoryID_fk FOREIGN KEY (CategoryID)
        REFERENCES category (CategoryID));

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (1, 'Engine Plug', 'Engine ignition plug', 'Delivering electric current from an ignition system',
            1, 'EPlug.jpg', 25.00, 10);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (2, 'Piston', 'Engine piston', 'It is the moving component that is contained by a cylinder and is made gas-tight by piston rings',
            1, 'Piston.jpg', 50.00, 6);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (3, 'Door Handle', 'Car door handle', 'Door handle is used to open and close car doors',
            2, 'CDoor.jpg', 99.00, 10);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (4, 'Steering Wheel', 'Car steering wheel', 'The steering wheel that a driver rotates in order to steer a vehicle.',
            2, 'CSW.jpg', 180.00, 5);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (5, 'Windshields', 'Car windshields', 'Windshields protect the occupants from wind and flying debris',
            3, 'WS.jpg', 210.00, 3);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (7, 'Head Lamp', 'Car head lamp', 'A headlamp is a lamp attached to the front of a vehicle to light the road ahead.',
            4, 'HL.jpg', 100.00, 20);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (8, 'Wheel Frame', 'Car wheels frame', 'A wheel is a circular frame component that is intended to rotate on an axle bearing.',
            5, 'HF.jpg', 250.00, 8);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (9, 'Winter Tires', 'Car winter tires', 'Winter tires provides that all-important give that all-season tires lose when its cold out',
            6, 'WT.jpg', 200.00, 20);

INSERT INTO product (ProductID, Name, ShortDescription, LongDescription,
                      CategoryID, ImageFile, Price, Quantity)
    VALUES (10, 'Paint Spray', 'Car paint spray', 'Car paint spray is a useful tool for rust prevention.',
            6, 'WT.jpg', 17.00, 15);
   
DESC product;    
SELECT * FROM product;   
 

/* CUSTOMER */
CREATE TABLE customer
(   CustomerID          NUMBER(8),
    CustomerMail        VARCHAR2(25),
    CustomerPass        VARCHAR2(25),
    FirstName           VARCHAR2(25),
    LastName            VARCHAR2(25),
    Address             VARCHAR2(25),
    City                VARCHAR2(25),
    State               VARCHAR2(25),
    Zip                 VARCHAR2(25),
    
    CONSTRAINT customer_customerID_pk PRIMARY KEY (CustomerID));

INSERT INTO customer (CustomerID, CustomerMail, CustomerPass, FirstName,
                      LastName, Address, City, State, Zip)
    VALUES (1, 'Noah@gmail.com', 'Noah115', 'Noah', 'Liam', '48 Dunfield', 'Toronto', 'ON', 'M4R 1V2');

INSERT INTO customer (CustomerID, CustomerMail, CustomerPass, FirstName,
                      LastName, Address, City, State, Zip)
    VALUES (2, 'Mason@gmail.com', 'Mason220', 'Mason', 'Jacob', '811 Sheppard East', 'North York', 'ON', 'M4E 5B3');

INSERT INTO customer (CustomerID, CustomerMail, CustomerPass, FirstName,
                      LastName, Address, City, State, Zip)
    VALUES (3, 'William@gmail.com', 'William302', 'William', 'Ethan', '981 Progess', 'Scarborough', 'ON', 'N4W 3I0');

INSERT INTO customer (CustomerID, CustomerMail, CustomerPass, FirstName,
                      LastName, Address, City, State, Zip)
    VALUES (4, 'James@gmail.com', 'James415', 'James', 'Alexander', '4700 Keele St', 'Toronto', 'ON', 'M3J 1P3');

INSERT INTO customer (CustomerID, CustomerMail, CustomerPass, FirstName,
                      LastName, Address, City, State, Zip)
    VALUES (5, 'Michael@gmail.com', 'Michael505', 'Michael', 'Benjamin', '3636 Hawkestone Rd', 'Mississauga', 'ON', 'L5C 2V2');

DESC customer;    
SELECT * FROM customer;


/* INVOICE */
CREATE TABLE invoice
(   InvoiceID           NUMBER(8),
    CustomerID          NUMBER(8),
    OrderDate           DATE,
    Subtotal            NUMBER(8,2),
    ShippingPrice       NUMBER(8,2),
    SalesTax            NUMBER(8,2),
    Total               NUMBER(8,2),
    ShipOption          NUMBER(2),
    
    CONSTRAINT invoice_invoiceID_pk PRIMARY KEY (InvoiceID),
    CONSTRAINT invoice_customerID_fk FOREIGN KEY (CustomerID)
        REFERENCES customer (CustomerID));

INSERT INTO invoice (InvoiceID, CustomerID, OrderDate, Subtotal,
                     ShippingPrice, SalesTax, Total, ShipOption)
    VALUES (1, 1, '2017-10-14', NULL, NULL, NULL, NULL, 1);

INSERT INTO invoice (InvoiceID, CustomerID, OrderDate, Subtotal,
                     ShippingPrice, SalesTax, Total, ShipOption)
    VALUES (2, 2, '2017-11-20', NULL,
            NULL, NULL, NULL, 2);
            
INSERT INTO invoice (InvoiceID, CustomerID, OrderDate, Subtotal,
                     ShippingPrice, SalesTax, Total, ShipOption)
    VALUES (3, 3, '2017-12-01', NULL,
            NULL, NULL, NULL, 3);

INSERT INTO invoice (InvoiceID, CustomerID, OrderDate, Subtotal,
                     ShippingPrice, SalesTax, Total, ShipOption)
    VALUES (4, 4, '2017-12-15', NULL,
            NULL, NULL, NULL, 4);

DESC invoice;    
SELECT * FROM invoice;


/* MYCART_ITEM */
CREATE Table mycart_item
(   InvoiceID    NUMBER(8),
    ProductID    NUMBER(5),
    Price        NUMBER(8,2),
    Quantity     NUMBER(2),
    Subtotal     NUMBER(8,2),
    
    CONSTRAINT mycart_item_invoiceID_fk FOREIGN KEY (InvoiceID)
        REFERENCES invoice (InvoiceID),
    CONSTRAINT mycart_item_productID_fk FOREIGN KEY (ProductID)
        REFERENCES product (ProductID));

INSERT INTO mycart_item (InvoiceID, ProductID, Price, Quantity, Subtotal)
    VALUES (1, 1, NULL, 1, NULL);

INSERT INTO mycart_item (InvoiceID, ProductID, Price, Quantity, Subtotal)
    VALUES (2, 2, NULL, 2, NULL); 

INSERT INTO mycart_item (InvoiceID, ProductID, Price, Quantity, Subtotal)
    VALUES (3, 3, NULL, 1, NULL);

INSERT INTO mycart_item (InvoiceID, ProductID, Price, Quantity, Subtotal)
    VALUES (4, 4, NULL, 2, NULL);    
    
DESC mycart_item;    
SELECT * FROM mycart_item;   
    

/* SHIP OPTION */
CREATE Table ship_option
(   ShipID      NUMBER(1),
    ShipOption  VARCHAR2(25),
    ShipPrice   NUMBER(8,2),
    
    CONSTRAINT ship_option_shipID_pk PRIMARY KEY (ShipID));

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (1, 'Express', 40.00);

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (2, 'Priority', 30.00);

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (3, 'Business', 20.00);

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (4, 'Economy', 10.00);

DESC ship_option;    
SELECT * FROM ship_option;   


/* SALES */
CREATE Table sales
(   ProductID       NUMBER(5),
    SalesPercent    NUMBER(3,2),
    
    CONSTRAINT sales_productID_fk FOREIGN KEY (ProductID)
        REFERENCES product (ProductID));

INSERT INTO sales (ProductID, SalesPercent)
    VALUES (1, 0.1);

INSERT INTO sales (ProductID, SalesPercent)
    VALUES (2, 0.05);

INSERT INTO sales (ProductID, SalesPercent)
    VALUES (3, 0.15);

DESC sales;    
SELECT * FROM sales;


/* PROCEDURE : SALESFACTOR */
create or replace procedure salesfactor
(productid_n    in sales.ProductID%type,
 salesfactor_n  out sales.SalesPercent%type)
 is
 cursor cur_sales is
  select * from sales;
 begin
  salesfactor_n := -1;
  for rec_sales in cur_sales loop
    if rec_sales.ProductID = productid_n then
      salesfactor_n := 1 - rec_sales.SalesPercent;
    end if;
  end loop;
 end salesfactor;

/* PROCEDURE : SHIP_PRICE */
create or replace procedure ship_price
( invoice_n in  invoice.InvoiceID%type,
  price_n   out invoice.ShippingPrice%type)
is
  quantity_n mycart_item.Quantity%type;
begin
  select sum(Quantity) into quantity_n from mycart_item where InvoiceID = invoice_n group by InvoiceID;
  if(quantity_n < 4) then 
    select sa.ShipPrice into price_n from ship_option sa inner join invoice inv on sa.ShipID = inv.ShipOption where InvoiceID = invoice_n;
  else
    price_n := 0;
  end if;
end;

/* PROCEDURE : TAX */
create or replace procedure tax
( custid_n in invoice.CustomerID%type,
  tax out invoice.SalesTax%type)
is
  state_n customer.State%type;
begin
  select state into state_n from customer where CustomerID = custid_n;
  tax := case
    when state_n='AL' or state_n='NT' or state_n='NU' or state_n='YU' then 0.07
    when state_n='BC' then 0.14
    when state_n='NS' or state_n='QC' then 0.15
    else 0.13
  end;
end tax;

/* PROCEDURE : UPDATE_CART */
create or replace procedure update_mycart
( invoiceid_n in mycart_item.InvoiceID%type)
as
  price_n product.Price%type;
  subtotal_n product.Price%type;
  salesfactor_n number;
cursor cur_cart is
  select ProductID, Quantity from mycart_item where mycart_item.InvoiceID = invoiceid_n for update nowait;
begin
  for rec_cart in cur_cart loop
    select Price into price_n from Product where product.ProductID = rec_cart.ProductID;
    salesfactor(rec_cart.ProductID, salesfactor_n);
    if(salesfactor_n > 0) then
      price_n := price_n * salesfactor_n;
    end if;
    subtotal_n := price_n * rec_cart.Quantity;
    update mycart_item set price = price_n, subtotal = subtotal_n where current of cur_cart;
  end loop;
  commit;
end update_mycart;

/* Test */
declare 
begin
  update_mycart(1);
  update_mycart(2);
  update_mycart(3);
  update_mycart(4);
end;

/* PROCEDURE : UPDATE_INVOICE */
create or replace procedure update_invoice
( invoiceid_n in mycart_item.InvoiceID%type)
as
  sum_n invoice.Subtotal%type := 0.0;
  shipprice_n invoice.Subtotal%type;
  sales_tax_n invoice.SalesTax%type;
  customerid_n invoice.CustomerID%type;
cursor cur_cart is
  select ProductID, Subtotal from mycart_item where mycart_item.InvoiceID = invoiceid_n;
begin
  for rec_cart in cur_cart loop
    sum_n := sum_n + rec_cart.Subtotal;
  end loop;
  select CustomerID into customerid_n from invoice where InvoiceID = invoiceid_n;
  ship_price(invoiceid_n,shipprice_n);
  tax(customerid_n,sales_tax_n);
  update invoice set Subtotal = sum_n, ShippingPrice = shipprice_n, SalesTax = (sum_n + shipprice_n) * sales_tax_n, Total = (sum_n + shipprice_n) * sales_tax_n + shipprice_n + sum_n where InvoiceID = invoiceid_n;
  commit;  
end update_invoice;

/* Test */
declare 
begin
  update_invoice(1);
  update_invoice(2);
  update_invoice(3);
  update_invoice(4);
end;

/* TRIGGERS */
CREATE SEQUENCE category_seq;
CREATE SEQUENCE product_seq;
CREATE SEQUENCE invoice_seq;
CREATE SEQUENCE ship_seq;
CREATE SEQUENCE customer_seq;

create or replace TRIGGER category_tr
BEFORE INSERT ON category 
FOR EACH ROW

BEGIN
  SELECT category_seq.NEXTVAL
  INTO   :new.CategoryID
  FROM   dual;
END;


create or replace TRIGGER customer_tr
BEFORE INSERT ON customer
FOR EACH ROW

BEGIN
  SELECT customer_seq.NEXTVAL
  INTO   :new.CustomerID
  FROM   dual;
END;

/* Check */
create or replace TRIGGER invoice_tr
BEFORE INSERT ON invoice
FOR EACH ROW

BEGIN
  SELECT cp_inv_seq.NEXTVAL
  INTO   :new.InvoiceID
  FROM   dual;
END;


create or replace TRIGGER product_tr
BEFORE INSERT ON product
FOR EACH ROW

BEGIN
  SELECT product_seq.NEXTVAL
  INTO   :new.ProductID
  FROM   dual;
END;


create or replace TRIGGER ship_tr
BEFORE INSERT ON ship_option
FOR EACH ROW

BEGIN
  SELECT ship_seq.NEXTVAL
  INTO   :new.ShipID
  FROM   dual;
END;

/* PRODUCT_TRG */
create or replace trigger product_trg
  before update of quantity on product
  for each row
  when (OLD.Quantity = 0 and NEW.Quantity < 0)

begin
  :new.Quantity := 0;
   dbms_output.put_line('Quantity is out of stock');
end;

