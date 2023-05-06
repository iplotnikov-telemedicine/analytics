SELECT
    external_ref, 
    status, 
    "source", 
    "ref", 
    date_time, 
    state, 
    cvv_provided, 
    amount, 
    country, 
    currency, 
    rates,
    amount / CAST(rates::json->>currency as float) as usd_amount

FROM {{ ref('globepay_acceptance')}}