WITH monthly_revenue AS (
    -- Calculate total revenue and unique customers per month
    SELECT 
        month, 
        month_number, 
        SUM(bs_revenue) AS total_revenue,
        COUNT(DISTINCT phone_number) AS total_customers
    FROM bambaswap_2023_data
    GROUP BY month, month_number
),
customer_lifespan AS (
    -- Estimate customer lifespan by counting how many months a customer appears
    SELECT 
        phone_number, 
        COUNT(DISTINCT month_number) AS customer_lifespan
    FROM bambaswap_2023_data
    GROUP BY phone_number
),
avg_lifespan AS (
    -- Get the average customer lifespan across all customers
    SELECT AVG(customer_lifespan) AS avg_lifespan FROM customer_lifespan
)
-- Calculate Monthly CLV
SELECT 
    mr.month, 
    mr.month_number, 
    mr.total_revenue, 
    mr.total_customers, 
    ROUND(
        COALESCE(
            (mr.total_revenue / NULLIF(mr.total_customers, 0)) * al.avg_lifespan, 
            0
        ), 2
    ) AS customer_lifetime_value
FROM monthly_revenue mr
CROSS JOIN avg_lifespan al
ORDER BY mr.month_number;
