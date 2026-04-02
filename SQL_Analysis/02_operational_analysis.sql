-- High-Traffic Cities: Where is the highest traffic ?
SELECT 
    s.city, 
    COUNT(t.trip_id) AS total_trips
FROM Stations s 
JOIN Trips t ON s.station_id = t.start_station_id
GROUP BY s.city
ORDER BY total_trips DESC;

-- Trip Outliers: Which trips last longer than the global average?

SELECT trip_id, duration_minutes
FROM Trips
WHERE duration_minutes > (
    SELECT AVG(duration_minutes) 
    FROM Trips
);
