#create database shoes
create database shoes;
use shoes;

#create table shoes_detail
create table shoe(
number int,brand varchar(100) , model varchar(50) , category varchar(100),
size float, price float, stock int, color varchar(100));

#how to retrieve the table
select * from shoe;



#--------------------------------------------------insert (dml)
#insert 
insert into shoe(number,brand,model,category,size,price,stock,color)
values(1 , "Red tape" , "dunk" , "casual" , 7 , 1200 , 25 , "black" ),
(2 , "nike" , "sporty" , "sports" , 8 , 2300 , 20 , "grey");

select * from shoe;

#------------------------------------------------clause 
#     where clause  : are used to filter the data according to condition by user 

#dataset indian_shoe
select * from indian_shoe;

#1 Find all shoes in the Casual category.
select * from indian_shoe 
where category='casual';


#2 List all shoes that have a price less than 2000 INR.
select * from indian_shoe where price_in_inr < 2000 ;


#3 Select the details of all shoes that have Adidas as their brand and White as their color.
select * from indian_shoe 
where brand = "adidas" and 
color = "white"; 


#4  Find all shoes with a stock level greater than or equal to 75.
#select * from indian_shoe where stock >= 75;

#5 List all shoes with a size of 10 and are not of the Red color.
#select * from indian_shoe 
#where size = 10 and color != "red";


#6  Find all shoe models that are either in the Running category or have a price_in_inr greater than 5000.
#7  Select all shoes from the Puma, Nike, or Adidas brands.
#select * from indian_shoe
#where brand in ('nike','puma','adidas')

#------------------------------------------------logical operator
#         and : it returns true when both are condition true
#         or  : one condition should be true
#     between : for range like (1 to 10)

select * from indian_shoe;
#and 
select * from indian_shoe where brand ='adidas' and color ='black';

#between
select * from indian_shoe where stock between 10 and 40;



#------------------------------------------membership operator 
#      in : it check value in particular cell in a column and if exist then return rows else not 
#   not in: it opposite of it 

select* from indian_shoe;

#1  Find all shoes that belong to the Adidas, Nike, or Puma brands.
select * from indian_shoe where brand in ('adidas','nike','puma');

#2  List all shoes with a size of 6, 8, or 10.
select * from indian_shoe where size in (6,8,10);

#3  Select all shoes that are not in the Running, Sports, or Formal categories.
select * from indian_shoe where category not in ('running','sports','formal');

#4   Find all shoe colors that are not Black, White, or Gray.
select * from indian_shoe where color not in ('black','white','gray');



#-----------------------------------------------distinct
#how to show the unique value 

#     distinct : it show unique value from a column 
select distinct category from indian_shoe;

# write a query to show the name of model whose name startswith vowel sound.
select * from indian_shoe where left(model,1) in ('a','e','i','o','u');


#distinct 
#1 What are all the unique brands available in the dataset?
select distinct brand from indian_shoe;

#2 Find all the unique colors of shoes that are in the Running category. 
select distinct color from indian_shoe where category = 'running';

#3  List all the unique combinations of brand and category available.
select distinct brand,category from indian_shoe;

#4  What are the different sizes of shoes available that have a price greater than 4000 INR, sorted in ascending order?
select distinct size from indian_shoe
 where price_in_inr > 4000
 order by size asc;

#5 Count the number of unique brands that have a stock of fewer than 20 units.
select count(distinct brand)
 from indian_shoe
 where stock < 20;
 
 
 
 
 #-------------------------------------------aggregate function
 # aggregate function are used to perform to calculate of values and return single value 
 
 # there are 5 type of aggregate function 
 #   1sum   2.min   3.mx   4.count   5.avg
 
select * from indian_shoe; 
 #sum
#1  What is the total value of all stock for shoes in the Casual category?
select sum(stock) 
from indian_shoe
 where category ='casual';

#2 Calculate the total price of all Nike brand shoes.
select sum(price_in_inr)
from indian_shoe
where brand ='nike';

#3 What is the combined stock of all shoes with a size of 10?
select sum(stock) 
from indian_shoe 
where size =10;

#4 Find the total price_in_inr for all shoes that have a color of Black and are in the Sports category.
select sum(price_in_inr) 
from indian_shoe 
where color ='black' and category ='sports';

#5 What is the total value of all stock for shoes that have a price between 2000 and 4000 INR?
select sum(stock) from indian_shoe where price_in_inr between 2000 and 4000;

#min
#1 What is the minimum price_in_inr for a shoe in the dataset?
select min(price_in_inr) from indian_shoe;

#2 Find the lowest stock quantity for any shoe in the Formal category.
select min(stock) from indian_shoe where category = 'formal';

#3 What is the cheapest shoe model from the Adidas brand?
select min(model)
 from indian_shoe
 where brand ='adidas';

#4 Find the minimum price_in_inr for any shoe that is either a Running shoe or a Sports shoe.
select min(price_in_inr) from indian_shoe where category in (running,sports);

#5 What is the lowest stock for any shoe with a size greater than or equal to 9?
select min(stock) 
from indian_shoe 
where size >=9;


#max
#1  What is the maximum price_in_inr of a shoe in the dataset?
select max(price_in_inr) from indian_shoe;

#2 Find the highest stock for shoes in the Flip-flops category.
select max(stock) 
from indian_shoe
where category ='flip-flops';

#3 What is the most expensive model from the Puma brand?
select model,max(price_in_inr) 
from indian_shoe 
where brand ='puma';  

#4 Find the maximum price_in_inr for any White or Black colored shoe.
select max(price_in_inr) from indian_shoe where color in ('white','black'); 


