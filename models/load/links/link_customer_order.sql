{{- config(materialized='incremental', schema='VLT', enabled=true, tags='link') -}}

{%- set source = [ref('v_stg_orders')] -%}

{%- set src_pk = 'ORDER_CUSTOMER_PK' -%}
{%- set src_fk = ['CUSTOMER_PK', 'ORDER_PK'] -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = source -%}
{%- set tgt_fk = [['CUSTOMER_PK', 'BINARY', 'CUSTOMER_FK'],
['ORDER_PK', 'BINARY', 'ORDER_FK']] -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = source -%}

{{ dbtvault.link_template(src_pk, src_fk, src_ldts, src_source,
                          tgt_pk, tgt_fk, tgt_ldts, tgt_source,
                          source) }}