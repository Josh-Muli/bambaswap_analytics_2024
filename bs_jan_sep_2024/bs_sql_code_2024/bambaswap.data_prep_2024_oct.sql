

CREATE TABLE bambaswap_jan_2024_data
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
CREATE TABLE bambaswap_feb_2024_data
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

CREATE TABLE bambaswap_mar_2024_data
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

CREATE TABLE bambaswap_apr_2024_data
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

CREATE TABLE bambaswap_may_2024_data
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

CREATE TABLE bambaswap_jun_aug_2024_data
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

CREATE TABLE bambaswap_sep_2024_data
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

ALTER TABLE public.bambaswap_jan_2024_data OWNER to postgres;
ALTER TABLE public.bambaswap_feb_2024_data OWNER to postgres;
ALTER TABLE public.bambaswap_mar_2024_data OWNER to postgres;
ALTER TABLE public.bambaswap_apr_2024_data OWNER to postgres;
ALTER TABLE public.bambaswap_may_2024_data OWNER to postgres;
ALTER TABLE public.bambaswap_jun_aug_2024_data OWNER to postgres;
ALTER TABLE public.bambaswap_sep_2024_data OWNER to postgres;


COPY bambaswap_jan_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\JAN2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY bambaswap_feb_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\FEB2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY bambaswap_mar_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\MAR2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY bambaswap_apr_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\APR2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY bambaswap_may_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\MAY2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY bambaswap_jun_aug_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\JUN_AUG2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY bambaswap_sep_2024_data
FROM 'D:\MySQL\BAMBASWAP\bambaswap_monthly_data_2024\SEP2024.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM bambaswap_sep_2024_data

CREATE TABLE bambaswap_combined_jan_sep_2024
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

INSERT INTO bambaswap_combined_jan_sep_2024
SELECT * FROM bambaswap_jan_2024_data
UNION ALL
SELECT * FROM bambaswap_feb_2024_data
UNION ALL
SELECT * FROM bambaswap_mar_2024_data
UNION ALL
SELECT * FROM bambaswap_apr_2024_data
UNION ALL
SELECT * FROM bambaswap_may_2024_data
UNION ALL
SELECT * FROM bambaswap_jun_aug_2024_data
UNION ALL
SELECT * FROM bambaswap_sep_2024_data;

SELECT *
FROM bambaswap_combined_jan_sep_2024

--clean the phone_number column

UPDATE bambaswap_combined_jan_sep_2024
SET phone_number = 
    -- 1. Remove all non-numeric characters (e.g., `+`, `-`, `(`, `)`, spaces)
    REGEXP_REPLACE(phone_number, '[^0-9]', '', 'g');

SELECT *
FROM bambaswap_combined_jan_sep_2024;


-- add columns, month, month number, week, quarter
ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN time_only TIME,             -- Column for the time
ADD COLUMN month VARCHAR(3),  -- Column for the month (3-letter format)
ADD COLUMN month_number INT,           -- Column for the month number
ADD COLUMN week_number_by_month INT,   -- Column for the week number within the month
ADD COLUMN quarter VARCHAR(2);         -- Column for the quarter (e.g., Q1, Q2)


-- Update the table with the extracted time, month (3-letter), month number, week number by month, and quarter
UPDATE bambaswap_combined_jan_sep_2024
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
ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN amt_bracket VARCHAR(20),
ADD COLUMN bs_cost_bracket VARCHAR(20);

UPDATE bambaswap_combined_jan_sep_2024
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
FROM bambaswap_combined_jan_aug_2024

-- add expenditure column
ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN bs_expenditure NUMERIC(20);

UPDATE bambaswap_combined_jan_sep_2024

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
FROM bambaswap_combined_jan_sep_2024


-- add revenue column

ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN bs_revenue NUMERIC(20);

UPDATE bambaswap_combined_jan_sep_2024
SET bs_revenue = amount_recieved - amount_sent
WHERE
    trans_type LIKE 'AIRTIME';

SELECT *
FROM bambaswap_combined_jan_sep_2024
WHERE trans_type = 'AIRTIME' AND month = 'Aug';
-- add time bracket column

ALTER TABLE bambaswap_combined_jan_sep_2024
ADD time_bracket VARCHAR(20);

ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN time_bracket TEXT;

UPDATE bambaswap_combined_jan_sep_2024
SET time_bracket = CASE
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 0 AND 5 THEN '00:00 - 05:59'
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 6 AND 11 THEN '06:00 - 11:59'
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 12 AND 17 THEN '12:00 - 17:59'
    WHEN EXTRACT(HOUR FROM time_only) BETWEEN 18 AND 23 THEN '18:00 - 23:59'
END;



ALTER TABLE bambaswap_combined_jan_sep_2024
ADD week VARCHAR(20);

UPDATE bambaswap_combined_jan_sep_2024
SET week = CONCAT('Week ', week_number_by_month);



ALTER TABLE bambaswap_combined_jan_sep_2024
DROP column week_number_by_month;

SELECT *
FROM bambaswap_combined_jan_sep_2024;

-- Step 1: Add a new column 'shiftS' to the table
ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN shifts VARCHAR(20);



-- Step 2: Update the 'shift' column based on the time brackets
UPDATE bambaswap_combined_jan_sep_2024
SET shifts = CASE
    WHEN time_only >= '08:01:00' AND time_only <= '17:00:00' THEN 'Day Shift'
    WHEN time_only >= '17:01:00' OR time_only <= '08:00:00' THEN 'Night Shift'
    ELSE 'Unknown'  -- This handles any NULL or unexpected time values
END;

ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN day_type VARCHAR(10);

UPDATE bambaswap_combined_jan_sep_2024
SET day_type = CASE 
    WHEN EXTRACT(DOW FROM date) IN (1, 2, 3, 4, 5) THEN 'Weekday'  -- Monday to Friday
    WHEN EXTRACT(DOW FROM date) IN (0, 6) THEN 'Weekend'          -- Saturday and Sunday
    ELSE 'Unknown'
END;


UPDATE bambaswap_combined_jan_sep_2024
SET trans_type = CASE
    WHEN trans_type = 'CONVERSIONS' THEN 'CONVERSION' -- Keep as 'CONVERSIONS'
    WHEN trans_type = 'M2A' THEN 'AIRTIME'
    WHEN trans_type = 'A2M' THEN 'CONVERSION' -- Change 'A2M' to 'CONVERSIONS'
    ELSE trans_type -- Keep other values unchanged
END;

-- insert date only column
ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN date_only DATE;

UPDATE bambaswap_combined_jan_sep_2024
SET date_only = date::DATE;

-- insert a day column
ALTER TABLE bambaswap_combined_jan_sep_2024
ADD COLUMN day_of_week VARCHAR(3);


UPDATE bambaswap_combined_jan_sep_2024
SET day_of_week = TO_CHAR(date_only, 'Dy');


SELECT 
    *
FROM 
    bambaswap_combined_jan_sep_2024;

GROUP BY
    month;