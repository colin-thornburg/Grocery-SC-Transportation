SELECT
    delivery_id,
    route_id,
    driver_id,
    delivery_date,
    planned_delivery_time,
    actual_delivery_time,
    CAST(fuel_consumed AS NUMERIC) as fuel_consumed,
    delivery_status,
    customer_id,
    TIMESTAMP_DIFF(actual_delivery_time, planned_delivery_time, MINUTE) as delivery_delay_minutes
FROM {{ ref('raw_delivery_logs') }}