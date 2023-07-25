{%- set source_model = "v_stg_inventory" -%}
{%- set src_pk = "INVENTORY_PK" -%}
{%- set src_fk = ["SUPPLIER_PK", "PART_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
