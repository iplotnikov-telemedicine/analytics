{{
    config(
        materialized='table',
        unique_key=['ref']
    )
}}


SELECT
    ga."ref", 
    ga.date_time, 
    ga.state = 'ACCEPTED' as is_accepted, 
    ga.country, 
    ga.usd_amount,
    gc.external_ref IS NULL as chargeback_data_is_missed,
    gc.is_chargeback

FROM {{ ref('stg_globepay__acceptance') }} ga

LEFT JOIN {{ ref('stg_globepay__chargeback') }} gc 
	ON ga.external_ref = gc.external_ref