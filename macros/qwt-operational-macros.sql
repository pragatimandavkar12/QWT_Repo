{% macro grant_select(role) %}
    {% set varsetaccess %}

ALTER WAREHOUSE {{target.warehouse}} SET warehouse_size=Xsmall;
grant usage on database {{target.database}} to role {{role}};
grant usage on schema {{target.schema}} to role {{role}};
grant select on all tables in schema {{target.schema}} to role {{role}};
grant select on all views in schema {{target.schema}} to role {{role}};
    {% endset %}

    {% do run_query(varsetaccess) %}
    {% do log("access is given", info=true) %}

{% endmacro %}
