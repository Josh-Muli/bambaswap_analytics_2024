WITH customer_counts AS (
    -- Count occurrences of each customer per month
    SELECT phone_number, month, month_number, COUNT(*) AS occurrences
    FROM bambaswap_combined_jan_oct_2024
    GROUP BY phone_number, month, month_number
),
cumulative_customers AS (
    -- Track when a customer first appeared and their total count before each month
    SELECT c1.phone_number, c1.month, c1.month_number,
        (SELECT COUNT(*)
         FROM customer_counts c2
         WHERE c2.phone_number = c1.phone_number
         AND c2.month_number < c1.month_number) AS prior_count
    FROM customer_counts c1
),
returning_customers AS (
    -- Identify customers who had 3+ occurrences before a given month
    SELECT phone_number, month, month_number
    FROM cumulative_customers
    WHERE prior_count >= 3
),
monthly_customers AS (
    -- Get unique customers per month
    SELECT DISTINCT phone_number, month, month_number
    FROM bambaswap_combined_jan_oct_2024
),
new_customers AS (
    -- Find new customers (not in returning customers for that month)
    SELECT m.phone_number, m.month, m.month_number
    FROM monthly_customers m
    LEFT JOIN returning_customers r 
    ON m.phone_number = r.phone_number AND m.month = r.month
    WHERE r.phone_number IS NULL
)
-- Calculate CAR per month and replace NULL values
SELECT 
    m.month, 
    m.month_number,
    -- Ensure no NULL values by using COALESCE and GREATEST
    COALESCE((COUNT(n.phone_number) * 100.0 / GREATEST(COUNT(r.phone_number), 1)), 0) AS acquisition_rate
FROM monthly_customers m
LEFT JOIN new_customers n ON m.phone_number = n.phone_number AND m.month = n.month
LEFT JOIN returning_customers r ON m.phone_number = r.phone_number AND m.month = r.month
GROUP BY m.month, m.month_number
ORDER BY m.month_number;
