SELECT
    d.delivery_date,
    COUNT(*) as total_deliveries,
    AVG(d.delivery_delay_minutes) as avg_delay_minutes,
    SUM(d.total_fuel_cost) as total_fuel_cost,
    SUM(o.total_amount) as total_revenue,
    CAST(SUM(o.total_amount) - SUM(d.total_fuel_cost) AS NUMERIC) as gross_profit
FROM {{ ref('int_delivery_metrics') }} d
LEFT JOIN {{ ref('Commercial_Sales_Ordering', 'stg_ordering__orders') }} o
    ON d.delivery_id = o.delivery_id
GROUP BY d.delivery_date