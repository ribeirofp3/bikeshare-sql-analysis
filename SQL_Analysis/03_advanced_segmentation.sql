WITH MilanTrips AS (
    SELECT 
        t.duration_minutes,
        CASE 
            WHEN t.duration_minutes < 20 THEN 'Short'
            WHEN t.duration_minutes BETWEEN 20 AND 60 THEN 'Medium'
            ELSE 'Long'
        END AS duration_category
    FROM Trips t
    JOIN Stations s ON s.station_id = t.start_station_id
    WHERE s.city = 'Milano'
)
SELECT 
    duration_category,
    COUNT(*) AS count_trips,
    CAST (ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2)
    AS decimal (10,2)) as pct_of_total
FROM MilanTrips
GROUP BY duration_category;
