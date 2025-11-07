Create database usedcars;

Use usedcars;
Show tables;

# show table content
select * from used_cars;
--

#rename coluns name
alter table used_cars
change `india locations`  indianlocations varchar(20); 

alter table used_cars
change `distance travelled`  distancetravelled int; 

--

select * from used_cars;

# count all availble records of cars in dataset
select count(*) from used_cars;  -- 890

# describe the table 
desc used_cars;


# check any missing values in a columns
select count(*) from used_cars
where manufacturer is null;

# check any missing values in multiple  columns
SELECT
    COUNT(*) AS TotalRows,
    COUNT(*) - COUNT(varient) AS Nulls_manufacturer,
    COUNT(*) - COUNT(details) AS  null_details,
    COUNT(*) - COUNT(indianlocations) AS Nulls_locations,
	COUNT(*) - COUNT(model) AS Nulls_model,
    COUNT(*) - COUNT(distancetravelled) AS Nulls_distance,
	COUNT(*) - COUNT(`fuel type`) AS Nulls_fueltype,
	COUNT(*) - COUNT(`engine capacity`) AS Nulls_engine_capacity,
	COUNT(*) - COUNT(transmission) AS Nulls_transmission,
	COUNT(*) - COUNT(price) AS Nulls_price
FROM used_cars;


--
select * from used_cars;

# identify the minimum, maximum, and avg price of car.
select  MIN(Price), MAX(Price), avg(Price) from  used_cars;

# identify the max price of each manufacuturer cars.
select manufacturer, MAX(price) as max_price
from   used_cars
group by manufacturer
order by  max_price desc;

# identify the minimum price of each manufacturer car.
select manufacturer,min(price) as min_price
from   used_cars
group by manufacturer
order by min_price desc;

# finding the average price of car of each Manufacturer
select manufacturer , avg(price) as avg_price
from used_cars
group by manufacturer
order by avg_price desc;


--
Select *  From used_cars;

# total counts of unique manufacturer
Select COUNT(DISTINCT Manufacturer) as Total_Manufacturer
from used_cars;

# identify total counts of cars based on each manufacturer company
select manufacturer, count(*) from used_cars
group by manufacturer;

--

select * from used_cars;

# count total available varient of cars
select count(distinct varient)  as available_variety
from used_cars;


# identify total count of car based on each varient 
select varient,  count(varient)
from used_cars
group by varient;

--
select * from used_cars;

#view all unique location of datasets
select distinct indianlocations 
from used_cars;


--

select * from used_cars;

# Identify avaialbe year of car's model and count total count of each model present  in datasets
select model, count(model) as No_of_car_available
from used_cars
group by model
order by model asc;

select count(*) from used_cars
where model < 2000;   -- 204

select count(*) from used_cars
where model >= 2000;  -- 686

--

select * from used_cars;

# identify total counts of cars based on each fuel types    
select distinct `fuel type`, count(`fuel type`)
from used_cars
group by `fuel type`;

# check total count by fule type 
select count(*) from used_cars
where `fuel type` = 'Hybrid';


--
select * from used_cars;

select  count(distinct `engine capacity`) from used_cars;

select  distinct `engine capacity`, count(`engine capacity`) 
from used_cars
group by `engine capacity`;

--

select * from used_cars;

select  count(distinct transmission) from used_cars;

select  distinct transmission ,count(transmission)
from used_cars
group by transmission;


#  Explorer aggregation 

-- Count the number of cars based on year of manufacture
SELECT Model, COUNT(*) AS Number_of_Cars
FROM    used_cars
GROUP BY    Model
ORDER BY Model DESC;
    
-- Count the total number of cars of each manufacture
SELECT Manufacturer, COUNT(*) AS Total_Inventory
FROM    used_cars
GROUP BY Manufacturer
ORDER BY Total_Inventory DESC;
    
-- identify Maximum Distance Travelled by Car Make and Model
select model , avg(price)
from used_cars
group by model
order by model asc;  

-- analyse The final selling price of the car based on model
select manufacturer, model , max(price) as Max_price, distancetravelled
from 
(select manufacturer, model, price, distancetravelled 
from used_cars) as table1
group by manufacturer, model, distancetravelled;