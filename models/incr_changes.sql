{{
    config(
        materialized='incremental',
        unique_key='empno'
    )
}}
select empno,ename,sal,d_up_date from {{ source('s1', 'emp') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where d_up_date > (select max(d_up_date) from {{ this }}) 
    --this is nothing but model name which is incr_changes
{% endif %}