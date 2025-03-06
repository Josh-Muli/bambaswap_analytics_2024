WITH customer_transactions AS (
    -- Count transactions per customer
    SELECT phone_number, COUNT(*) AS transaction_count
    FROM bambaswap_2024_data
    GROUP BY phone_number
    HAVING COUNT(*) > 1  -- Only customers with more than 1 transaction
),
monthly_customers AS (
    -- Get unique customers per month (who made >1 transactions)
    SELECT DISTINCT c.phone_number, b.month, b.month_number
    FROM bambaswap_2024_data b
    JOIN customer_transactions c ON b.phone_number = c.phone_number
),
existing_customers AS (
    -- Identify customers who appeared in previous months
    SELECT mc1.phone_number, mc1.month, mc1.month_number
    FROM monthly_customers mc1
    WHERE EXISTS (
        SELECT 1 FROM monthly_customers mc2 
        WHERE mc2.phone_number = mc1.phone_number 
        AND mc2.month_number < mc1.month_number
    )
),
new_customers AS (
    -- Identify first-time customers per month
    SELECT mc.phone_number, mc.month, mc.month_number
    FROM monthly_customers mc
    LEFT JOIN existing_customers ec 
    ON mc.phone_number = ec.phone_number
    WHERE ec.phone_number IS NULL  -- First-time customers
)
-- Calculate Customer Acquisition Rate (CAR) per month
SELECT 
    mc.month, 
    mc.month_number,
    -- Ensure correct percentage format and avoid NULL values
    COALESCE(
        ROUND(
            COUNT(DISTINCT nc.phone_number) * 100.0 / NULLIF(COUNT(DISTINCT ec.phone_number), 0), 2
        ), 0
    ) AS acquisition_rate_percentage
FROM monthly_customers mc
LEFT JOIN new_customers nc 
    ON mc.phone_number = nc.phone_number AND mc.month_number = nc.month_number
LEFT JOIN existing_customers ec 
    ON mc.phone_number = ec.phone_number AND mc.month_number < ec.month_number
GROUP BY mc.month, mc.month_number
ORDER BY mc.month_number;
