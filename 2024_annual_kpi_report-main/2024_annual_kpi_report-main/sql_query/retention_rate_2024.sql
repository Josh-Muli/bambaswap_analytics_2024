WITH monthly_customers AS (
    -- Get distinct paying customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_2024_data
),
previous_month_customers AS (
    -- Count total customers in the previous month
    SELECT mc1.month AS previous_month, 
           mc1.month_number AS previous_month_number, 
           COUNT(DISTINCT mc1.phone_number) AS total_previous_customers
    FROM monthly_customers mc1
    GROUP BY mc1.month, mc1.month_number
),
returning_customers AS (
    -- Count returning customers (who were in the previous month AND still paying this month)
    SELECT mc2.month AS current_month, 
           mc2.month_number AS current_month_number, 
           COUNT(DISTINCT mc2.phone_number) AS returning_customers
    FROM monthly_customers mc2
    INNER JOIN monthly_customers mc1  -- INNER JOIN to ensure only true returning customers
    ON mc2.phone_number = mc1.phone_number
    AND mc2.month_number = mc1.month_number + 1  -- Ensures they paid in both `m-1` and `m`
    GROUP BY mc2.month, mc2.month_number
)
-- ✅ Final Retention Rate Calculation (No Overcounts)
SELECT 
    pm.previous_month,
    pm.previous_month_number,
    COALESCE(rc.current_month, 'No Returning Customers') AS current_month,
    COALESCE(rc.current_month_number, pm.previous_month_number + 1) AS current_month_number,
    -- Calculate retention rate as a percentage, ensuring no miscounted new customers
    COALESCE(ROUND((rc.returning_customers * 100.0 / NULLIF(pm.total_previous_customers, 0)), 2), 0) AS retention_rate_percentage
FROM previous_month_customers pm
LEFT JOIN returning_customers rc 
ON pm.previous_month_number + 1 = rc.current_month_number
ORDER BY pm.previous_month_number;
