![](file:///C:/Users/JOSHMSI/AppData/Local/Temp/msohtmlclip1/01/clip_image001.gif)SWAPFINTECKPIANALYSIS

![](file:///C:/Users/JOSHMSI/AppData/Local/Temp/msohtmlclip1/01/clip_image002.gif)![](file:///C:/Users/JOSHMSI/AppData/Local/Temp/msohtmlclip1/01/clip_image003.gif)Introduction

Tools

Used

The Analysis

1. Customer Acquisition Rate (C.A.R)
2. Customer Conversion Rate (C.C.R)
3. Monthly RecurringRevenue (M.R.R)
4. Mothly Retention Rate (R.R)
5. Churn Rate (C.R)
6. Customer Lifetime Value (C.L.V)

Conclusion

# **SWAPFINTEC KPI ANALYSIS**

Period:  January - September 2024

# **Introduction**

SwapFintech is a Kenyan fintech startup that provides a platform for users to instantly convert their airtime
to cash and purchase discounted airtime and data bundles. Founded with the mission of providing emergency cash
 to ordinary Kenyans, SwapFintech has quickly become a popular service in the country. One of SwapFintech’s key
  features is its airtime-to-cash conversion service. Users can convert their Safaricom airtime to M-PESA cash
  instantly, with a conversion fee of 30% and the user receiving 70% of the airtime value. The conversion process
  takes less than a minute, making it a convenient option for those in need of quick cash.

In addition to the airtime-to-cash service, SwapFintech also offers discounted airtime and data bundles. Users can purchase Safaricom airtime at a 10-15% discount and data bundles at a 15% discount. This feature has made it a popular choice for those looking to save money on their airtime and data purchases. SwapFintech has also integrated with other services such as Fuliza and Okoa Jahazi, allowing users to buy airtime using these mobile lending services. This integration has further increased the platform's convenience and accessibility for Kenyan users. The company has a strong focus on user experience, with a user-friendly interface and fast transaction speeds. SwapFintech has also received positive reviews from users, who have praised the service for its reliability, competitive pricing, and excellent customer service.

As a result, this KPI analysis dives deep in a effort to understand the company's past trend, customer behavior, growth and progress;
 hence shade in light in the future plans. This analysis is done using the PostgreSql and you can find all the queries here: [Bambaswap Analysis 2024](/https://github.com/Josh-Muli/bambaswap_analytisc_2024/blob/df1a03cdf693e421f8e2e3caf670d7c8e0b01b71/bs_sql_code_2024/)

# **Tools Used**

For my deep dive into the SwapFintech data analysis and KPI's, I harnessed the power of several key tools:

**SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.

**PostgreSQL:** The chosen database management system, ideal for handling the SwapFintech data.

**Visual Studio Code:** My go-to for database management and executing SQL queries.

**Power BI:** Essential for visuals utilized during the analysis.

**Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaborations and project tracking.

# **The Analysis**

Each query for this project aimed at investigating specific aspect of the SwapFintech KPI's. KPIs identified for the Swap Fintech to track progress and drive business growth include:-

**1.	Customer Acquisition Rate (C.A.R)**
**2.	Cusomer Conversion Rate (C.C.R)**
**3.	Monthly Recurring Revenue (M.R.R)**
**4.	Monthly Retention Rate (R.R)**
**5.	Churn Rate (C.R)**
**6.	Customer Lifetime Value (C.L.V)**

### **1.	Customer Acquisition Rate (C.A.R)**

**Customer Acquisition Rate (CAR)** measures the rate at which a business gains new customers over a
specific time period. In SwapFintech case, for the we are interested in calculating the **C.A.R** for
each month (from February to September) by comparing the number of new customers acquired in a given
month to the total number of customers from the previous month.
The formula utilized is :-

$$
\mathit{CAR_{Month}} = \frac{\mathit{New\ Customers\ in\ Current\ Month}}{\mathit{Total\ Customers\ in\ Previous\ Month}} \times 100
$$

Key terms :-

1. **Calculates the number of new customers** acquired each month by comparing them to the previous month.
2. Calculates the **CAR** for each month by comparing the number of new customers to the total customers in the previous month.
3. Outputs **CAR** as a percentage, helping to track how successful **SwapFintech** is at acquiring new customers over time.

sql query used :-

```sql
WITH monthly_customers AS (
    -- Step 1: Get distinct customers for each month using the date_only column
    SELECT DISTINCT phone_number, 
           EXTRACT(MONTH FROM date_only) AS month_number,
           TO_CHAR(date_only, 'Month') AS transaction_month  -- Get the month name from date_only
    FROM bambaswap_combined_jan_sep_2024
),
new_customers_per_month AS (
    -- Step 2: Find new customers in each month who did not appear in the previous month
    SELECT mc.phone_number, 
           mc.month_number,
           mc.transaction_month,
           LAG(mc.transaction_month) OVER (PARTITION BY mc.phone_number ORDER BY mc.month_number) AS previous_month
    FROM monthly_customers mc
),
new_customers_by_month AS (
    -- Step 3: Count new customers for each month
    SELECT transaction_month, 
           month_number,
           COUNT(phone_number) AS new_customers
    FROM new_customers_per_month
    WHERE (previous_month IS NULL OR transaction_month != previous_month)  -- New customers who didn’t appear in the previous month
    GROUP BY transaction_month, month_number
),
total_customers_by_month AS (
    -- Step 4: Calculate total customers in each month
    SELECT transaction_month, 
           month_number,
           COUNT(DISTINCT phone_number) AS total_customers
    FROM monthly_customers
    GROUP BY transaction_month, month_number
),
previous_month_customers AS (
    -- Step 5: Calculate total customers for the previous month using LAG function
    SELECT 
        transaction_month,
        month_number,
        LAG(total_customers) OVER (ORDER BY month_number) AS previous_month_customers
    FROM total_customers_by_month
)
-- Step 6: Calculate CAR by comparing new customers with the previous month's total customers
SELECT 
    n.transaction_month,
    n.month_number,
    n.new_customers,
    p.previous_month_customers,
    ROUND ((n.new_customers::NUMERIC / p.previous_month_customers) * 100,2) AS acquisition_rate
FROM new_customers_by_month n
JOIN previous_month_customers p ON n.transaction_month = p.transaction_month AND n.month_number = p.month_number
WHERE p.previous_month_customers IS NOT NULL  -- Ensure we're excluding January
ORDER BY n.month_number;
```

![Average Acquisition Rate](KPIs_jan_sep_2024\Assets_images\CAR_jan_sep_2024.png)
*A powerBI generated waterfall graph showing the monthly changes in the average aquisition rates for SwapFintech*

From the analysis and graph respesentation, the following conclusions can be drawn.

1. **Steady Growth in the first few Months, Followed by a Sharp Decline:** SwapFintech customer acquisition rate shows steady and strong growth from **February** *(70.98%)* to **April** *(108.97%).* However, in **May**, there is a notable decline, and by **June**, the acquisition rate drops drastically to *2.27%*. This suggests a significant slowdown in acquiring new customers after initial success.
2. **Drastic Drop in New Customers After May:** After **May**, the number of new customers falls dramatically, with **June** bringing in only *107* new customers compared to the thousands in previous months. This sharp decline may indicate a saturation point or external factors affecting customer acquisition.
3. **Low and Erratic Growth in Later Months:** After **June**, the customer acquisition rate shows small and somewhat erratic changes, ranging between *99%* and *103%*. The **new customer** count remains consistently low, fluctuating between *107* and *112*. This indicates SwapFintech struggled to regain momentum after the significant drop in **June**, suggesting difficulty in sustaining high acquisition rates long-term.

### **2.	Customer Conversion Rate (C.C.R)**

**SwapFintech Customer Conversion Rate** is defined as the percentage of potential customers (such as visitors to Bambaswap website, users of Bambaswap app, or recipients of a marketing campaign) who completed a transaction i.e successfully converted airtime into cash or successfully bought airtime from SwapFintech platforms during a specific period.
The CCR formula is :-

$$
\mathit{CCR_{Month}} = \frac {\mathit{Number\ of\ Conversions}}{\mathit{Number\ of\ Visitors}} \times 100
$$

Where:

**Number of Conversions:** The number of SwapFintech customers who completed the desired action (e.g., successfully converted  airtime to cash or bought Airtime).

**Total Number of Leads or Visitors:** The total number of potential customers who interacted with the SwapFintech platforms but may not have completed the action (e.g., did not complete the process of buying or converting airtime).

sql query used :-

```sql
WITH transacted_customers AS (
    SELECT
        month,
        month_number,
        COUNT(DISTINCT phone_number) AS transacted_count
    FROM
        bambaswap_combined_jan_sep_2024
    WHERE
        state = 'complete'
    GROUP BY
        month, month_number
),
total_leads AS (
    SELECT
        month,
        month_number,
        COUNT(DISTINCT phone_number) AS total_leads_count
    FROM
        bambaswap_combined_jan_sep_2024
    GROUP BY
        month, month_number
)
SELECT
    t.month,
    t.month_number,
    t.transacted_count,
    l.total_leads_count,
    ROUND(
        (t.transacted_count::decimal / l.total_leads_count) * 100, 2
    ) AS conversion_rate_percentage
FROM
    transacted_customers t
JOIN
    total_leads l ON t.month = l.month AND t.month_number = l.month_number
ORDER BY
    t.month_number;
```

![Customer Conversion Rate](KPIs_jan_sep_2024\Assets_images\CCR_jan_sep_2024.png)

*A powerBI generated waterfall graph showing the monthly SwapFintech average conversion rates*

From the above customer conversion anaysis, the following conclusions were made :-

1. **Consistent Conversion Rate in the First Five Months:** From **January** to **May**, the customer conversion rate remains relatively stable, fluctuating between *66.21%* and *68.58%*. This indicates that the company's ability to convert leads into transacting customers was consistent during this period, with only minor variations.
2. **Sharp Decline in Conversion Rate After May:** Starting in **June**, there is a notable drop in the conversion rate, falling to *64.49%* and continuing to decline each month, reaching *60.71%* by **September**. This indicates a downward trend in conversion efficiency, suggesting that either the quality of leads decreased, or external factors affected the conversion process in the later months.
3. **Significant Decrease in Both Leads and Transactions After May:** In addition to the drop in the conversion rate, the total number of leads and transactions drops significantly from **June** onwards. While earlier months see thousands of leads and transactions, from **June** to **September**, the numbers plummet to double digits, with very few leads (around 100 each month) and correspondingly low transaction counts. This dramatic decrease in volume highlights a major reduction in overall SwapFintech business activity, which may have contributed to the decline in conversion rates.

### **3.	Monthly Recurring Revenue (M.R.R)**

**Monthly Recurring Revenue (MRR)** represents the total amount of revenue a SwapFintech expects to earn from its active members/ loyal customers on a monthly basis. It excludes any one-time fees or non-recurring charges. **MRR** provides a clear view of a SwapFintech's revenue health and helps track growth trends over time.
**MRR** is typically calculated by multiplying the **average revenue per customer (ARPU)** by the total number of recurring customers in a given month.

Here's a formula to calculate MRR:

$$
\mathit {MMR} = \mathit{ARPU\ } times \mathit{Number\ of\ Recurring\ Customers}
$$

Where:

**ARPU**: Average Revenue Per User in that month.

**Number of Recurring Customers:**
Total number of customers who are generating revenue on a recurring basis each month.

sql query used :-

```sql
WITH arpu AS (
    -- Calculate total revenue for each month
    SELECT
        month,
        month_number,
        SUM(bs_revenue) AS total_revenue
    FROM
        bambaswap_combined_jan_sep_2024
    GROUP BY
        month, month_number
), 
filtered_numbers AS (
    -- Count the number of loyal customers (phone numbers that appear 3 or more times in a month)
    SELECT 
        month,
        month_number,
        COUNT(DISTINCT phone_number) AS loyal_customers
    FROM (
        SELECT 
            phone_number,
            month,
            month_number
        FROM bambaswap_combined_jan_sep_2024
        GROUP BY 
            phone_number, month, month_number
        HAVING COUNT(*) > 1 -- Loyal customers appear 3 or more times in the month
    ) AS loyal_customers_per_month
    GROUP BY 
        month, month_number
)
-- Calculate ARPU (Total Revenue / Number of Loyal Customers) per month
, arpu_calculation AS (
    SELECT 
        arpu.month,
        arpu.month_number,
        -- Use COALESCE to handle NULL values for loyal_customers
        ROUND(CASE 
            WHEN COALESCE(filtered_numbers.loyal_customers, 0) = 0 THEN 0 
            ELSE arpu.total_revenue / COALESCE(filtered_numbers.loyal_customers, 0)
        END, 2) AS arpu
    FROM
        arpu
    LEFT JOIN 
        filtered_numbers ON arpu.month = filtered_numbers.month
)
-- Final MRR calculation for each month
SELECT 
    arpu_calculation.month,                -- Month in date format (e.g., 2023-01-01)
    arpu_calculation.month_number,         -- Month number (e.g., 1 for January)
    arpu_calculation.arpu,                 -- ARPU value
    -- Calculate MRR as ARPU * loyal customers, using COALESCE to handle missing values
    ROUND(CASE 
        WHEN COALESCE(filtered_numbers.loyal_customers, 0) = 0 THEN 0 
        ELSE arpu_calculation.arpu * COALESCE(filtered_numbers.loyal_customers, 0)
    END, 2) AS mrr -- MRR calculation
FROM
    arpu_calculation
LEFT JOIN 
    filtered_numbers ON arpu_calculation.month = filtered_numbers.month
ORDER BY 
    arpu_calculation.month_number;
```

![Monthly Recurring Rate](KPIs_jan_sep_2024\Assets_images\Recurring_Rate_jan_sep_2024.png)

*A powerBI generated graph showing the monthly changes in ARPU and Monthly Recurring Rate for SwapFintech*

Here are three main summary insights from the Monthly Recurring Revenue (MRR) data for Bambaswap from January to September 2024:

1. **MRR Decline in the First Quarter:** There was a noticeable decline in MRR from **January** *($1,163,542.32)* to **March** (*$1,031,313.14*). This could indicate a potential issue in customer retention or reduced business performance in the early part of the year.
2. **Missing MMR in April:** The absence of data for both **ARPU (Average Revenue per User)** and **MRR** in April stands out. This gap may indicate data collection issues or irregularities in revenue tracking for that month, which could affect trend analysis for the entire period. Or **No New Customer Acquisition:** that is if SwapFintech did not acquiring any new customers and all existing customers had either churned or did only one transaction in the period, hence the MRR dropped to zero.
3. **Recovery and Stabilization in Later Months**: After the dip in **March**, MRR increases again in May (*$834,098.52*) and stabilizes around a similar range from **June** to **September,** fluctuating between approximately *$760,338* and *$856,160*. This suggests that after the initial drop, the revenue stabilizes, albeit at a lower level compared to the first quarter.

### **4.	Monthly Retention Rate (R.R)**

**The Retention Rate (R.R)** is a metric used to measure the percentage of customers who remain active or continue using a service over a specific period of time. It is the opposite of the churn rate and is a critical indicator of customer loyalty and the effectiveness of a business in retaining its existing customers. In SwapFintech, loyal customers was measured by the number of customers who made more than three 3 transactions in a month.

* **Identify Qualified Customers** : Customers who have made more than 3 transactions in a given month.
* **Identify Retained Customers** : Customers who made more than 3 transactions in  **consecutive months** .
* **Calculate Retention Rate** : For each month, calculate the Retention Rate as the percentage of **retained customers** (those with consecutive month activity) over the **total qualified customers** for that month.

To calculate the **Retention Rate (R.R)**, you can use the following formula:

$$
\mathit {Retention Rate}_{(RR)} = \frac {{\mathit (RetainedCustomers)}}{\mathit {TotalCustomersInCurrentMonth}} \mathit {\times 100}
$$

Query used was

```sql
WITH customer_transactions AS (
    -- Count the number of transactions per phone_number per month
    SELECT 
        phone_number, 
        month, 
        month_number,
        COUNT(*) AS transaction_count
    FROM 
        bambaswap_combined_jan_sep_2024
    GROUP BY 
        phone_number, month, month_number
),
qualified_customers AS (
    -- Filter for customers with more than 1 transactions per month
    SELECT 
        phone_number, 
        month, 
        month_number
    FROM 
        customer_transactions
    WHERE 
        transaction_count > 1
),
retained_customers AS (
    -- Join the customers with consecutive months to find retained customers
    SELECT 
        q1.phone_number, 
        q1.month AS current_month, 
        q2.month AS next_month
    FROM 
        qualified_customers q1
    INNER JOIN 
        qualified_customers q2
    ON 
        q1.phone_number = q2.phone_number
        AND q1.month_number = q2.month_number - 1  -- Check for consecutive months
)
-- Final calculation of the retention rate
SELECT 
    q1.month AS current_month, 
    COUNT(DISTINCT q2.phone_number) AS retained_customers, 
    COUNT(DISTINCT q1.phone_number) AS total_customers,
    ROUND ((COUNT(DISTINCT q2.phone_number) * 100.0) / COUNT(DISTINCT q1.phone_number),2) AS retention_rate
FROM 
    qualified_customers q1
LEFT JOIN 
    retained_customers q2
ON 
    q1.phone_number = q2.phone_number
    AND q1.month = q2.current_month
GROUP BY 
    q1.month, q1.month_number
ORDER BY 
    q1.month_number;
```

![Monthly Retention Rate](KPIs_jan_sep_2024\Assets_images\Retention_Rate_jan_sep_2024.png)

*A powerBI generated graph showing the monthly changes in Monthly Retention Rate*

Here are the main insights drawn from the analyzed SwapFintech Retention Rate.

1. **Retention Spike in March and April:** In **March** and **April,** retention rates were significantly higher compared to **January** and **February**, reaching *36.01%* and *32.62%* respectively. This may suggest that a successful strategy (e.g., a new promotion, product launch, or improved customer experience) was implemented around this period, which led to increased retention.
   The increase could indicate a period of strong customer loyalty, or that customers found value during this time and returned for additional transactions.
2. **Drastic Drop in Retention in May and September:** **May** and **September** show *0%* retention rates, indicating that no customers were retained into the following month. This is a critical insight, as it suggests a major issue in sustaining customer interest or satisfaction during these periods.
   This may indicate seasonal fluctuations, operational disruptions, or customer disengagement. Identifying the cause and addressing it would be essential to prevent similar drops in the future.
3. **Consistent High Retention in Summer Months (June to August):** The retention rates from **June** to **August** were exceptionally high, with over *89%* each month. This suggests that customers who made transactions in **June** were highly likely to return in the following months.
   High retention rates in the summer months indicate strong customer loyalty during this period, possibly driven by seasonal demand, effective retention strategies, or specific product/service appeal during these months.

### **5.	Monthly Churn Rate (R.R)**

**Churn Rate** is the customers who stopped using a products and/ or services during a given period. This measures the customer attrition.
The churn rate for **SwapFintech** measures the percentage of customers who were active in one month but did not make any transactions in the following month. In other words, it is the rate at which customers stop using SwapFintech's services from one month to the next. Churn rate helps identify how many customers leave or "churn" out of the total customer base month by month, which is essential for understanding customer retention and engagement levels over time.

The SwapFintech churn rate formula in this query is:

Churn Rate Formula

To calculate the **Churn Rate**, use the following formula:

$$
\mathit{Churn Rate} = \frac{\mathit{Total Customers in Current Month} - \mathit{Retained Customers (Customers in Next Month)}}{\mathit{Total Customers in Current Month}} \times 100
$$

Here is the sql query used for the churn rate

```sql
WITH customer_transactions AS (
    -- Count the number of transactions per phone_number per month
    SELECT 
        phone_number, 
        month, 
        month_number,
        COUNT(*) AS transaction_count
    FROM 
        bambaswap_combined_jan_sep_2024
    GROUP BY 
        phone_number, month, month_number
),
qualified_customers AS (
    -- Filter for customers with more than 3 transactions per month
    SELECT 
        phone_number, 
        month, 
        month_number
    FROM 
        customer_transactions
    WHERE 
        transaction_count > 2
),
retained_customers AS (
    -- Join the customers with consecutive months to find retained customers
    SELECT 
        q1.phone_number, 
        q1.month_number,
        q1.month AS current_month, 
        q2.month AS next_month
    FROM 
        qualified_customers q1
    INNER JOIN 
        qualified_customers q2
    ON 
        q1.phone_number = q2.phone_number
        AND q1.month_number = q2.month_number - 1  -- Check for consecutive months
),
churned_customers AS (
    -- Find customers who churned (did not return in the next month)
    SELECT 
        q1.phone_number, 
        q1.month_number,
        q1.month AS current_month
    FROM 
        qualified_customers q1
    LEFT JOIN 
        retained_customers q2
    ON 
        q1.phone_number = q2.phone_number 
        AND q1.month = q2.current_month
    WHERE 
        q2.phone_number IS NULL  -- Only include customers who did not return
)
-- Final calculation of the churn rate
SELECT 
    q1.month AS current_month, 
    q1.month_number,
    COUNT(DISTINCT q1.phone_number) AS total_customers,
    COUNT(DISTINCT c.phone_number) AS churned_customers,
    ROUND ((COUNT(DISTINCT c.phone_number) * 100.0) / COUNT(DISTINCT q1.phone_number),2) AS churn_rate
FROM 
    qualified_customers q1
LEFT JOIN 
    churned_customers c
ON 
    q1.phone_number = c.phone_number 
    AND q1.month = c.current_month
GROUP BY 
    q1.month,q1.month_number
ORDER BY 
    q1.month_number;
```

![Churn Rate Graph](KPIs_jan_sep_2024\Assets_images\Churn_Rate_jan_sep_2024.png)

*A powerBI generated graph showing the monthly changes in Monthly Churn Rate*

SwapFintech churn Rate insight from the above analysis ;-

1. **High Initial Churn Rates and Sudden Spikes:** The churn rate is extremely high in the first five months, with **May** showing a full *100%* churn rate. This suggests that a significant number of customers are leaving in the early stages, potentially indicating initial dissatisfaction or unmet expectations.
2. **Drastic Reduction in Churn Post-May:** Starting from **June**, there is a notable drop in churn rates (*3.96%* in **June**, *7%* in **July**, *4%* in **August**), indicating an improvement in customer retention or fewer new customers to churn. This drop may reflect targeted retention efforts, improvements in product satisfaction, or a reduced acquisition pace.
3. **Recurring High Churn Instances:** Another 100% churn appears in **September**, similar to **May**. This sharp recurrence could signal specific issues surfacing cyclically (like quarterly review processes or seasonally dissatisfied customers), or it could indicate particular external factors impacting customer retention around these times.

### **6.	Customer Lifetime Value (CLV)**

**Customer Lifetime Value (CLV)** is a key metric in business that represents the total revenue a business can expect to earn from a single customer over the entire time that the customer interacts with the business. It helps businesses understand the long-term value of their customers and assess how much they should spend to acquire and retain customers.
SwapFintech CLV for each month was calculated by considering the **average revenue per user (ARPU)** and the **churn rate**.
SwapFintech CLV is calculated on a monthly basis, using the formula:

$$
\mathit {CLV} = \frac {\mathit{ARPU}}{\mathit {ChurnRate}}
$$

where:

**ARPU (Average Revenue Per User):** This is calculated as the total revenue for the month divided by the number of unique customers that month.
**Churn Rate:** The percentage of customers who did not return in the following month.

The below query was utilized to calculate the CLV

```sql
CREATE TABLE customer_lifetime_value_jan_sep_2024 AS
WITH customers_current_month AS (
    -- Get distinct customers who made at least one transaction in each month
    SELECT 
        phone_number,
        month_number,
        month
    FROM 
        bambaswap_combined_jan_sep_2024
    GROUP BY 
        phone_number, month_number, month
),
customers_next_month AS (
    -- Get distinct customers who made at least one transaction in the next month
    SELECT 
        phone_number,
        month_number AS next_month_number
    FROM 
        bambaswap_combined_jan_sep_2024
    GROUP BY 
        phone_number, month_number
),
monthly_revenue AS (
    -- Calculate total revenue and ARPU for each month
    SELECT 
        month_number,
        month,
        SUM(bs_revenue) AS total_revenue,
        COUNT(DISTINCT phone_number) AS total_customers,
        ROUND (SUM(bs_revenue) / COUNT(DISTINCT phone_number),2) AS arpu -- ARPU calculation
    FROM 
        bambaswap_combined_jan_sep_2024
    GROUP BY 
        month_number, month
),
churn_rate AS (
    -- Calculate churn rate for each month
    SELECT 
        cm.month,                              -- 3-letter month name
        cm.month_number,                                -- Numeric month
        COUNT(DISTINCT cm.phone_number) AS total_customers, -- Total customers in the month
        ROUND (COUNT(DISTINCT cm.phone_number) - COUNT(DISTINCT nm.phone_number),2) AS churned_customers, -- Customers who churned
        ROUND((COUNT(DISTINCT cm.phone_number) - COUNT(DISTINCT nm.phone_number)) * 100.0 / COUNT(DISTINCT cm.phone_number), 2) AS churn_rate -- Churn rate calculation
    FROM 
        customers_current_month cm
    LEFT JOIN 
        customers_next_month nm 
    ON 
        cm.phone_number = nm.phone_number 
        AND cm.month_number = nm.next_month_number - 1 -- Join with next month data
    GROUP BY 
        cm.month, cm.month_number
)
-- Final CLV calculation: CLV = ARPU / Churn Rate
SELECT 
    mr.month, -- 3-letter month name
    mr.month_number,   -- Numeric month
    mr.arpu,           -- Average Revenue Per User (ARPU)
    cr.churn_rate,     -- Churn Rate (%)
    CASE 
        WHEN cr.churn_rate > 0 THEN ROUND(mr.arpu / (cr.churn_rate / 100), 2)  -- CLV calculation
        ELSE NULL
    END AS clv         -- CLV calculation (if churn_rate > 0)
FROM 
    monthly_revenue mr
JOIN 
    churn_rate cr ON mr.month_number = cr.month_number
ORDER BY 
    mr.month_number;

SELECT *
FROM customer_lifetime_value_jan_sep_2024;
```

![CLV graph](KPIs_jan_sep_2024\Assets_images\CLV_jan_sep_2024.png)

From the above analysis,the following insights were drawn;-

Extremely High ARPU Variability:

1. **Monthly ARPU values vary significantly**, with a few months reaching very high ARPU (e.g., **June** with *KES8001.50 and **August** with KES *7750.82*), *which drastically boosts the CLV during those months. This variance suggests either substantial differences in customer spending across periods or some months seeing high-spending customers.
   Impact of Churn Rate on CLV*:*
2. **A high churn rate**, such as in **May** and **September** (both *100%*), results in a low CLV. Months with low churn rates (e.g., **August** at *0.93%*) yield very high CLVs, indicating that retaining customers significantly improves lifetime value.
3. **Irregular CLV Distribution:** The CLV distribution is inconsistent, with a few months like **June** and **August** seeing CLVs over *KES**100,000*, while others (such as **May** and **September**) are below *KES**10,000*. This distribution suggests possible cyclical changes in customer behavior or external factors impacting both churn and ARPU.

# **Conclusion**

The analysis reveals a stark transition in **SwapFintech's** customer acquisition and retention dynamics post-May, characterized by a steep decline in new customer growth and retention, alongside erratic monthly revenue patterns. Despite initial high acquisition and stable conversion rates, the sudden downturn in both acquisition and retention suggests potential saturation or market shift. This volatility is mirrored in customer lifetime value (CLV) and churn metrics, where high ARPU months sharply contrast with periods of low CLV and high churn. The data suggests that SwapFintech may benefit from enhancing its retention strategies to mitigate high churn, stabilizing revenue streams, and investigating underlying causes behind seasonal acquisition and retention challenges to improve long-term customer value and business stability.
