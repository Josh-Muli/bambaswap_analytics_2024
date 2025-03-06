WITH monthly_acquired_customers AS (
    -- Get new customers acquired each month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_2024_data
),
monthly_converted_customers AS (
    -- Get customers who completed more than 3 transactions in a given month
    SELECT phone_number, month, month_number
    FROM bambaswap_2024_data
    WHERE state = 'complete'
    GROUP BY phone_number, month, month_number
    HAVING COUNT(*) > 3  -- Only count customers with more than 3 completed transactions
)
-- Calculate CCR per month
SELECT 
    ac.month, 
    ac.month_number,
    COALESCE(
        ROUND(
            COUNT(DISTINCT cc.phone_number) * 100.0 / NULLIF(COUNT(DISTINCT ac.phone_number), 0), 2
        ), 0
    ) AS conversion_rate_percentage
FROM monthly_acquired_customers ac
LEFT JOIN monthly_converted_customers cc 
    ON ac.phone_number = cc.phone_number AND ac.month_number = cc.month_number
GROUP BY ac.month, ac.month_number
ORDER BY ac.month_number;
