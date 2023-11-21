
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
