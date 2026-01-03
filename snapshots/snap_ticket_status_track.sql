{% snapshot snap_ticket_status_track %}
    {{
        config(
            target_schema='dev_schema',
            target_database='dev_db',
            unique_key='ticket_id',
            strategy='check',
            check_cols=['status']
        )
    }}

    select * from {{ source('s1', 't_ticket_info') }}
 {% endsnapshot %}