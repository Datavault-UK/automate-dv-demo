{%- set yaml_metadata -%}
source_model: 'raw_inventory'
derived_columns:
  NATION_KEY: 'SUPPLIER_NATION_KEY'
  REGION_KEY: 'SUPPLIER_REGION_KEY'
  RECORD_SOURCE: '!TPCH-INVENTORY'
hashed_columns:
  SUPPLIER_PK: 'SUPPLIERKEY'
  SUPPLIER_NATION_PK: 'SUPPLIER_NATION_KEY'
  SUPPLIER_REGION_PK: 'SUPPLIER_REGION_KEY'
  REGION_PK: 'SUPPLIER_REGION_KEY'
  NATION_PK: 'SUPPLIER_NATION_KEY'
  NATION_REGION_PK:
    - 'SUPPLIER_NATION_KEY'
    - 'SUPPLIER_REGION_KEY'
  LINK_SUPPLIER_NATION_PK:
    - 'SUPPLIERKEY'
    - 'SUPPLIER_NATION_KEY'
  PART_PK: 'PARTKEY'
  INVENTORY_PK:
    - 'PARTKEY'
    - 'SUPPLIERKEY'
  SUPPLIER_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'SUPPLIERKEY'
      - 'SUPPLIER_ACCTBAL'
      - 'SUPPLIER_ADDRESS'
      - 'SUPPLIER_PHONE'
      - 'SUPPLIER_COMMENT'
      - 'SUPPLIER_NAME'
  PART_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'PARTKEY'
      - 'PART_BRAND'
      - 'PART_COMMENT'
      - 'PART_CONTAINER'
      - 'PART_MFGR'
      - 'PART_NAME'
      - 'PART_RETAILPRICE'
      - 'PART_SIZE'
      - 'PART_TYPE'
  SUPPLIER_REGION_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'SUPPLIER_REGION_KEY'
      - 'SUPPLIER_REGION_COMMENT'
      - 'SUPPLIER_REGION_NAME'
  SUPPLIER_NATION_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'SUPPLIER_NATION_KEY'
      - 'SUPPLIER_NATION_COMMENT'
      - 'SUPPLIER_NATION_NAME'
  INVENTORY_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'PARTKEY'
      - 'SUPPLIERKEY'
      - 'AVAILQTY'
      - 'SUPPLYCOST'
      - 'PART_SUPPLY_COMMENT'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}


WITH staging AS (
{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     hashed_columns=hashed_columns,
                     ranked_columns=none) }}
)

SELECT *, 
       TO_DATE('{{ var('load_date') }}') AS LOAD_DATE,
       TO_DATE('{{ var('load_date') }}') AS EFFECTIVE_FROM
FROM staging