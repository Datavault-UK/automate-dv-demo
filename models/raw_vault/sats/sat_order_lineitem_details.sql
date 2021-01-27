{%- set source_model = "v_stg_orders" -%}
{%- set src_pk = "LINEITEM_PK" -%}
{%- set src_hashdiff = "LINEITEM_HASHDIFF" -%}
{%- set src_payload = ["COMMITDATE", "DISCOUNT", "EXTENDEDPRICE", "LINE_COMMENT",
                       "QUANTITY", "RECEIPTDATE", "RETURNFLAG", "SHIPDATE",
                       "SHIPINSTRUCT", "SHIPMODE", "TAX"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}
