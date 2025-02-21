WITH monthly_customers AS (
    -- Get distinct customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_combined_jan_oct_2024
),
previous_customers AS (
    -- Identify all customers who appeared before the current month
    SELECT mc1.phone_number, mc1.month, mc1.month_number,
           COUNT(mc2.phone_number) AS past_occurrences
    FROM monthly_customers mc1
    LEFT JOIN monthly_customers mc2
    ON mc1.phone_number = mc2.phone_number 
    AND mc2.month_number < mc1.month_number
    GROUP BY mc1.phone_number, mc1.month, mc1.month_number
),
returning_customers AS (
    -- Customers who have appeared in at least one previous month
    SELECT phone_number, month, month_number
    FROM previous_customers
    WHERE past_occurrences > 0
)
-- Calculate CCR
SELECT 
    mc.month, 
    mc.month_number,
    -- Compute CCR: returning customers / total customers from previous months
    COALESCE((COUNT(rc.phone_number) * 100.0 / GREATEST(COUNT(pc.phone_number), 1)), 0) AS conversion_rate
FROM monthly_customers mc
LEFT JOIN returning_customers rc 
ON mc.phone_number = rc.phone_number AND mc.month = rc.month
LEFT JOIN previous_customers pc 
ON mc.phone_number = pc.phone_number AND mc.month_number = pc.month_number
GROUP BY mc.month, mc.month_number
ORDER BY mc.month_number;
