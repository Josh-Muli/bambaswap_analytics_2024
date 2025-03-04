WITH monthly_customers AS (
    -- Get unique customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_2024_data
),
retained_customers AS (
    -- Find customers who were active in both the current and previous month
    SELECT mc1.phone_number, mc1.month, mc1.month_number
    FROM monthly_customers mc1
    JOIN monthly_customers mc2
    ON mc1.phone_number = mc2.phone_number
    AND mc1.month_number = mc2.month_number + 1  -- Ensures customer was also present in the previous month
),
retention_rate AS (
    -- Count customers for retention calculation
    SELECT 
        mc.month, 
        mc.month_number,
        COUNT(DISTINCT rc.phone_number) AS retained_customers,
        LAG(COUNT(DISTINCT mc.phone_number)) OVER (ORDER BY mc.month_number) AS prev_month_customers
    FROM monthly_customers mc
    LEFT JOIN retained_customers rc
    ON mc.phone_number = rc.phone_number AND mc.month_number = rc.month_number
    GROUP BY mc.month, mc.month_number
)
-- Calculate Monthly Retention Rate (%)
SELECT 
    month, 
    month_number,
    COALESCE(
        ROUND(
            (retained_customers * 100.0) / NULLIF(prev_month_customers, 0), 2
        ), 0
    ) AS retention_rate_percentage
FROM retention_rate
ORDER BY month_number;
