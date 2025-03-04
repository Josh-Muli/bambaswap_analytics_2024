WITH monthly_customers AS (
    -- Get unique customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_2024_data
),
churned_customers AS (
    -- Find customers who were active in the previous month but not in the current month
    SELECT mc1.phone_number, mc1.month, mc1.month_number
    FROM monthly_customers mc1
    LEFT JOIN monthly_customers mc2
    ON mc1.phone_number = mc2.phone_number
    AND mc1.month_number = mc2.month_number - 1  -- Check if they exist in the next month
    WHERE mc2.phone_number IS NULL  -- If NULL, customer churned
),
churn_rate AS (
    -- Count customers for churn calculation
    SELECT 
        mc.month, 
        mc.month_number,
        COUNT(DISTINCT cc.phone_number) AS churned_customers,
        LAG(COUNT(DISTINCT mc.phone_number)) OVER (ORDER BY mc.month_number) AS prev_month_customers
    FROM monthly_customers mc
    LEFT JOIN churned_customers cc
    ON mc.phone_number = cc.phone_number AND mc.month_number = cc.month_number
    GROUP BY mc.month, mc.month_number
)
-- Calculate Monthly Churn Rate (%)
SELECT 
    month, 
    month_number,
    COALESCE(
        ROUND(
            (churned_customers * 100.0) / NULLIF(prev_month_customers, 0), 2
        ), 0
    ) AS churn_rate_percentage
FROM churn_rate
ORDER BY month_number;
