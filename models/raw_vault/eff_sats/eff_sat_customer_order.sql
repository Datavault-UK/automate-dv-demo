{%- set source_model = "v_stg_orders" -%}
{%- set src_pk = "ORDER_CUSTOMER_HK" -%}
{%- set src_dfk = "ORDER_HK" -%}
{%- set src_sfk = "CUSTOMER_HK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set src_start_date = "START_DATE" -%}
{%- set src_end_date = "END_DATE" -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{{ dbtvault.eff_sat(src_pk=src_pk, src_dfk=src_dfk, src_sfk=src_sfk,
                    src_start_date=src_start_date, src_end_date=src_end_date,
                    src_eff=src_eff, src_ldts=src_ldts, src_source=src_source,
                    source_model=source_model) }}
