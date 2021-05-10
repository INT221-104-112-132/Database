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

insert into Brand values (112001,'VIVO');
insert into Brand values (112002,'Samsung');
insert into Brand values (112003,'OPPO');
insert into Brand values (112004,'Nokia');
insert into Brand values (112005,'Xiaomi');
insert into Brand values (112006,'Apple');
insert into Brand values (112007,'Asus');
insert into Brand values (112008,'Huawei');
insert into Brand values (112009,'Acer');
insert into Brand values (112010,'Lenovo');
insert into Brand values (112011,'HP');
insert into Brand values (112012,'Sony');
insert into Brand values (112013,'Panasonic');
insert into Brand values (112014,'Realme');
insert into Brand values (112015,'Google');

insert into  Product 
values (104001,'VIVO V7','smartphone1','p01.jpg',5900,DATE('2017-12-11'),'112001');
insert into Product
values (104002,'Samsung Galaxy Note A20s','smartphone2','p02.jpg',5300,DATE('2018-03-09'),112002);
insert into Product
values (104003,'OPPO A15','smartphone3','p03.jpg',7990, DATE('2017-03-06'),112003);
insert into Product
values (104004,'Nokia C10','smartphone4','p04.jpg',9990, DATE('2016-07-16'),112004);
insert into Product
values (104005,'Xiaomi Mi 11','smartphone5','p05.jpg',10900, DATE('2019-07-30'),112005);
insert into  Product
values (104006,'Apple IPhone 10','smartphone6','p06.jpg',10900, DATE('2019-06-08'),112006);
insert into Product
values (104007,'ASUS Zenfone 6','smartphone7','p07.jpg',7990, DATE('2018-09-17'),112007);
insert into Product
values (104008,'Huawei nova 8SE','smartphone8','p08.jpg',7990,DATE('2018-03-06'),112008);
insert into Product
values (104009,'Acer Liquid Zest','smartphone9','p09.jpg',6900, DATE('2018-03-04'),'112009');
insert into Product
values (104010,'Lenovo A6 Note','smartphone10','p10.jpg',7990, DATE('2017-04-23'),'112010');
insert into Product 
values (104011,'HP 7 Plus','smartphone11','p11.jpg',7990, DATE('2018-01-15'),112011);
insert into Product
values (104012,'Sony Xperia 1 II','smartphone12','p12.jpg',12990, DATE('2018-05-01'),'112012');
insert into Product
values (104013,'Panasonic P95','smartphone13','p13.jpg',12990, DATE('2018-04-12'),112013);
insert into Product
values (104014,'Realme 8 Pro','smartphone14','p14.jpg',6900, DATE('2017-12-11'),112014);
insert into Product
values (104015,'Google Pixel XL','smartphone15','p15.jpg',7990, DATE('2019-04-17'),112015);

insert into Color values (132001,'White','#FFFFFF');
insert into Color values (132002,'Black','#000000');
insert into Color values (132003,'Red','#FF0000');
insert into Color values (132004,'Blue','#0000FF');
insert into Color values (132005,'Yellow','#FFFF00');
insert into Color values (132006,'Green','#008000');
insert into Color values (132007,'Orange','#FFA500');
insert into Color values (132008,'Gold','#FFD700');
insert into Color values (132009,'Silver','#C0C0C0');
insert into Color values (132010,'Gray','#808080');

insert into ProductColor values (412001,104001,132001);
insert into ProductColor values (412002,104001,132002);
insert into ProductColor values (412003,104001,132003);
insert into ProductColor values (412004,104001,132004);
insert into ProductColor values (412005,104001,132005);
insert into ProductColor values (412006,104001,132006);
insert into ProductColor values (412007,104001,132007);
insert into ProductColor values (412008,104001,132008);
insert into ProductColor values (412009,104001,132009);
insert into ProductColor values (412010,104001,132010);
insert into ProductColor values (412011,104001,132001);
insert into ProductColor values (412012,104001,132002);
insert into ProductColor values (412013,104001,132003);
insert into ProductColor values (412014,104001,132004);
insert into ProductColor values (412015,104001,132005);



create user user132@'%' identified by 'user132' ; 			   
grant select on smartphonedb.brand to user132@'%'; 			  
grant select on smartphonedb.color to user132@'%'; 			
grant select,insert,update,delete on smartphonedb.product to user132@'%';
