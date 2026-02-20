{% macro get_season(x) %}

CASE 
    WHEN month(to_timestamp({{x}})) in (12,1,2)
        THEN 'Winter'
    WHEN month(to_timestamp({{x}})) in (3,4,5)
        THEN 'Spring'
    WHEN month(to_timestamp({{x}})) in (6,7,8)
        THEN 'Summer'
        ELSE 'Autumn'
    END
{% endmacro %}

{% macro get_day_type(x)%}
CASE
    WHEN dayname(to_timestamp({{x}})) IN('Sat','Sun')
        THEN 'Weekend'
        ELSE 'Business Day'
    END
{% endmacro %}