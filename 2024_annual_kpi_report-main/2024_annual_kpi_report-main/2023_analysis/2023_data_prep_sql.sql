

CREATE TABLE bambaswap_2023_data
(
    date TIMESTAMP,
    phone_number TEXT,
    amount_recieved INT,
    amount_sent NUMERIC,
    results_description TEXT,
    device_name TEXT,
    sessionID TEXT,
    state TEXT,
    trans_Type TEXT
);




ALTER TABLE public.bambaswap_2023_data OWNER to postgres;


COPY bambaswap_2023_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_analysis_2024\2023\bambaswap_data_2023.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');






SELECT *
FROM bambaswap_2023_data

--clean the phone_number column

UPDATE bambaswap_2023_data
SET phone_number = 
    -- 1. Remove all non-numeric characters (e.g., `+`, `-`, `(`, `)`, spaces)
    REGEXP_REPLACE(phone_number, '[^0-9]', '', 'g');

SELECT *
FROM bambaswap_2023_data;

-- add columns, month, month number, week, quarter
ALTER TABLE bambaswap_2023_data
ADD COLUMN time_only TIME,             -- Column for the time
ADD COLUMN month VARCHAR(3),  -- Column for the month (3-letter format)
ADD COLUMN month_number INT,           -- Column for the month number
ADD COLUMN week_number_by_month INT,   -- Column for the week number within the month
ADD COLUMN quarter VARCHAR(2);         -- Column for the quarter (e.g., Q1, Q2)


-- Update the table with the extracted time, month (3-letter), month number, week number by month, and quarter
UPDATE bambaswap_2023_data
SET 
    time_only = date ::TIME,                    -- Extract time portion
    month = TO_CHAR(date, 'Mon'),     -- 3-letter month name (e.g., Jan)
    month_number = EXTRACT(MONTH FROM date),   -- Numeric month (e.g., 1 for January)
    week_number_by_month = EXTRACT(WEEK FROM date) - EXTRACT(WEEK FROM DATE_TRUNC('month', date)) + 1, -- Week number within the month
    quarter = CONCAT('Q', EXTRACT(QUARTER FROM date));  -- Quarter (e.g., Q1, Q2)

SELECT date, week_number_by_month
FROM bambaswap_combined_jan_aug_2024
WHERE month = 'Aug';

-- add amount brackets
ALTER TABLE bambaswap_2023_data
ADD COLUMN amt_bracket VARCHAR(20),
ADD COLUMN bs_cost_bracket VARCHAR(20);

UPDATE bambaswap_2023_data
SET 
    amt_bracket = CASE 
        WHEN amount_recieved > 0 AND amount_recieved <= 49 THEN '0-49'
        WHEN amount_recieved >= 50 AND amount_recieved <= 100 THEN '50-100'
        WHEN amount_recieved >= 101 AND amount_recieved <= 500 THEN '101-500'
        WHEN amount_recieved >= 501 AND amount_recieved <= 1000 THEN '501-1000'
        WHEN amount_recieved >= 1001 AND amount_recieved <= 1500 THEN '1001-1500'
        WHEN amount_recieved >= 1501 AND amount_recieved <= 2500 THEN '1501-2500'
        WHEN amount_recieved >= 2501 AND amount_recieved <= 3500 THEN '2501-3500'
        WHEN amount_recieved >= 3501 AND amount_recieved <= 5000 THEN '3501-5000'
        WHEN amount_recieved >= 5001 AND amount_recieved <= 7500 THEN '5001-7500'
        WHEN amount_recieved >= 7501 AND amount_recieved <= 10000 THEN '7501-10000'
        WHEN amount_recieved >= 10001 AND amount_recieved <= 15000 THEN '10001-15000'
        WHEN amount_recieved >= 15001 AND amount_recieved <= 20000 THEN '15001-20000'
        WHEN amount_recieved >= 20001 AND amount_recieved <= 35000 THEN '20001-35000'
        WHEN amount_recieved >= 35001 AND amount_recieved <= 50000 THEN '35001-50000'
        WHEN amount_recieved >= 50001 AND amount_recieved <= 150000 THEN '50001-150000'
        ELSE NULL
    END,
    bs_cost_bracket = CASE 
        WHEN amount_sent > 0 AND amount_sent <= 49 THEN '0-49'
        WHEN amount_sent >= 50 AND amount_sent <= 100 THEN '50-100'
        WHEN amount_sent >= 101 AND amount_sent <= 500 THEN '101-500'
        WHEN amount_sent >= 501 AND amount_sent <= 1000 THEN '501-1000'
        WHEN amount_sent >= 1001 AND amount_sent <= 1500 THEN '1001-1500'
        WHEN amount_sent >= 1501 AND amount_sent <= 2500 THEN '1501-2500'
        WHEN amount_sent >= 2501 AND amount_sent <= 3500 THEN '2501-3500'
        WHEN amount_sent >= 3501 AND amount_sent <= 5000 THEN '3501-5000'
        WHEN amount_sent >= 5001 AND amount_sent <= 7500 THEN '5001-7500'
        WHEN amount_sent >= 7501 AND amount_sent <= 10000 THEN '7501-10000'
        WHEN amount_sent >= 10001 AND amount_sent <= 15000 THEN '10001-15000'
        WHEN amount_sent >= 15001 AND amount_sent <= 20000 THEN '15001-20000'
        WHEN amount_sent >= 20001 AND amount_sent <= 35000 THEN '20001-35000'
        WHEN amount_sent >= 35001 AND amount_sent <= 50000 THEN '35001-50000'
        WHEN amount_sent >= 50001 AND amount_sent <= 150000 THEN '50001-150000'
        ELSE NULL
    END;


