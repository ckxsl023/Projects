CREATE TABLE DimCustomer 
(
    CustomerID INT PRIMARY KEY,
    CustomerAltID VARCHAR(10) NOT NULL,
    CustomerName VARCHAR(50),
    Gender VARCHAR(20)
);

DELETE FROM DimCustomer; --Removes redundant Data When Script is Run Again

INSERT INTO DimCustomer
(CustomerID, CustomerAltID, CustomerName, Gender)
VALUES
(1, 'IMI-001','Henry Ford','M');

INSERT INTO DimCustomer
(CustomerID, CustomerAltID, CustomerName, Gender)
VALUES
(2, 'IMI-002','Bill Gates','M');

INSERT INTO DimCustomer
(CustomerID, CustomerAltID, CustomerName, Gender)
VALUES
(3, 'IMI-003','Muskan Shaikh','F');

INSERT INTO DimCustomer
(CustomerID, CustomerAltID, CustomerName, Gender)
VALUES
(4, 'IMI-004','Richard Thrubin','M');

INSERT INTO DimCustomer
(CustomerID, CustomerAltID, CustomerName, Gender)
VALUES
(5, 'IMI-005','Emma Wattson','F');

CREATE TABLE DimProduct 
(
    ProductKey INT PRIMARY KEY,
    ProductAltKey VARCHAR(10) NOT NULL,
    ProductName VARCHAR(100),
    ProductActualCost NUMBER(*,2),
    ProductSalesCost NUMBER(*,2)
);

DELETE FROM DimProduct; 

INSERT INTO DimProduct
(ProductKey, ProductAltKey, ProductName, ProductActualCost, ProductSalesCost)
VALUES
(1,'ITM-001','Wheat Floor 1kg',5.50,6.50);

INSERT INTO DimProduct
(ProductKey, ProductAltKey, ProductName, ProductActualCost, ProductSalesCost)
VALUES
(2,'ITM-002','Rice Grains 1kg',22.50,24);

INSERT INTO DimProduct
(ProductKey, ProductAltKey, ProductName, ProductActualCost, ProductSalesCost)
VALUES
(3,'ITM-003','SunFlower Oil 1 ltr',42,43.5);

INSERT INTO DimProduct
(ProductKey, ProductAltKey, ProductName, ProductActualCost, ProductSalesCost)
VALUES
(4,'ITM-004','Nirma Soap',18,20);

INSERT INTO DimProduct
(ProductKey, ProductAltKey, ProductName, ProductActualCost, ProductSalesCost)
VALUES
(5,'ITM-005','Arial Washing Powder 1kg',135,139);

