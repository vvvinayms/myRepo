{% macro m_acct_percentage(c1,c2) %}
    case when {{c1}} ='USA' then {{c2}}*0.3 -- here c1 is country column and c2 is tax column - meaning if country is USA then tax is 30%
         when {{c1}} = 'INDIA' then {{c2}}*0.2
         else {{c2}}*0.5 end new_balance
{% endmacro %}