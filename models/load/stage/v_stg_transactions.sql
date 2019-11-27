{{- config(materialized='view', schema='STG', enabled=true, tags='stage') -}}

{%- set source_table = ref('raw_transactions') -%}

{{ dbtvault.multi_hash([
([ 'CUSTOMER_ID', 'TRANSACTION_NUMBER'], 'TRANSACTION_PK'),
('CUSTOMER_ID', 'CUSTOMER_FK'),
('ORDER_ID', 'ORDER_FK')]) -}},

{{ dbtvault.add_columns(source_table,
[('DATEADD(DAY, 1, TRANSACTION_DATE)' , 'LOADDATE'),
('TRANSACTION_DATE', 'EFFECTIVE_FROM'),
('!RAW_TRANSACTIONS', 'SOURCE')]) }}

{{ dbtvault.from(source_table) }}