CREATE DATABASE smartphonedb ;
USE smartphonedb ;

CREATE TABLE Brand (
    brandId    int(6) NOT NULL,
    brandName  VARCHAR(30) NOT NULL
);

ALTER TABLE Brand ADD CONSTRAINT brand_pk PRIMARY KEY ( brandId );
ALTER TABLE Brand ADD CONSTRAINT brand_uk UNIQUE KEY ( brandName );

CREATE TABLE Color (
    colorId     int(6) NOT NULL,
    colorName   VARCHAR(45) NOT NULL,
    colorCode  VARCHAR(7) NOT NULL
);

ALTER TABLE Color ADD CONSTRAINT color_pk PRIMARY KEY ( colorId );
ALTER TABLE Color ADD CONSTRAINT color_uk UNIQUE KEY ( colorCode );

CREATE TABLE ProductColor (
    productColorId  int(6) NOT NULL,
    productId       int(6) NOT NULL,
    colorId         int(6) NOT NULL
);

ALTER TABLE ProductColor ADD CONSTRAINT productcolor_pk PRIMARY KEY ( productColorId );

CREATE TABLE Product (
    productId           int(6) NOT NULL,
    productName         VARCHAR(80) NOT NULL,
    productDescription  VARCHAR(255) NOT NULL,
	productImage		VARCHAR(255) NOT NULL,
    price        	double(10, 2) NOT NULL,
    manufactureDate DATE NOT NULL,
    brandId             int(6) NOT NULL
);

ALTER TABLE Product ADD CONSTRAINT product_pk PRIMARY KEY ( productId );
ALTER TABLE Product ADD CONSTRAINT prodcut_uk UNIQUE KEY ( productName );

ALTER TABLE ProductColor
    ADD CONSTRAINT productcolor_color_fk FOREIGN KEY ( colorId )
        REFERENCES Color ( colorId );

ALTER TABLE ProductColor
    ADD CONSTRAINT productcolor_product_fk FOREIGN KEY ( productId )
        REFERENCES Product ( productId );

ALTER TABLE Product
    ADD CONSTRAINT product_brand_fk FOREIGN KEY ( brandId )
        REFERENCES Brand ( brandId );
        
create user user132@'%' identified by 'user132' ; 			   
grant select on smartphonedb.brand to user132@'%'; 			  
grant select on smartphonedb.color to user132@'%'; 			
grant select,insert,update,delete on smartphonedb.product to user132@'%';