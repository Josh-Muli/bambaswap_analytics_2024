WITH monthly_revenue AS (
    -- Get total revenue per month
    SELECT month, month_number, SUM(bs_revenue) AS total_revenue, COUNT(DISTINCT phone_number) AS total_customers
    FROM bambaswap_2024_data
    GROUP BY month, month_number
),
churn_data AS (
    -- Get churn rate per month (from previous churn rate query)
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
        -- Count returning customers (who paid in `m-1` and are still paying in `m`)
        SELECT mc2.month AS current_month, 
               mc2.month_number AS current_month_number, 
               COUNT(DISTINCT mc2.phone_number) AS returning_customers
        FROM monthly_customers mc2
        JOIN monthly_customers mc1
        ON mc2.phone_number = mc1.phone_number
        AND mc2.month_number = mc1.month_number + 1  -- Ensures they paid in both `m-1` and `m`
        GROUP BY mc2.month, mc2.month_number
    )
    -- Calculate Monthly Churn Rate
    SELECT 
        pm.previous_month,
        pm.previous_month_number,
        rc.current_month,
        rc.current_month_number,
        -- Churn Rate = (Total Customers in `m-1` - Returning Customers in `m`) / Total Customers in `m-1`
        COALESCE(((pm.total_previous_customers - COALESCE(rc.returning_customers, 0)) * 1.0 / 
                  GREATEST(pm.total_previous_customers, 1)), 0) AS churn_rate
    FROM previous_month_customers pm
    LEFT JOIN returning_customers rc 
    ON pm.previous_month_number + 1 = rc.current_month_number
)
-- Calculate CLV per month
SELECT 
    mr.month, 
    mr.month_number,
    (mr.total_revenue * 1.0 / NULLIF(mr.total_customers, 0)) AS ARPU,  -- Avoid division by zero
    cd.churn_rate,
    CASE 
        WHEN cd.churn_rate = 0 THEN NULL  -- Prevent division by zero
        ELSE (mr.total_revenue / NULLIF(mr.total_customers, 0)) * (1.0 / cd.churn_rate)
    END AS customer_lifetime_value
FROM monthly_revenue mr
LEFT JOIN churn_data cd 
ON mr.month_number = cd.previous_month_number
ORDER BY mr.month_number;
