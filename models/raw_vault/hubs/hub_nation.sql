{%- set source_model = ["v_stg_orders", "v_stg_inventory"] -%}
{%- set src_pk = "NATION_PK" -%}
{%- set src_nk = "NATION_KEY" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}