SELECT amount_recieved,amt_bracket
FROM bambaswap_2023_data;

-- add expenditure column
ALTER TABLE bambaswap_2023_data
ADD COLUMN bs_expenditure NUMERIC(20);

UPDATE bambaswap_2023_data

SET bs_expenditure = CASE
            WHEN bs_cost_bracket LIKE '0-49' THEN 0
            WHEN bs_cost_bracket LIKE '50-100' THEN 0
            WHEN bs_cost_bracket LIKE '101-500' THEN 4
            WHEN bs_cost_bracket LIKE '501-1000' THEN 4
            WHEN bs_cost_bracket LIKE '1001-1500' THEN 4
            WHEN bs_cost_bracket LIKE '1501-2500' THEN 8
            WHEN bs_cost_bracket LIKE '2501-3500' THEN 8
            WHEN bs_cost_bracket LIKE '3501-5000' THEN 8
            WHEN bs_cost_bracket LIKE '5001-7500' THEN 10
            WHEN bs_cost_bracket LIKE '7501-10000' THEN 10
            WHEN bs_cost_bracket LIKE '10001-15000' THEN 10
            WHEN bs_cost_bracket LIKE '15001-20000' THEN 10
            WHEN bs_cost_bracket LIKE '20001-35000' THEN 12
            WHEN bs_cost_bracket LIKE '35001-50000' THEN 12
            WHEN bs_cost_bracket LIKE '50001-150000' THEN 12
            ELSE NULL
        END

        WHERE
            trans_type LIKE 'CONVERSION';


SELECT *
FROM bambaswap_2023_data


-- add revenue column

ALTER TABLE bambaswap_2023_data
ADD COLUMN bs_revenue NUMERIC(20);

UPDATE bambaswap_2023_data
SET bs_revenue = amount_recieved - amount_sent
WHERE
    trans_type LIKE 'AIRTIME';

SELECT *
FROM bambaswap_2023_data
WHERE trans_type = 'AIRTIME' AND month = 'Aug';
-- add time bracket column

ALTER TABLE bambaswap_2023_data
ADD time_bracket VARCHAR(20);

ALTER TABLE bambaswap_2023_data
ADD COLUMN time_bracket TEXT;

UPDATE bambaswap_2023_data
SET time_bracket = CASE
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 0 AND 5 THEN '00:00 - 05:59'
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 6 AND 11 THEN '06:00 - 11:59'
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 12 AND 17 THEN '12:00 - 17:59'
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 18 AND 23 THEN '18:00 - 23:59'
END;



ALTER TABLE bambaswap_2023_data
ADD week VARCHAR(20);

UPDATE bambaswap_2023_data
SET week = CONCAT('Week ', week_number_by_month);



ALTER TABLE bambaswap_2023_data
DROP column week_number_by_month;


-- adding date only column
ALTER TABLE bambaswap_2023_data
ADD COLUMN date_only DATE;

UPDATE bambaswap_2023_data
SET date_only = date::DATE;





SELECT *
FROM bambaswap_2023_data


