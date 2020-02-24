{{- config(materialized='incremental', schema='VLT', tags='link') -}}

{{ dbtvault.link(var('src_pk'), var('src_fk'), var('src_ldts'),
                 var('src_source'), var('source')) }}