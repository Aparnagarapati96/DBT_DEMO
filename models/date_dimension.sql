WITH cte AS (
SELECT  
to_timestamp(started_at) started_at,
date(to_timestamp(started_at)) date_started_at,
hour(to_timestamp(started_at)) hour_started_at,
CASE    
    WHEN dayname(to_timestamp(started_at)) IN('Sat','Sun')
        THEN 'Weekend'
        ELSE 'Business Day'
    END AS day_type,
CASE 
    WHEN month(to_timestamp(started_at)) in (12,1,2)
        THEN 'Winter'
    WHEN month(to_timestamp(started_at)) in (3,4,5)
        THEN 'Spring'
    WHEN month(to_timestamp(started_at)) in (6,7,8)
        THEN 'Summer'
        ELSE 'Autumn'
    END AS station_of_the_year

FROM {{ source('Demo', 'bike') }})
SELECT * FROM cte
