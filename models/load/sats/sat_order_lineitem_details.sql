{{- config(materialized='incremental', schema='VLT', enabled=true, tags='satellite') -}}

{%- set source = [ref('v_stg_orders')] -%}

{%- set src_pk = 'LINEITEM_PK' -%}
{%- set src_hashdiff = 'LINEITEM_HASHDIFF' -%}
{%- set src_payload = ['COMMITDATE', 'DISCOUNT', 'EXTENDEDPRICE', 'LINE_COMMENT', 'LINESTATUS', 'QUANTITY', 'RECEIPTDATE', 'RETURNFLAG', 'SHIPDATE', 'SHIPINSTRUCT', 'SHIPMODE', 'TAX'] -%}

{%- set src_eff = 'EFFECTIVE_FROM' -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = source -%}
{%- set tgt_hashdiff = ['LINEITEM_HASHDIFF', 'BINARY', 'HASHDIFF'] -%}
{%- set tgt_payload = source -%}

{%- set tgt_eff = source -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = source -%}

{{ dbtvault.sat_template(src_pk, src_hashdiff, src_payload,
                         src_eff, src_ldts, src_source,
                         tgt_pk, tgt_hashdiff, tgt_payload,
                         tgt_eff, tgt_ldts, tgt_source,
                         source) }}