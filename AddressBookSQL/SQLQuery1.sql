------- UC1 --------------------------
CREATE DATABASE AddressBookDB;
use AddressBookDB;

------- UC2 --------------------------
CREATE TABLE AddressBook
(
ID				int identity(1, 1),
FirstName		varchar(55),
LastName		varchar(55),
Address			varchar(100),
City			varchar(40),
State			varchar(40),
Zip				int,
PhoneNumber	    varchar(14),
Email			varchar(50),
PRIMARY KEY(ID)
)

------- UC3 --------------------------
INSERT INTO AddressBook(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email)VALUES
('Dipesh', 'Walte', 'Ravet', 'Pune', 'Maharashtra', '411033', '9422421318', 'dipeshwalte@gmail.com'),
('Dhanesh', 'Walte', 'Ravet', 'Pune', 'Maharashtra', '411033', '9422421315', 'dhaenshwalte@gmail.com'),
('Pooja', 'Walte', 'Parkside', 'Mumbai', 'Maharashtra', '411033', '9422421314', 'poojawalte@gmail.com'),
('Bunty', 'Walte', 'Parkside', 'Mumbai', 'Maharashtra', '411033', '9422421313', 'buntywalte@gmail.com'),
('Pratibha', 'Walte', 'Ravet', 'Pune', 'Maharashtra', '411033', '9422421316', 'pratibha2walte@gmail.com'),
('Ramdas', 'Walte', 'Ravet', 'Pune', 'Maharashtra', '411033', '9422421311', 'ramdas4walte@gmail.com');



SELECT * FROM AddressBook;

------- UC4 --------------------------
UPDATE AddressBook SET PhoneNumber = '8888888888' WHERE FirstName = 'Dipesh'
SELECT * FROM AddressBook;

------- UC5 --------------------------
DELETE FROM AddressBook WHERE FirstName = 'Bunty';
SELECT * FROM AddressBook;

------- UC6 --------------------------
SELECT * FROM AddressBook WHERE City = 'Pune';
SELECT * FROM AddressBook WHERE State = 'Maharashtra';


------- UC7 --------------------------
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM AddressBook GROUP BY City;
SELECT STATE, COUNT(STATE) AS STATE_COUNT FROM AddressBook GROUP BY State;

------- UC8 --------------------------
SELECT * FROM AddressBook WHERE CITY = 'Pune' ORDER BY FirstName;

------- UC9 --------------------------
ALTER table AddressBook ADD Name AS FirstName+' '+LastName;
ALTER table AddressBook ADD Type VARCHAR(20);
SELECT * FROM AddressBook;
UPDATE AddressBook SET Type = 'FRIENDS';
UPDATE AddressBook SET Type = 'FAMILY' WHERE FirstName = 'Pratibha' or FirstName = 'Ramdas';
UPDATE AddressBook SET Type = 'PROFESSION' WHERE FirstName = 'Dipesh';
SELECT * FROM AddressBook;

------- UC10 --------------------------
SELECT Type, COUNT(*) AS TYPE_COUNT FROM AddressBook GROUP BY Type;

--------------- UC11 ---------------------------------

INSERT INTO  AddressBook (FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email , Type)VALUES
('Dipesh', 'Walte', 'Ravet', 'Pune', 'Maharashtra', '411033', '9422421318', 'dipeshwalte@gmail.com', 'FAMILY');


--------------- UC12 ---------------------------------
------------Refactoring Type Attribute----------------
SELECT Id,Type INTO TypeTable FROM AddressBook  
SELECT * FROM TypeTable
ALTER TABLE AddressBook Drop column Type
SELECT * FROM AddressBook;
------------------------------------------------------

----------------- UC10 -------------------------------------
SELECT Type, COUNT(*) AS TYPE_COUNT FROM TypeTable GROUP BY Type;