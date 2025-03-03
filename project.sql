create database project;
use project;
#
# 1)Retrieve the list of all orders where the sales is greater than 500 and profit less than 100.
	Select *
      From samplesuperstore
      Where Sales>500 AND Profit<100;
      
#2)Display Region,Quantity,Category,`Sub-Category` in the table which has a Category of  Technology or the Sub-Category’ in Storage.
	Select Region,Quantity,Category ,`Sub-Category`    
     From samplesuperstore    
     Where Category = 'Technology' OR `Sub-Category` = 'Storage';
# 3) Display the cities in the  table that  belong to the state Kentucky, Florida, Texas, California.
	Select Distinct City
     From samplesuperstore
     Where State IN ('Kentucky','Florida','Texas','California');
# 4) Retrieve all sales records where the sales range is 1000 and 5000.
	Select * 
	From samplesuperstore
	Where Sales BETWEEN 1000 And 5000;
# 5) Display the records from the table which has a Sub-Category that starts with ‘Book’.
	Select *
    From samplesuperstore 
     Where `sub-category` LIKE 'Book%';
# 6) Display the total sales and total profit for each region.
	Select Region, sum(Sales) As total_sales, sum(Profit) As total_profit 
     From samplesuperstore
     Group by Region ;
# 7) Display the average discount given on orders for each product category,  and include categories where the average is greater than 10%.
	Select Category, avg(Discount) as avg_discount
	From samplesuperstore
	Group By Category
	Having avg_discount>0.1;
# 8)Display total number of cities in each state from the table.
	Select State, count(DISTINCT City) AS Total_Cities
     From samplesuperstore
     Group By State;
  
 create table region(region varchar(10), Head_quarter_name varchar(15),Num_Of_Branches int(5));
  
INSERT INTO region values('West','DTDC',50);
INSERT INTO region values('East','Shadow Fax',70);
INSERT INTO region values('Central','Ecom-Express',100);
INSERT INTO region values('South','Professional',120);
INSERT INTO region values('North','International',150);

select * from region;

     
# 9)Display the unique regions present in both the Sample Superstore and the Region tables.
	  Select Region 
      From samplesuperstore 
      UNION 
      Select Region 
      From region;
# 10)Display the records in the table which have a profit greater than the profit of all items in the 'Furniture' category?
	Select * 
	From samplesuperstore 
	Where Profit > All (Select Profit 
						From samplesuperstore 
						Where Category = 'Furniture');

# 11) Display the segments and region of customers who are associated with the regions that have ‘DTDC' as their headquarters?
	Select Segment,Region
	From samplesuperstore
	Where Region IN (Select Region
					 From region 
					 Where Head_quarter_name = 'DTDC');
                     
# 12)Write a query to find the headquarter name  and total profit in each region using inner join. 
	Select r.Head_Quarter_Name, r.Region, SUM(Profit) AS Total_Profit
	From region AS r INNER JOIN samplesuperstore AS s
	On r.Region = s.Region
	Group By r.Head_Quarter_Name,r.Region;






