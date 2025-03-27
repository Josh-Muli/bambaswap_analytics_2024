WITH monthly_customers AS (
    -- Get unique customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_2023_data
),
existing_customers AS (
    -- Count total customers up to the previous month
    SELECT mc1.phone_number, mc1.month, mc1.month_number
    FROM monthly_customers mc1
    WHERE EXISTS (
        SELECT 1 FROM monthly_customers mc2 
        WHERE mc2.phone_number = mc1.phone_number 
        AND mc2.month_number < mc1.month_number
    )
),
new_customers AS (
    -- Identify customers appearing for the first time in each month
    SELECT mc.phone_number, mc.month, mc.month_number
    FROM monthly_customers mc
    LEFT JOIN existing_customers ec 
    ON mc.phone_number = ec.phone_number
    WHERE ec.phone_number IS NULL  -- First-time customers
)
-- Calculate Customer Acquisition Rate (CAR) with NO NULL values
SELECT 
    mc.month, 
    mc.month_number,
    -- Replace NULL values with 0 to ensure completeness
    COALESCE(
        ROUND(
            COUNT(DISTINCT nc.phone_number) * 100.0 / 
            GREATEST(COUNT(DISTINCT ec.phone_number), 1), 2
        ), 0
    ) AS acquisition_rate_percentage
FROM monthly_customers mc
LEFT JOIN new_customers nc 
    ON mc.phone_number = nc.phone_number AND mc.month_number = nc.month_number
LEFT JOIN existing_customers ec 
    ON mc.phone_number = ec.phone_number AND mc.month_number < ec.month_number
GROUP BY mc.month, mc.month_number
ORDER BY mc.month_number;
