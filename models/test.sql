select *
from {{ source('Demo', 'bike') }}
limit 10;