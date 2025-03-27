WITH monthly_revenue AS (
    -- Calculate total Monthly Recurring Revenue (MRR) per month
    SELECT 
        month, 
        month_number, 
        SUM(bs_revenue) AS total_mrr
    FROM bambaswap_2023_data
    GROUP BY month, month_number
),
mrr_growth AS (
    -- Calculate the Month-over-Month (MoM) MRR Growth Rate
    SELECT 
        mr.month, 
        mr.month_number,
        mr.total_mrr,
        LAG(mr.total_mrr) OVER (ORDER BY mr.month_number) AS prev_mrr
    FROM monthly_revenue mr
)
SELECT 
    month, 
    month_number, 
    total_mrr, 
    -- Calculate Growth Rate: ((Current - Previous) / Previous) * 100
    COALESCE(
        ROUND(
            ((total_mrr - prev_mrr) * 100.0) / NULLIF(prev_mrr, 0), 2
        ), 0
    ) AS mrr_growth_rate_percentage
FROM mrr_growth
ORDER BY month_number;
