{{- config(materialized='incremental', schema='VLT', enabled=true, tags='link') -}}

{%- set source = [ref('v_stg_orders')] -%}

{%- set src_pk = 'LINK_LINEITEM_ORDER_PK' -%}
{%- set src_fk = ['ORDER_PK', 'LINEITEM_PK'] -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = ['LINK_LINEITEM_ORDER_PK', 'BINARY', 'LINEITEM_ORDER_PK'] -%}
{%- set tgt_fk = [['ORDER_PK', 'BINARY', 'ORDER_FK'],
['LINEITEM_PK', 'BINARY', 'LINEITEM_FK']] -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = source -%}

{{ dbtvault.link_template(src_pk, src_fk, src_ldts, src_source,
                          tgt_pk, tgt_fk, tgt_ldts, tgt_source,
                          source) }}