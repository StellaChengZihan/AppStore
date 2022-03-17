/*******************

  Create the schema

********************/

CREATE TABLE IF NOT EXISTS accounts (
 name VARCHAR(64) NOT NULL,
 accountid VARCHAR(16) PRIMARY KEY,
 ishost BOOLEAN NOT NULL);
	
CREATE TABLE IF NOT EXISTS catalog(
 accountid VARCHAR(16) NOT NULL,
 room_name VARCHAR(64) NOT NULL,
 id VARCHAR(16) PRIMARY KEY,
 neighborhood VARCHAR(64) NOT NULL,
 room_type VARCHAR(64) NOT NULL,
 price NUMERIC NOT NULL;
  
/* 
CREATE TABLE downloads(
 customerid VARCHAR(16) REFERENCES customers(customerid) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
 name VARCHAR(32),
 version CHAR(3),
 PRIMARY KEY (customerid, name, version),
 FOREIGN KEY (name, version) REFERENCES games(name, version) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED);*/
