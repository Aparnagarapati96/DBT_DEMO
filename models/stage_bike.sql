with stage_bike_cte as(
    select 
    ride_id,
    replace(started_at,'"','') as started_at,
    replace(ended_at,'"','') as ended_at,
    start_station_name,
    start_statio_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    member_csual
    from {{ source('Demo', 'bike') }}
    where started_at !='starttime')
select * from   stage_bike_cte  