CREATE TABLE DimStores
(
    StoreID INT PRIMARY KEY,
    StoreAltID VARCHAR(10) NOT NULL,
    StoreName VARCHAR(100),
    StoreLocation  VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

DELETE FROM DimStores;

INSERT INTO DimStores
(StoreID, StoreAltID, StoreName, StoreLocation, City, State, Country)
VALUES
(1,'LOC-A1','LandMart','EDSA','Quezon City', 'Metro Manila','Philippines');

INSERT INTO DimStores
(StoreID, StoreAltID, StoreName, StoreLocation, City, State, Country)
VALUES
(2,'LOC-A2','LandMart','Ayala Avenue','Makati City', 'Metro Manila','Philippines');

INSERT INTO DimStores
(StoreID, StoreAltID, StoreName, StoreLocation, City, State, Country)
VALUES
(3,'LOC-A3','LandMart','Zapote Road','Muntinlupa','Metro Manila','Philippines');

CREATE TABLE DimSalesPerson
(
    SalesPersonID INT PRIMARY KEY,
    SalesPersonAltID VARCHAR(10) NOT NULL,
    SalesPersonName VARCHAR(100),
    StoreID INT,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

DELETE FROM DimSalesPerson;

INSERT INTO DimSalesPerson
(SalesPersonID, SalesPersonAltID,SalesPersonName, StoreID, City, State, Country)
VALUES
(1,'SP-DMSPR1','Kelly',1,'Quezon City', 'Metro Manila','Philippines') ;

INSERT INTO DimSalesPerson
(SalesPersonID, SalesPersonAltID,SalesPersonName, StoreID, City, State, Country)
VALUES
(2,'SP-DMSPR2','Joel',1,'Quezon City', 'Metro Manila','Philippines');

INSERT INTO DimSalesPerson
(SalesPersonID, SalesPersonAltID,SalesPersonName, StoreID, City, State, Country)
VALUES
(3,'SP-DMNGR1','Christine',2,'Quezon City', 'MetroManila','Philippines');

INSERT INTO DimSalesPerson
(SalesPersonID, SalesPersonAltID,SalesPersonName, StoreID, City, State, Country)
VALUES
(4,'SP-DMNGR2','Paul',2,'Quezon City', 'Metro Manila','Philippines');

INSERT INTO DimSalesPerson
(SalesPersonID, SalesPersonAltID,SalesPersonName, StoreID, City, State, Country)
VALUES
(5,'SP-DMSVR1','Julio',3,'Quezon City', 'Metro Manila','Philippines');

INSERT INTO DimSalesPerson
(SalesPersonID, SalesPersonAltID,SalesPersonName, StoreID, City, State, Country)
VALUES
(6,'SP-DMSVR2','Sally',3,'Quezon City', 'MetroManila','Philippines');

CREATE TABLE DimDate
(
    DateKey INT NOT NULL,
    FullDate VARCHAR(100) NULL,
    DayOfMonth VARCHAR(2) NULL,
    DaySuffix VARCHAR(4) NULL,
    DayName VARCHAR(9) NULL,
    DayOfWeekInMonth VARCHAR(2) NULL,
    DayOfWeekInYear VARCHAR(2) NULL,
    DayOfQuarter VARCHAR(3) NULL,
    DayOfYear VARCHAR(3) NULL,
    WeekOfMonth VARCHAR(1) NULL,
    WeekOfQuarter VARCHAR(2) NULL,
    WeekOfYear VARCHAR(2) NULL,
    FullMonth VARCHAR(2) NULL,
    MonthName VARCHAR(9) NULL,
    MonthOfQuarter VARCHAR(2) NULL,
    Quarter CHAR(1) NULL,
    QuarterName VARCHAR(9) NULL,
    FullYear VARCHAR(4) NULL,
    YearName VARCHAR(7) NULL,
    MonthYear VARCHAR(10) NULL,
    MMYYYY CHAR(6) NULL,
    FirstDayOfMonth DATE NULL,
    LastDayOfMonth DATE NULL,
    FirstDayOfQuarter DATE NULL,
    LastDayOfQuarter DATE NULL,
    FirstDayOfYear DATE NULL,
    LastDayOfYear DATE NULL,
    IsWeekday CHAR(1) NULL
);

DELETE FROM DimDate;

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130101,2013-01-01. 00:00:00.000,1,1st,Tuesday,1,1,1,1,1,1,1,1,January,1,1,First,2013,CY 2013,Jan2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130102,2013-01-0200:00:00.000,2,2nd,Wednesday,1,1,1,2,1,1,1,1,January,1,1,First,2013,CY2013,Jan-2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130103,2013-01-0300:00:00.000,3,3rd,Thursday,1,1,1,3,1,1,1,1,January,1,1,First,2013,CY 2013,Jan2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130104,2013-01-0400:00:00.000,4,4th,Friday,1,1,1,4,1,1,1,1,January,1,1,First,2013,CY 2013,Jan2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130105,2013-01-0500:00:00.000,5,5th,Saturday,1,1,1,5,1,1,1,1,January,1,1,First,2013,CY 2013,Jan2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,0);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130106,2013-01-0600:00:00.000,6,6th,Sunday,1,1,1,6,2,1,2,1,January,1,1,First,2013,CY 2013,Jan2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,0);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130107,2013-01-0700:00:00.000,7,7th,Monday,1,1,1,7,2,1,2,1,January,1,1,First,2013,CY 2013,Jan2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130108,2013-01-0800:00:00.000,8,8th,Tuesday,2,2,2,8,2,2,2,1,January,1,1,First,2013,CY 2013,Jan2013,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130109,2013-01-0900:00:00.000,9,9th,Wednesday,2,2,2,9,2,2,2,1,January,1,1,First,2013,CY2013,Jan-2013,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

