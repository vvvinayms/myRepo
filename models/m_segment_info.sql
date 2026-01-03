select s.c_custkey,c_name,c_address,c_phone,n_name,
{{mcr_segment("c_mktsegment")}}
from {{ source('s1', 't_customers') }} s
inner join {{ ref('m_nation') }}
on n_nationkey=c_nationkey