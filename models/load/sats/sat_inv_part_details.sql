{{- config(materialized='incremental', schema='VLT', enabled=true, tags='satellite') -}}

{%- set source = [ref('v_stg_inventory')] -%}

{%- set src_pk = 'PART_PK' -%}
{%- set src_hashdiff = 'PART_HASHDIFF' -%}
{%- set src_payload = ['PART_NAME', 'PART_MFGR', 'PART_BRAND', 'PART_TYPE', 'PART_SIZE', 'PART_CONTAINER', 'PART_RETAILPRICE', 'PART_COMMENT'] -%}

{%- set src_eff = 'EFFECTIVE_FROM' -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = source -%}
{%- set tgt_hashdiff = ['PART_HASHDIFF', 'BINARY', 'HASHDIFF'] -%}
{%- set tgt_payload = source -%}

{%- set tgt_eff = source -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = source -%}

{{ dbtvault.sat_template(src_pk, src_hashdiff, src_payload,
                         src_eff, src_ldts, src_source,
                         tgt_pk, tgt_hashdiff, tgt_payload,
                         tgt_eff, tgt_ldts, tgt_source,
                         source) }}