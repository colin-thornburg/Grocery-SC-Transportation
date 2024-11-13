SELECT
    delivery_id,
    route_id,
    driver_id,
    delivery_date,
    planned_delivery_time,
    actual_delivery_time,
    fuel_consumed::DECIMAL(10,2) as fuel_consumed,
    delivery_status,
    customer_id,
    DATEDIFF('minute', planned_delivery_time, actual_delivery_time) as delivery_delay_minutes
FROM {{ ref('raw_delivery_logs') }}