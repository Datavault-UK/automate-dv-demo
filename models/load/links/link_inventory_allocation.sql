{{- config(materialized='incremental', schema='VLT', enabled=true, tags='link') -}}

{%- set source = [ref('v_stg_orders')] -%}

{%- set src_pk = 'INVENTORY_ALLOCATION_PK' -%}
{%- set src_fk = ['PART_PK', 'SUPPLIER_PK', 'LINEITEM_PK'] -%}
{%- set src_ldts = 'LOADDATE' -%}
{%- set src_source = 'SOURCE' -%}

{%- set tgt_pk = source -%}
{%- set tgt_fk = [['PART_PK', 'BINARY', 'PART_FK'],
['SUPPLIER_PK', 'BINARY', 'SUPPLIER_FK'],
['LINEITEM_PK', 'BINARY', 'LINEITEM_FK']] -%}
{%- set tgt_ldts = source -%}
{%- set tgt_source = source -%}

{{ dbtvault.link_template(src_pk, src_fk, src_ldts, src_source,
                          tgt_pk, tgt_fk, tgt_ldts, tgt_source,
                          source) }}