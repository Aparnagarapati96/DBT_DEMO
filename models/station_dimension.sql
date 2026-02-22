with station_dimension_cte as(
    select 
    distinct start_station_name,
    start_statio_id,
    start_lat,
    start_lng
    from {{ source('Demo', 'bike') }})
select * from station_dimension_cte