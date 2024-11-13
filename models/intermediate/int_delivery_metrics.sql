SELECT
    d.delivery_id,
    d.route_id,
    d.delivery_date,
    d.fuel_consumed,
    d.delivery_delay_minutes,
    d.delivery_status,
    f.amount as fuel_cost_per_gallon,
    (d.fuel_consumed * f.amount)::DECIMAL(10,2) as total_fuel_cost
FROM {{ ref('stg_transportation__delivery_logs') }} d
LEFT JOIN {{ ref('finance_project', 'stg_finance__operating_costs') }} f
    ON d.delivery_date = f.cost_date 
    AND f.cost_center = 'Transportation' 
    AND f.cost_type = 'Fuel'