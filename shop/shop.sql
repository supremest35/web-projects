
/* Drop Triggers */

DROP TRIGGER TRI_SHOP_BANK_CARD_COMPANIES_BANK_NO;
DROP TRIGGER TRI_SHOP_BOOK_CART_ITEMS_CART_ITEM_NO;
DROP TRIGGER TRI_SHOP_BOOK_ORDERS_ORDER_NO;
DROP TRIGGER TRI_SHOP_BOOK_ORDER_ITEMS_ORDER_ITEM_NO;
DROP TRIGGER TRI_SHOP_USER_POINT_HISTORY_HISTORY_NO;



/* Drop Tables */

DROP TABLE SHOP_BOOK_ORDER_ITEMS CASCADE CONSTRAINTS;
DROP TABLE SHOP_USER_POINT_HISTORY CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOK_ORDERS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BANK_CARD_COMPANIES CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOK_CART_ITEMS CASCADE CONSTRAINTS;
DROP TABLE SHOP_REVIEW_LIKE_USERS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOK_REVIEWS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOKS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOK_CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE SHOP_USERS CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_SHOP_BANK_CARD_COMPANIES_BANK_NO;
DROP SEQUENCE SEQ_SHOP_BOOK_CART_ITEMS_CART_ITEM_NO;
DROP SEQUENCE SEQ_SHOP_BOOK_ORDERS_ORDER_NO;
DROP SEQUENCE SEQ_SHOP_BOOK_ORDER_ITEMS_ORDER_ITEM_NO;
DROP SEQUENCE SEQ_SHOP_USER_POINT_HISTORY_HISTORY_NO;




/* Create Sequences */

CREATE SEQUENCE SEQ_SHOP_BANK_CARD_COMPANIES_BANK_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SHOP_BOOK_CART_ITEMS_CART_ITEM_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SHOP_BOOK_ORDERS_ORDER_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SHOP_BOOK_ORDER_ITEMS_ORDER_ITEM_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SHOP_USER_POINT_HISTORY_HISTORY_NO INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE SHOP_BANK_CARD_COMPANIES
(
	BANK_NO number(2,0) NOT NULL,
	BANK_NAME varchar2(100) NOT NULL,
	PRIMARY KEY (BANK_NO)
);


CREATE TABLE SHOP_BOOKS
(
	BOOK_NO number(7,0) NOT NULL,
	CATEGORY_NO number(7,0) NOT NULL,
	BOOK_TITLE varchar2(200) NOT NULL,
	BOOK_WRITER varchar2(200) NOT NULL,
	BOOK_TRANSLATOR varchar2(200),
	BOOK_PUBLISHER varchar2(200) NOT NULL,
	BOOK_PUB_DATE date NOT NULL,
	BOOK_PRICE number(7,0) NOT NULL,
	BOOK_DISCOUNT_PRICE number(7,0) NOT NULL,
	BOOK_DISCOUNT_RATE number(3,2) DEFAULT 0.0,
	BOOK_POINT_RATE number(3,2) DEFAULT 0.0,
	BOOK_STATUS varchar2(100) DEFAULT '재고있음' NOT NULL,
	BOOK_REVIEW_COUNT number(7,0) DEFAULT 0 NOT NULL,
	BOOK_REVIEW_POINT number(3,1) DEFAULT 0.0 NOT NULL,
	BOOK_BEST char DEFAULT 'N',
	BOOK_CREATED_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (BOOK_NO)
);


CREATE TABLE SHOP_BOOK_CART_ITEMS
(
	CART_ITEM_NO number(7,0) NOT NULL,
	BOOK_NO number(7,0) NOT NULL,
	USER_NO number(7,0) NOT NULL,
	CART_ITEM_AMOUNT number(7,0) NOT NULL,
	CART_ITEM_CREATED_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (CART_ITEM_NO)
);


CREATE TABLE SHOP_BOOK_CATEGORIES
(
	CATEGORY_NO number(7,0) NOT NULL,
	CATEGORY_NAME varchar2(100) NOT NULL,
	CATEGORY_TYPE varchar2(200),
	PRIMARY KEY (CATEGORY_NO)
);


CREATE TABLE SHOP_BOOK_ORDERS
(
	ORDER_NO number(7,0) NOT NULL,
	USER_NO number(7,0) NOT NULL,
	ORDER_AMOUNT number(7,0) NOT NULL,
	-- 주문상태는 결재완료, 배송시작, 배송중, 배송완료, 취소 중의 하나다.
	ORDER_STATUS varchar2(100) DEFAULT '결재완료',
	ORDER_RECIPIENT_NAME varchar2(100) NOT NULL,
	ORDER_RECIPIENT_TEL varchar2(20) NOT NULL,
	ORDER_RECIPIENT_ZIPCODE char(5) NOT NULL,
	ORDER_RECIPIENT_ADDRESS varchar2(200),
	ORDER_MESSAGE varchar2(500),
	TOTAL_ORDER_PRICE number(7,0) NOT NULL,
	USED_POINT_AMOUNT number(7,0),
	TOTAL_PAYMENT_PRICE number(7,0) NOT NULL,
	BANK_NO number(2,0) NOT NULL,
	BANK_CARD_ACCOUNT varchar2(50) NOT NULL,
	ORDER_CREATED_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (ORDER_NO)
);


CREATE TABLE SHOP_BOOK_ORDER_ITEMS
(
	ORDER_ITEM_NO number(7,0) NOT NULL,
	ORDER_NO number(7,0) NOT NULL,
	BOOK_NO number(7,0) NOT NULL,
	ITEM_PRICE number(7,0) NOT NULL,
	ORDER_ITEM_AMOUNT number(7,0) NOT NULL,
	PRIMARY KEY (ORDER_ITEM_NO)
);


