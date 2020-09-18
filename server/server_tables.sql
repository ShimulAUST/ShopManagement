CREATE TABLE EMPLOYER(
EMPLOYER_ID INT NOT NULL,
EMPLOYER_NAME VARCHAR(30) NOT NULL,
EMPLOYER_EMAIL VARCHAR(30) NOT NULL UNIQUE,
PRIMARY KEY(EMPLOYER_ID)
);

CREATE SEQUENCE EMPLOYER_ID MINVALUE 500 START WITH 500 CACHE 10;



CREATE TABLE CUSTOMER(
CUSTOMER_ID INT NOT NULL,
CUSTOMER_EMAIL VARCHAR(30) NOT NULL UNIQUE,
CUSTOMER_PHONENO VARCHAR(12) NOT NULL,
CUSTOMER_ADDRESS VARCHAR(50) NULL,
PRIMARY KEY(CUSTOMER_ID)
);


CREATE SEQUENCE CUSTOMER_ID MINVALUE 10000 START WITH 10000 CACHE 10;


CREATE TABLE BUYING_DETAILS(
PURCHASE_ID INT NOT NULL,
PURCHASE_PRODUCT VARCHAR(100) NOT NULL,
PURCHASE_QUANTITY INT NOT NULL,
PURCHASE_PRICE DECIMAL(10,2) NOT NULL,
CUSTOMER_ID INT NOT NULL,
EMPLOYER_ID INT NOT NULL,
FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
FOREIGN KEY(EMPLOYER_ID) REFERENCES EMPLOYER(EMPLOYER_ID),
PRIMARY KEY(PURCHASE_ID) 
);

CREATE SEQUENCE PURCHASE_ID MINVALUE 1 START WITH 1 CACHE 10;

commit;
