{% macro grant_selectw(warehouse) %}
    {% set varsetawarehouse %}

ALTER WAREHOUSE {{warehouse}} SET warehouse_size=Medium;
    {% endset %}

    {% do run_query(varsetawarehouse) %}
    {% do log("warehouse is assigned", info=true) %}

{% endmacro %}
