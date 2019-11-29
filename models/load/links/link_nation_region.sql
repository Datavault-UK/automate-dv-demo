{{- config(materialized='incremental', schema='VLT', enabled=true, tags='link') -}}

{%- set source = [ref('v_stg_orders'),
ref('v_stg_inventory')] -%}

{%- set src_pk = 'NATION_REGION_PK' -%}
{%- set src_fk = ['NATION_PK', 'REGION_PK'] -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = source -%}
{%- set tgt_fk = [['NATION_PK', 'BINARY', 'NATION_FK'],
['REGION_PK', 'BINARY', 'REGION_FK']] -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = ['SOURCE', 'VARCHAR(14)', 'SOURCE'] -%}

{{ dbtvault.link_template(src_pk, src_fk, src_ldts, src_source,
                          tgt_pk, tgt_fk, tgt_ldts, tgt_source,
                          source) }}