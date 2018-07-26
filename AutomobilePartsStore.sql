CREATE Table category
(   CategoryID      NUMERIC(3),
    CategoryName    VARCHAR(25),  
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

SELECT * FROM category;

/* PRODUCT */
CREATE Table product
(   ProductID           NUMERIC(5),
    Name                VARCHAR(25),
    ShortDescription    VARCHAR(25),
    LongDescription     VARCHAR(100),
    CategoryID          NUMERIC(3),
    ImageFile           VARCHAR(10),
    Price               NUMERIC(8,2),
    Quantity            NUMERIC(5),
    
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

EXEC sp_columns product;
SELECT * FROM product;


/* INVOICE */
CREATE TABLE customer
(   CustomerID          NUMERIC(8),
    CustomerMail        VARCHAR(25),
    CustomerPass        VARCHAR(25),
    FirstName           VARCHAR(25),
    LastName            VARCHAR(25),
    Address             VARCHAR(25),
    City                VARCHAR(25),
    State               VARCHAR(25),
    Zip                 VARCHAR(25),
    
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

EXEC sp_columns customer;
SELECT * FROM customer;


/* INVOICE */
CREATE TABLE invoice
(   InvoiceID           NUMERIC(8),
    CustomerID          NUMERIC(8),
    OrderDate           DATE,
    Subtotal            NUMERIC(8,2),
    ShippingPrice       NUMERIC(8,2),
    SalesTax            NUMERIC(8,2),
    Total               NUMERIC(8,2),
    ShipOption          NUMERIC(2),
    
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

EXEC sp_columns invoice;
SELECT * FROM invoice;


/* MYCART_ITEM */
CREATE Table mycart_item
(   InvoiceID    NUMERIC(8),
    ProductID    NUMERIC(5),
    Price        NUMERIC(8,2),
    Quantity     NUMERIC(2),
    Subtotal     NUMERIC(8,2),
    
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

EXEC sp_columns mycart_item;
SELECT * FROM mycart_item;


/* SHIP OPTION */
CREATE Table ship_option
(   ShipID      NUMERIC(1),
    ShipOption  VARCHAR(25),
    ShipPrice   NUMERIC(8,2),
    
    CONSTRAINT ship_option_shipID_pk PRIMARY KEY (ShipID));

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (1, 'Express', 40.00);

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (2, 'Priority', 30.00);

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (3, 'Business', 20.00);

INSERT INTO ship_option (ShipID, ShipOption, ShipPrice)
    VALUES (4, 'Economy', 10.00);

EXEC sp_columns ship_option;
SELECT * FROM ship_option;


/* SALES */
CREATE Table sales
(   ProductID       NUMERIC(5),
    SalesPercent    NUMERIC(3,2),
    
    CONSTRAINT sales_productID_fk FOREIGN KEY (ProductID)
        REFERENCES product (ProductID));

INSERT INTO sales (ProductID, SalesPercent)
    VALUES (1, 0.1);

INSERT INTO sales (ProductID, SalesPercent)
    VALUES (2, 0.05);

INSERT INTO sales (ProductID, SalesPercent)
    VALUES (3, 0.15);

EXEC sp_columns sales;
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
 end salefactor;
