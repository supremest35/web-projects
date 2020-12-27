
/* Drop Tables */

DROP TABLE SHOP_REVIEW_LIKE_USERS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOK_REVIEWS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOKS CASCADE CONSTRAINTS;
DROP TABLE SHOP_BOOK_CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE SHOP_USERS CASCADE CONSTRAINTS;




/* Create Tables */

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


CREATE TABLE SHOP_BOOK_CATEGORIES
(
	CATEGORY_NO number(7,0) NOT NULL,
	CATEGORY_NAME varchar2(100) NOT NULL,
	CATEGORY_TYPE varchar2(200),
	PRIMARY KEY (CATEGORY_NO)
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



/* Create Foreign Keys */

ALTER TABLE SHOP_BOOK_REVIEWS
	ADD FOREIGN KEY (BOOK_NO)
	REFERENCES SHOP_BOOKS (BOOK_NO)
;


ALTER TABLE SHOP_BOOKS
	ADD FOREIGN KEY (CATEGORY_NO)
	REFERENCES SHOP_BOOK_CATEGORIES (CATEGORY_NO)
;


ALTER TABLE SHOP_REVIEW_LIKE_USERS
	ADD FOREIGN KEY (REVIEW_NO)
	REFERENCES SHOP_BOOK_REVIEWS (REVIEW_NO)
;


ALTER TABLE SHOP_BOOK_REVIEWS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;


ALTER TABLE SHOP_REVIEW_LIKE_USERS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOP_USERS (USER_NO)
;