INSERT INTO DimDate
(DateKey,FullDate,DayOfMonth,DaySuffix,DayName,DayOfWeekInMonth,DayOfWeekInYear,DayOfQuarter,DayOfYear,WeekOfMonth,WeekOfQuarter,WeekOfYear,FullMonth,MonthName,MonthOfQuarter,Quarter,QuarterName,FullYear,YearName,MonthYear,MMYYYY,FirstDayOfMonth,LastDayOfMonth,FirstDayOfQuarter,LastDayOfQuarter,FirstDayOfYear,LastDayOfYear,IsWeekday )
VALUES
(20130110,2013-01-1000:00:00.000,10,10th,Thursday,2,2,2,10,2,2,2,1,January,1,1,First,2013,CY2013,Jan-2013 ,012013,2013-01-01,2013-01-31,2013-01-01,2013-03-31,2013-01-01,2013-12-31,1);

CREATE TABLE FactProductSales
(
    TransactionId INT PRIMARY KEY,
    SalesInvoiceNumber INT NOT NULL,
    SalesDateKey INT,
    SalesTimeKey INT,
    SalesTimeAltKey INT,
    StoreID INT NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    SalesPersonID INT NOT NULL,
    Quantity FLOAT,
    SalesTotalCost FLOAT,
    ProductActualCost FLOAT,
    Deviation FLOAT
);

DELETE FROM FactProductSales;

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(1,1,20130101,44347,121907,1,1,1,1,2,11,13,2);


INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(2,1,20130101,44347,121907,1,1,2,1,1,22.50,24,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(3,1,20130101,44347,121907,1,1,3,1,1,42,43.5,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(4,2,20130101,44519,122159,1,2,3,1,1,42,43.5,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(5,2,20130101,44519,122159,1,2,4,1,3,54,60,6);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(6,3,20130101,52415,143335,1,3,2,2,2,11,13,2);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(7,3,20130101,52415,143335,1,3,3,2,1,42,43.5,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(8,3,20130101,52415,143335,1,3,4,2,3,54,60,6);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(9,3,20130101,52415,143335,1,3,5,2,1,135,139,4);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(10,4,20130102,44347,121907,1,1,1,1,2,11,13,2);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(11,4,20130102,44347,121907,1,1,2,1,1,22.50,24,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(12,5,20130102,44519,122159,1,2,3,1,1,42,43.5,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(13,5,20130102,44519,122159,1,2,4,1,3,54,60,6);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(14,6,20130102,52415,143335,1,3,2,2,2,11,13,2);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(15,6,20130102,52415,143335,1,3,5,2,1,135,139,4);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(16,7,20130102,44347,121907,2,1,4,3,3,54,60,6);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(17,7,20130102,44347,121907,2,1,5,3,1,135,139,4);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(18,8,20130103,59326,162846,1,1,3,1,2,84,87,3);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(19,8,20130103,59326,162846,1,1,4,1,3,54,60,3);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(20,9,20130103,59349,162909,1,2,1,1,1,5.5,6.5,1);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(21,9,20130103,59349,162909,1,2,2,1,1,22.50,24,1.5);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(22,10,20130103,67390,184310,1,3,1,2,2,11,13,2);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(23,10,20130103,67390,184310,1,3,4,2,3,54,60,6);


INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(24,11,20130103,74877,204757,2,1,2,3,1,5.5,6.5,1);

INSERT INTO FactProductSales
(TransactionId, SalesInvoiceNumber,SalesDateKey,SalesTimeKey,SalesTimeAltKey,StoreID,CustomerID,ProductID,SalesPersonID,Quantity,SalesTotalCost,ProductActualCost,Deviation)
VALUES
(25,11,20130103,74877,204757,2,1,3,3,1,42,43.5,1.5);
