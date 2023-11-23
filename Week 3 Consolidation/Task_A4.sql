--A4

--1) Which station saw the highest trip volume


-- From which station(ID and name) were most cycle hire trips taken overall?
SELECT TOP 1
	s.station_id AS ID,
	s.name AS station,
	COUNT(t.trip_id) AS trips
FROM dbo.Seattle_cycles_trip AS t
JOIN dbo.Seattle_cycles_station s
ON t.from_station_id = s.station_id
GROUP BY s.station_id, s.name
ORDER BY trips DESC
-- trips 13054

-- How many trips were taken from this station?
SELECT TOP 1
	s.station_id AS ID,
	s.name AS station,
	COUNT(t.trip_id) AS trips
FROM dbo.Seattle_cycles_trip AS t
JOIN dbo.Seattle_cycles_station s
ON t.from_station_id = s.station_id
GROUP BY s.station_id, s.name
ORDER BY trips DESC
-- trips 13054

-- How many unique bikes were borrowed from this station?
SELECT TOP 1
	s.station_id AS ID,
	s.name AS Station,
	COUNT(t.trip_id) AS Trips,
	COUNT(DISTINCT t.bikeid) AS Unique_Bikes
FROM dbo.Seattle_cycles_trip AS t
JOIN dbo.Seattle_cycles_station s
ON t.from_station_id = s.station_id
GROUP BY s.station_id, s.name
ORDER BY trips DESC
-- unique bikes borrowed 485

-- What was the average trip duration (rounded to the nearest number of minutes) from this station?
-- **Also condensed as 1 query**
SELECT TOP 1
	s.station_id AS ID,
	s.name AS Station,
	COUNT(t.trip_id) AS Trips,
	COUNT(DISTINCT t.bikeid) AS Unique_Bikes,
	ROUND(AVG(t.tripduration/60),0) AS Average_Trip_Duration
FROM dbo.Seattle_cycles_trip AS t
JOIN dbo.Seattle_cycles_station s
ON t.from_station_id = s.station_id
GROUP BY s.station_id, s.name
ORDER BY trips DESC
-- average trips duration 35

-- 2) Are people in Seattle mad enough to cycle when it snows?
-- on which dates did it snow in Seattle?
-- on those snowy days, what was the highest number of cycle trips which took place?
-- Did those trips take place during the whole day or only at certain hours of the day?
-- How many of those plucky snow-hardy cyclists were members of the scheme and how many
-- were short term pass holders?



