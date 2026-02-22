with trip_fact_cte as(
    select
    ride_id,
    -- rideable_type,
    date(to_timestamp(started_at)) as trip_date,
    start_statio_id,
    end_station_id,
    timestampdiff(minutes,to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration,
    member_csual as member_csual

    from 
   {{ ref('stage_bike') }}
)
select * from trip_fact_cte