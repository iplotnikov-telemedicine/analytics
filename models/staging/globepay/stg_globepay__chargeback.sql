SELECT
    external_ref, 
    status, 
    "source", 
    chargeback as is_chargeback

FROM {{ ref('globepay_chargeback')}}