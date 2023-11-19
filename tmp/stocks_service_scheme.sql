drop table if exists UserInfo;
drop table if exists StockInfo;
drop table if exists IndividualStockAcount;


create table UserInfo(ID text, PW text, Balance int, Deposit int,
primary key (ID));

create table StockInfo(StockCode text, StockName text, Category text, Price int,
primary key(StockCode));

create table IndividualStockAcount(ID int, StockCode text, StockName text, Category text, Count int,
primary key(ID, StockCode),
foreign key (ID) references UserInfo(ID),
foreign key (StockCode) references StockInfo(StockCode)
);