#5 What is the highest stock for any shoe with a size less than 8?
select max(stock) from indian_shoe where size < 8;

#count

#1  How many total shoes are there in the dataset?
select count(*) 
from indian_shoe;

#2  How many different shoe models are available in the dataset?
select count(distinct model) from indian_shoe;

#3 Count the number of Sandals that have a stock of less than 50.
select count(*) 
from indian_shoe 
where category = 'sandals' and stock < 50;

#4  How many unique brands are there in the dataset that have a shoe with a price_in_inr greater than 5000?
select count(distinct brand) 
from indian_shoe 
where price_in_inr > 5000; 

#5 What is the number of Red colored shoes with a size of 10?
select count(*) 
from indian_shoe 
where color = 'red' and size = 10;




#---------------------------------------------------alter 
use shoes;
select * from indian_shoe;

#1  how to add column in table
 
#alter table name add column name data type 
alter table indian_shoe add column shoe_rank int;


#2  how to delete column from table
 
#alter table name drop column name;
alter table indian_shoe drop shoe_rank; 


#3  how to rename the column headers

select * from indian_shoe;
#alter table name rename column name to dash
alter table indian_shoe rename column colour to color;



#4  how to change the data type of column
describe indian_shoe;
desc indian_shoe;

alter table indian_shoe modify size float;
select * from indian_shoe;



#5  how to rename the table or table name

#alter table name rename your name
alter table indian_shoe rename ind_shoe;
select * from ind_shoe;  


#1  Add a discount column
alter table ind_shoe add column discount float;

#2  Rename column price_in_inr to price
alter table ind_shoe rename column price_in_inr to price;

#3  Change data type of size from INT to VARCHAR(5)
alter table ind_shoe modify size int;

#4  Add a rating column with default value 0
alter table ind_shoe add column rating float;

#5  Drop the discount column
select * from ind_shoe;
alter table ind_shoe drop column discount;



#------------------------------------------------------delete
#delete from ind_shoe where color ='black';


#it delete first five rows from table
#delete from ind_shoe limit 5; 

#--------------------------------------------------------update
# it add or replace value in particular cell according to condition 

select * from ind_shoe;

#1  Update price by increasing all Adidas shoes by 10%
update ind_shoe 
set price = price * 0.1 
where brand ='adidas'; 


#2  Give 5% discount on all shoes where stock > 50
update ind_shoe 
set price = price-0.5
where stock < 50;


#3  Update category to "Premium" where price is greater than 4000
update ind_shoe 
set category = 'premium'
where price > 4000;


#4  Change color "Gray" to "Silver"
update ind_shoe 
set grey ='silter'
where color = 'grey';


#5  Reduce stock by 5 for all Running shoes
update ind_shoe
set stock = stock-5
where category = 'runnning';



#delete 

#1  Delete shoes with stock = 0
delete from ind_shoe 
where stock =0;


#2  Delete all shoes priced below 500
delete from ind_show 
where price < 500;


#4  Delete all Metro brand shoes
delete from ind_shoe 
where brand = 'metro';


#5  Delete all records where category is NULL
delete from ind_shoe
where category ='null';


#6  Delete duplicate rows based on model name (keep only the lowest price)



#----------------------------------------------------group by
# group by are used to group the same category of date with the help of aggregate function and return table 

#Write a query to show the maximum english of name by each section

#syntex : select company,aggregate from table name group by company;

#1   Count how many shoe models each brand has
select brand,count(model) from ind_shoe
group by brand;

#2  Find average price of shoes for each category
select category,avg(price) from ind_shoe
group by category;

#3  Total stock available for each brand
select brand,sum(stock) from ind_shoe
group by brand;

#4  Highest and lowest priced shoe for each category
select category,max(price) , min(price) from ind_shoe
group by category;

#5  Average shoe size for each brand
select brand,avg(size) from ind_shoe
group by brand;

#6  Average price and stock grouped by brand and category
select brand,category, avg(price), avg(stock) from ind_shoe
group by brand,category;

  

#--------------------------------------------------------having
#having clause are used to filter the data after group by 

#1  Show brands where average price is above 3000
select brand,avg(price) as avg_price 
from ind_shoe 
group by brand
having avg(price) > 3000;


#2  Show categories with total stock more than 100
select category,sum(stock) as tot_stock
from ind_shoe
group by category
having sum(stock) > 100;


#3  Show brands where max shoe price is greater than 5000
select brand,max(price) as max_price from ind_shoe 
group by brand
having max(price) > 5000;

#4  Show categories where average size is greater than 9
select category,avg(size) as avg_size from ind_shoe
group by category 
having avg(size) > 9;

#5  Show brands that have more than 3 models
select brand,count(model) as tot_model
from ind_shoe 
group by brand
having count(model) >3; 

#6  Show categories where min price is greater than 1000
select category,min(price)  as min_price
from ind_shoe
group by category
having min(price) > 1000;


#7  Show colors where total shoes are more than 5
select color,count(*) as tot_shoe from ind_shoe
group by color
having count(*) > 5;


#8  Show brands with average stock more than 40, but only for category = 'Casual'
select brand,avg(stock) as avg_stock
from ind_shoe
where category = 'casual'
group by brand
having avg(stock) > 40;


#9  Show brands where total stock is less than 50 and average price is greater than 2000
select brand,sum(stock) as tot_stock 
from ind_shoe
group by brand 
having sum(stock) < 50 and avg(price) > 2000;


#10 Show categories where total stock is above 80, but only for size = 10
select category,sum(stock) as tot_stock
from ind_shoe
where size = 10
group by category
having sum(stock) > 80; 
