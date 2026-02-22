WITH cte AS (
SELECT  
to_timestamp(started_at) started_at,
date(to_timestamp(started_at)) date_started_at,
hour(to_timestamp(started_at)) hour_started_at,
{{get_day_type('started_at')}} AS day_type,
{{get_season('started_at')}} AS station_of_the_year

FROM {{ ref('stage_bike') }})
SELECT * FROM cte