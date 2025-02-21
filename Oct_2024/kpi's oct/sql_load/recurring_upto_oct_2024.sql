WITH monthly_revenue AS (
    -- Get total revenue per customer per month
    SELECT phone_number, month, month_number, SUM(bs_revenue) AS total_revenue
    FROM bambaswap_combined_jan_oct_2024
    GROUP BY phone_number, month, month_number
),
previous_customers AS (
    -- Identify customers who have paid in any month before or after the current month
    SELECT DISTINCT mr1.phone_number, mr1.month, mr1.month_number
    FROM monthly_revenue mr1
    LEFT JOIN monthly_revenue mr2
    ON mr1.phone_number = mr2.phone_number 
    AND mr2.month_number < mr1.month_number  -- Customer has past payments
    WHERE mr2.phone_number IS NOT NULL
),
recurring_customers AS (
    -- Customers who made payments in previous months OR will make payments later
    SELECT DISTINCT phone_number, month, month_number
    FROM previous_customers
    UNION
    SELECT DISTINCT mr1.phone_number, mr1.month, mr1.month_number
    FROM monthly_revenue mr1
    JOIN monthly_revenue mr2
    ON mr1.phone_number = mr2.phone_number 
    AND mr1.month_number > mr2.month_number  -- Customer pays again later
)
-- Calculate MRR per month
SELECT 
    mr.month, 
    mr.month_number,
    COALESCE(SUM(mr.total_revenue), 0) AS monthly_recurring_revenue
FROM monthly_revenue mr
INNER JOIN recurring_customers rc 
ON mr.phone_number = rc.phone_number AND mr.month = rc.month
GROUP BY mr.month, mr.month_number
ORDER BY mr.month_number;
