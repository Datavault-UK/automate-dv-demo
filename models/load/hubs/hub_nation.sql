{{- config(materialized='incremental', schema='VLT', enabled=true, tags='hub') -}}

{%- set source = [ref('v_stg_orders')] -%}

{%- set src_pk = 'NATION_PK' -%}
{%- set src_nk = 'NATION_KEY' -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = source -%}
{%- set tgt_nk = source -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = source -%}

{{ dbtvault.hub_template(src_pk, src_nk, src_ldts, src_source,
                         tgt_pk, tgt_nk, tgt_ldts, tgt_source,
                         source) }}