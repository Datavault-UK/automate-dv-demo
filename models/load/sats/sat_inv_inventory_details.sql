{{- config(materialized='incremental', schema='VLT', enabled=true, tags='satellite') -}}

{{ dbtvault.sat(var('src_pk'), var('src_hashdiff'), var('src_payload'),
                var('src_eff'), var('src_ldts'), var('src_source'),
                var('source')) }}