WITH monthly_customers AS (
    -- Get distinct paying customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_combined_jan_oct_2024
    
),
previous_month_customers AS (
    -- Count total customers in the previous month
    SELECT mc1.month AS previous_month, mc1.month_number AS previous_month_number, COUNT(DISTINCT mc1.phone_number) AS total_previous_customers
    FROM monthly_customers mc1
    GROUP BY mc1.month, mc1.month_number
),
returning_customers AS (
    -- Count returning customers (who paid in `m-1` and are still paying in `m`)
    SELECT mc2.month AS current_month, mc2.month_number AS current_month_number, COUNT(DISTINCT mc2.phone_number) AS returning_customers
    FROM monthly_customers mc2
    LEFT JOIN monthly_customers mc1  -- Use LEFT JOIN instead of INNER JOIN
    ON mc2.phone_number = mc1.phone_number
    AND mc2.month_number = mc1.month_number + 1  -- Ensures they paid in both `m-1` and `m`
    GROUP BY mc2.month, mc2.month_number
)
-- Calculate Monthly Retention Rate
SELECT 
    pm.previous_month,
    pm.previous_month_number,
    COALESCE(rc.current_month, 'No Returning Customers') AS current_month,
    COALESCE(rc.current_month_number, pm.previous_month_number + 1) AS current_month_number,
    COALESCE((rc.returning_customers * 100.0 / GREATEST(pm.total_previous_customers, 1)), 0) AS retention_rate
FROM previous_month_customers pm
LEFT JOIN returning_customers rc 
ON pm.previous_month_number + 1 = rc.current_month_number
ORDER BY pm.previous_month_number;
