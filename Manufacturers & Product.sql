show databases;	
create  database class;
use class;						# Use DB
show tables;

# Table 1
create table Manufacturers(				#  Create DB Name  Manufactureers
Code int(1),
Name varcharacter(20)
);

insert into Manufacturers(Code,Name)
values(1,"Sony"),
(2,"Creative Labs"),
(3,"Hewlett-Packard"),
(4,"Iomega"),
(5,"Fujitsu"),
(6,"Winchester");
select * from manufacturers;
		
# Table 2
create table Product(
Code int(2),
Name character(20),
Price int(5),
Manufacturers int(2)
);

insert into Product(Code, Name, Price, Manufacturers)
values(1, "Hard drive",240,5),
(2, "Memory",120,6),
(3, "ZIP drive",150,4),
(4, "Floppy disk",5,6),
(5, "Monitor",240,1),
(6, "DVD drive",180,2),
(7, "CD drive",90,2),
(8, "Printer",270,3),
(9, "Printer",66,3),
(10, "DVD burner",180,2);
select * from Product;

# 1 Select the names of all the products in the store. 
select Name from Product;

# 2 Select the names and the prices of all the products in the store.
select Name,Price from Product;

# 3 Select the name of the products with a price less than or equal to $200. 
select Name,Price from Product where Price <= 200;

# 4 Select all the products with a price between $60 and $120.
select * from Product where price between 60 and 120;

# 5 Select the name and price in cents (i.e., the price must be multiplied by 100).
select Name,Price,Price*100 as New_Price from Product; 

# 6 Compute the average price of all the products. 
select avg(Price) from Product; 

# 7 Compute the average price of all products with manufacturer code equal to 2.
select avg(Price) from Product where Manufacturers=2;

# 8 Compute the number of products with a price larger than or equal to $180. 
select count(*) from Product where Price>=180;

# 9 Select the name and price of all products with a price larger than or equal to $180, 
#and sort first by price (in descending order), and then by name (in ascending order). 
select Name,Price from Product where Price>=180 order by Price desc, Name asc;

# 10 Select all the data from the products, including all the data for each product's manufacturer.
select * from product join manufacturers on `Manufacturers`.Code = product.manufacturers;



# 11 Select the product name, price, and manufacturer name of all the products. 
select Product.Name,Manufacturers.Name,Product.Price
from Product join manufacturers on Product.Manufacturers = Manufacturers.Code;


# *12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
select Manufacturers, AVG(Price) from Product group by Manufacturers;



# 13 Select the average price of each manufacturer's products, showing the manufacturer's name. 
select 	manufacturers.Name as Manu_Name,avg(Product.Price) as Avg_Price from product
join manufacturers on product.Manufacturers = `Manufacturers`.Code
group by Manu_Name order by Avg_Price desc;



# 14 Select the names of manufacturer whose products have an average 
#price larger than or equal to $150.
select Manufacturers.Name as Manu_Name,avg(Product.Price) as Avg_Price from Product
join manufacturers on product.Manufacturers = manufacturers.Code 
group by Manu_Name having avg(Product.Price)>150;


# 15 Select the name and price of the cheapest product. 
select Name,Price from Product 
where Price = (select Min(Price) from Product);

select Name,price from product order by price asc limit 1;

#15 A Select the name and price of the MOST EXPENSIVE product. 
select Name,Price from Product where Price=(select max(Price)from Product);

select Name,Price from product order by `Price` desc limit 1;

select * from Manufacturers;
select * from Product;

# *16 Select the name of each manufacturer along with the name and price of its most expensive product. 
select Manufacturers.Name,Product.Name,MAX(Price) from Product join Manufacturers on Product.Manufacturers=Manufacturers.Code group by Manufacturers;

# 17 Add a new product: Loudspeakers, $70, manufacturer 2. 
insert into Product(Code, Name, Price, Manufacturers)
values(11, "Loudspeakers",70,2);
select * from Product;

# 18 Update the name of product 8 to "Laser Printer". 
update Product set Name="Laser Printer" where Code=8;
select * from product;

# 19 Apply a 10% discount to all products. 
select Code,Name,Manufacturers,Price,price*10/100 
as Discount,price*90/100 as Sell_price from Product;

update product set Price=price*0.9;

# 20 Apply a 10% discount to all products with a price larger than or equal to $120.
select *,price*10/100 as Discount,price-price*10/100 as Sell_Price
from Product where Price >= 120;
 
