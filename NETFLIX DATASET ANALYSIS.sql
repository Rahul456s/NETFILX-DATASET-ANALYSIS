CREATE DATABASE NETFLIX;
USE NETFLIX;

-- COUNT TOTAL NUMBER OF RECORDS
select count(*)as total_records
from titles;

-- DISTRIBUTION OF TYPE 
select type,count(*)as count 
from titles 
group by type
order by count DESC;

-- DISTRIBUTION OF RATING
SELECT RATING, COUNT(*) AS COUNT 
FROM TITLES
GROUP BY RATING
ORDER BY COUNT DESC;

-- DISTRIBUTION OF RELESED YEAR
SELECT RELEASE_YEAR,COUNT(*) AS COUNT 
FROM TITLES
GROUP BY RELEASE_YEAR
ORDER BY RELEASE_YEAR;


-- TOP MOST COMMON DIRECTORS 
SELECT DIRECTOR,COUNT(*) AS COUNT
FROM TITLES
GROUP BY DIRECTOR
ORDER BY COUNT desc
LIMIT 10;

-- TOP 10 COUNTRIES
SELECT COUNTRY,COUNT(*) AS COUNT 
FROM TITLES
GROUP BY COUNTRY 
ORDER BY COUNT DESC
LIMIT 10;

-- RECORDS ADDED PER MONTH
SELECT DATE_FORMAT(STR_TO_DATE(date_added,'%b %d,%Y'),'%Y-%m') as month,
count(*) as count 
from titles
group by month 
order by month;

-- RECORD ADDED PER YEAR
select year(str_to_date(date_added,'%b %d,%Y')) as year, count(*) as
count
from titles
group by year
order by year; 

-- COUNT DRAMAS RECORDS
select count(*)  as count 
from titles
where listed_in like '%dramas%';

-- AVERAGE DURATION OF MOVIES /SHOWS 
select avg(cast(substring_index(duration,' ',1) as unsigned)) as 
average_duration 
from titles
where duration regexp '^[0-9]+ min$';

-- FIND RECORDS WITH NO DIRECTORS INFO
select count(*) as count 
from titles 
where director="";

-- RECORDS RELEASE IN 5 YEARS 
select *
from titles
where release_year >=year(curdate()) -5;

-- RECORDS FOR INDAI COUNTRY
select type,title
from titles 
where country='india';


-- FIND RECORDS WHICH HAVE SEASONS 
select *
from titles
where duration like '%seasons';

-- RECORDS WHICH HAVE MORE THAN 2 SEASON 
select *
from titles
where duration like '%seasons'
and cast(substring_index(substring_index(duration,' ',1),' ',-1) as
unsigned)>2;