CREATE TABLE SHOP_BOOK_REVIEWS
(
	REVIEW_NO number(7,0) NOT NULL,
	BOOK_NO number(7,0) NOT NULL,
	USER_NO number(7,0) NOT NULL,
	REVIEW_TITLE varchar2(200) NOT NULL,
	REVIEW_CONTENT varchar2(500) NOT NULL,
	REVIEW_POINT number(7,0) DEFAULT 0 NOT NULL,
	REVIEW_LIKE_COUNT number(7,0) DEFAULT 0 NOT NULL,
	REVIEW_CREATE_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (REVIEW_NO)
);


CREATE TABLE SHOP_REVIEW_LIKE_USERS
(
	USER_NO number(7,0) NOT NULL,
	REVIEW_NO number(7,0) NOT NULL
);


CREATE TABLE SHOP_USERS
(
	USER_NO number(7,0) NOT NULL,
	USER_ID varchar2(100) NOT NULL UNIQUE,
	USER_PASSWORD char(64) NOT NULL,
	USER_NAME varchar2(200) NOT NULL,
	USER_TEL varchar2(20) NOT NULL,
	USER_EMAIL varchar2(200) NOT NULL UNIQUE,
	USER_GRADE varchar2(10) DEFAULT 'bronze' NOT NULL,
	USER_POINT number(7,0) DEFAULT 0 NOT NULL,
	USER_STATUS char DEFAULT 'N' NOT NULL,
	USER_CREATED_DATE date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (USER_NO)
);


CREATE TABLE SHOP_USER_POINT_HISTORY
(
	HISTORY_NO number(7,0) NOT NULL,
	USER_NO number(7,0) NOT NULL,
	HISTORY_CONTENT varchar2(200) NOT NULL,
	ORDER_NO number(7,0),
	HISTORY_POINT_AMOUNT number(7,0) NOT NULL,
	HISTORY_CREATED_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (HISTORY_NO)
);



/* Create Foreign Keys */

ALTER TABLE SHOP_BOOK_ORDERS
	ADD FOREIGN KEY (BANK_NO)
	REFERENCES SHOP_BANK_CARD_COMPANIES (BANK_NO)
;


ALTER TABLE SHOP_BOOK_CART_ITEMS
	ADD FOREIGN KEY (BOOK_NO)
	REFERENCES SHOP_BOOKS (BOOK_NO)
;


ALTER TABLE SHOP_BOOK_ORDER_ITEMS
	ADD FOREIGN KEY (BOOK_NO)
	REFERENCES SHOP_BOOKS (BOOK_NO)
;


ALTER TABLE SHOP_BOOK_REVIEWS
	ADD FOREIGN KEY (BOOK_NO)
	REFERENCES SHOP_BOOKS (BOOK_NO)
;


ALTER TABLE SHOP_BOOKS
	ADD FOREIGN KEY (CATEGORY_NO)
	REFERENCES SHOP_BOOK_CATEGORIES (CATEGORY_NO)
;


ALTER TABLE SHOP_BOOK_ORDER_ITEMS
	ADD FOREIGN KEY (ORDER_NO)
	REFERENCES SHOP_BOOK_ORDERS (ORDER_NO)
;


ALTER TABLE SHOP_USER_POINT_HISTORY
	ADD FOREIGN KEY (ORDER_NO)
	REFERENCES SHOP_BOOK_ORDERS (ORDER_NO)
;


ALTER TABLE SHOP_REVIEW_LIKE_USERS
	ADD FOREIGN KEY (REVIEW_NO)
	REFERENCES SHOP_BOOK_REVIEWS (REVIEW_NO)
;


ALTER TABLE SHOP_BOOK_CART_ITEMS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;


ALTER TABLE SHOP_BOOK_ORDERS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;


ALTER TABLE SHOP_BOOK_REVIEWS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;


ALTER TABLE SHOP_REVIEW_LIKE_USERS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;


ALTER TABLE SHOP_USER_POINT_HISTORY
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_SHOP_BANK_CARD_COMPANIES_BANK_NO BEFORE INSERT ON SHOP_BANK_CARD_COMPANIES
FOR EACH ROW
BEGIN
	SELECT SEQ_SHOP_BANK_CARD_COMPANIES_BANK_NO.nextval
	INTO :new.BANK_NO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SHOP_BOOK_CART_ITEMS_CART_ITEM_NO BEFORE INSERT ON SHOP_BOOK_CART_ITEMS
FOR EACH ROW
BEGIN
	SELECT SEQ_SHOP_BOOK_CART_ITEMS_CART_ITEM_NO.nextval
	INTO :new.CART_ITEM_NO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SHOP_BOOK_ORDERS_ORDER_NO BEFORE INSERT ON SHOP_BOOK_ORDERS
FOR EACH ROW
BEGIN
	SELECT SEQ_SHOP_BOOK_ORDERS_ORDER_NO.nextval
	INTO :new.ORDER_NO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SHOP_BOOK_ORDER_ITEMS_ORDER_ITEM_NO BEFORE INSERT ON SHOP_BOOK_ORDER_ITEMS
FOR EACH ROW
BEGIN
	SELECT SEQ_SHOP_BOOK_ORDER_ITEMS_ORDER_ITEM_NO.nextval
	INTO :new.ORDER_ITEM_NO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SHOP_USER_POINT_HISTORY_HISTORY_NO BEFORE INSERT ON SHOP_USER_POINT_HISTORY
FOR EACH ROW
BEGIN
	SELECT SEQ_SHOP_USER_POINT_HISTORY_HISTORY_NO.nextval
	INTO :new.HISTORY_NO
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN SHOP_BOOK_ORDERS.ORDER_STATUS IS '주문상태는 결재완료, 배송시작, 배송중, 배송완료, 취소 중의 하나다.';



