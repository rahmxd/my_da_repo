
--Task_A2
SELECT *
FROM dbo.Seattle_cycles_station

SELECT *
FROM dbo.Seattle_cycles_trip

--1) How many rows are in the Seattle_cycles_station table?
SELECT COUNT(*)
FROM dbo.Seattle_cycles_station;
--answer 58 rows

--2) How many unique station  IDs are there?
SELECT COUNT(DISTINCT station_id)
FROM dbo.Seattle_cycles_station
-- 58 unique ids

--3) Which cycle stations (names) have been decomissioned?
--filters rows and shows which ones are not NULL
SELECT *
FROM dbo.Seattle_cycles_station
WHERE decommission_date IS NOT NULL;

--4) In total, how many installed docks have been decommisioned?
-- counts rows which are not NULL
SELECT COUNT(*)
FROM dbo.Seattle_cycles_station
WHERE decommission_date IS NOT NULL;
-- answer = 4

--5) What was the earliest date and the latest date that cycle stations were installed?
SELECT
	MIN(install_date) AS earliest_install_date,
	MAX(install_date) AS latest_install_date
FROM dbo.Seattle_cycles_station;
-- answer earliest = 2014-10-13 latest = 2016-08-09

--6) How many unique trips are there overall? Does that number match the number of rows in the Seattle_cycles_trip table?

SELECT 
	COUNT(*) AS rows,
	COUNT(DISTINCT trip_id) AS Unique_trips
FROM dbo.Seattle_cycles_trip
-- unique trips: 137007 number of rows overall: 375600 so total rows does not match unique trips

--7) What is the average trip duration in minutes?
SELECT AVG(tripduration / 60) AS average_tripduration_mins
FROM dbo.Seattle_cycles_trip
-- 19.632221265709

--8) From which station did the largest number of individual trips begin?
SELECT *
FROM dbo.Seattle_cycles_trip

SELECT TOP 1
	from_station_name,
	from_station_id,
	COUNT(DISTINCT trip_id) AS trip_count
FROM dbo.Seattle_cycles_trip
GROUP BY from_station_id, from_station_name
ORDER BY trip_count DESC
 --Pier 69 / Alaskan Way & Clay St WF-01 16538

--9) how many male members of the cycle hire scheme made trips in 2015?

/*
SELECT COUNT(bikeid), COUNT(*), gender
FROM dbo.Seattle_cycles_trip
WHERE gender = 'Male'
GROUP BY gender
*/

SELECT COUNT(*) AS male_members_with_trips
FROM dbo.Seattle_cycles_trip
WHERE gender = 'Male' AND YEAR(starttime) = 2015;
-- answer 481

--10) How many rows do not have nulls for the column birthyear?
SELECT COUNT(birthyear)
FROM dbo.Seattle_cycles_trip
WHERE birthyear IS NOT NULL
-- 181553

--11) How old was the youngest rider that we know about?
SELECT YEAR(GETDATE()) - MAX(birthyear) AS youngest_rider_age
FROM dbo.Seattle_cycles_trip
WHERE birthyear IS NOT NULL AND bikeid IS NOT NULL
-- year 1999 and age 24

--12) How many total trips started and ended at the same time
SELECT COUNT(*) AS total_trips
FROM dbo.Seattle_cycles_trip
WHERE from_station_name = to_station_name
--total trips = 23091

--13) How many unique bikes were rented per year by short term pass holders
SELECT usertype, COUNT(*) AS total, COUNT(DISTINCT bikeid) as bikes
FROM dbo.Seattle_cycles_trip
WHERE usertype = 'Short-Term Pass Holder'
GROUP BY usertype
-- 493

--14) What is the earliest and latest dates we have in the Seattle_weather_conditions table?
SELECT MIN(Date) AS earliest, MAX(Date) AS latest
FROM dbo.Seattle_weather_conditions

--15) Calculate the difference in temperature on each day between the maximum (F) and minimum (F)
-- then sort your results to discover on which date(s) this difference was largest
-- Hint: use operator - , assign an alias, ORDER BY

SELECT (Max_Temperature_F-Min_TemperatureF) AS Daily_Temperature_Difference, Date
FROM dbo.Seattle_weather_conditions
ORDER BY Daily_Temperature_Difference DESC
-- largest difference 69 on 2016-08-19

--16) Summarise the average humidity per month (all years)
-- use an aggregate with GROUP BY
SELECT
	FORMAT(Date, 'yyyy-MM') AS Month,
	AVG(Mean_Humidity) AS Average_humidity
FROM dbo.Seattle_weather_conditions
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER by month

--17) Which month(s) in 2015 saw the highest max windspeed(not gusts) recorded?

SELECT TOP 1
	FORMAT(Date, 'yyyy-MM') AS Month,
	MAX(Max_Wind_Speed_MPH) AS Highest_Max_Windspeed_MPG
FROM dbo.Seattle_weather_conditions
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER by Highest_Max_Windspeed_MPG DESC
-- 2015-12 Highest Max windspeed was 30MPG

--18) On how many days were any weather events other than simply rain (storm, snow, fog, etc) recorded?
SELECT COUNT(*)
FROM dbo.Seattle_weather_conditions
WHERE Events IS NULL OR Events NOT LIKE 'Rain'
--402

--19) What was the total rainfall accumulation (inches) during the first 3 months of 2016?
SELECT *
FROM 

--20) On how many individual dates was fog reported?





