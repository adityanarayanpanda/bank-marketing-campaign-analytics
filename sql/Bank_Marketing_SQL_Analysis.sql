CREATE DATABASE bank_marketing_analytics;
USE bank_marketing_analytics;
SELECT DATABASE();

CREATE TABLE bank_marketing_cleaned (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(50),
    `default` VARCHAR(20),
    housing VARCHAR(20),
    loan VARCHAR(20),
    contact VARCHAR(20),
    month VARCHAR(10),
    day_of_week VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    previous_campaign_outcome VARCHAR(20),
    emp_var_rate DECIMAL(5,2),
    cons_price_idx DECIMAL(7,3),
    cons_conf_idx DECIMAL(5,1),
    euribor3m DECIMAL(6,3),
    nr_employed DECIMAL(7,1),
    subscribed VARCHAR(10),
    previously_contacted VARCHAR(10),
    age_group VARCHAR(20),
    campaign_contact_group VARCHAR(20),
    previous_contact_recency_group VARCHAR(30),
    loan_status VARCHAR(30)
);

DESCRIBE bank_marketing_cleaned;

SELECT COUNT(*) AS total_rows
FROM bank_marketing_cleaned;

-- Missing Values Check 
SELECT 
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS null_job,
    SUM(CASE WHEN marital IS NULL THEN 1 ELSE 0 END) AS null_marital,
    SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) AS null_education,
    SUM(CASE WHEN `default` IS NULL THEN 1 ELSE 0 END) AS null_default,
    SUM(CASE WHEN housing IS NULL THEN 1 ELSE 0 END) AS null_housing,
    SUM(CASE WHEN loan IS NULL THEN 1 ELSE 0 END) AS null_loan,
    SUM(CASE WHEN contact IS NULL THEN 1 ELSE 0 END) AS null_contact,
    SUM(CASE WHEN month IS NULL THEN 1 ELSE 0 END) AS null_month,
    SUM(CASE WHEN day_of_week IS NULL THEN 1 ELSE 0 END) AS null_day_of_week,
    SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS null_duration,
    SUM(CASE WHEN campaign IS NULL THEN 1 ELSE 0 END) AS null_campaign,
    SUM(CASE WHEN pdays IS NULL THEN 1 ELSE 0 END) AS null_pdays,
    SUM(CASE WHEN previous IS NULL THEN 1 ELSE 0 END) AS null_previous,
    SUM(CASE WHEN previous_campaign_outcome IS NULL THEN 1 ELSE 0 END) AS null_prev_outcome,
    SUM(CASE WHEN emp_var_rate IS NULL THEN 1 ELSE 0 END) AS null_emp_var_rate,
    SUM(CASE WHEN cons_price_idx IS NULL THEN 1 ELSE 0 END) AS null_cons_price_idx,
    SUM(CASE WHEN cons_conf_idx IS NULL THEN 1 ELSE 0 END) AS null_cons_conf_idx,
    SUM(CASE WHEN euribor3m IS NULL THEN 1 ELSE 0 END) AS null_euribor3m,
    SUM(CASE WHEN nr_employed IS NULL THEN 1 ELSE 0 END) AS null_nr_employed,
    SUM(CASE WHEN subscribed IS NULL THEN 1 ELSE 0 END) AS null_subscribed,
    SUM(CASE WHEN previously_contacted IS NULL THEN 1 ELSE 0 END) AS null_prev_contacted,
    SUM(CASE WHEN age_group IS NULL THEN 1 ELSE 0 END) AS null_age_group,
    SUM(CASE WHEN campaign_contact_group IS NULL THEN 1 ELSE 0 END) AS null_campaign_group,
    SUM(CASE WHEN previous_contact_recency_group IS NULL THEN 1 ELSE 0 END) AS null_recency_group,
    SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END) AS null_loan_status
FROM bank_marketing_cleaned;

-- duplicate check 
SELECT *
FROM bank_marketing_cleaned
GROUP BY age, job, marital, education, `default`, housing, loan, contact, month, day_of_week,
duration, campaign, pdays, previous, previous_campaign_outcome, emp_var_rate,
cons_price_idx, cons_conf_idx, euribor3m, nr_employed, subscribed,
previously_contacted, age_group, campaign_contact_group,
previous_contact_recency_group, loan_status
HAVING COUNT(*) > 1;

-- Overall Campaign Conversion
SELECT subscribed,COUNT(*) AS customer_count,
ROUND(COUNT(*)* 100.0/(SELECT COUNT(*) FROM bank_marketing_cleaned), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY subscribed;

-- Overall Campaign KPI
SELECT COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END)*100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned;

-- Campaign Contact Frequency
SELECT campaign_contact_group,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY campaign_contact_group
ORDER BY campaign_contact_group;

-- Contact Method Analysis
SELECT contact,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY contact
ORDER BY conversion_rate DESC;

-- Previous Campaign Outcome
SELECT previous_campaign_outcome,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY previous_campaign_outcome
ORDER BY conversion_rate DESC;

-- Age Group Conversion
SELECT age_group,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY age_group
ORDER BY conversion_rate DESC;

-- Education Conversion
SELECT education,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY education
ORDER BY conversion_rate DESC;

-- Job / Occupation Analysis
SELECT job,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY job
ORDER BY conversion_rate DESC;

-- Marital Status Analysis
SELECT marital,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY marital
ORDER BY conversion_rate DESC;

-- Housing Loan Status
SELECT housing,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY housing
ORDER BY conversion_rate DESC;

-- Personal Loan Status
SELECT loan,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY loan
ORDER BY conversion_rate DESC;

-- Loan Status Combined Analysis
SELECT loan_status,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY loan_status
ORDER BY conversion_rate DESC;

-- Campaign Contact Frequency
SELECT campaign_contact_group,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY campaign_contact_group
ORDER BY conversion_rate DESC;

-- Contact Month Analysis
SELECT month,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY month
ORDER BY conversion_rate DESC;

-- Day of Week Analysis
SELECT day_of_week,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY day_of_week
ORDER BY conversion_rate DESC;

-- Previous Contact History
SELECT previously_contacted,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY previously_contacted
ORDER BY conversion_rate DESC;

-- Number of Previous Contacts
SELECT previous,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY previous
ORDER BY conversion_rate DESC;

-- Economic Environment
SELECT emp_var_rate,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY emp_var_rate
ORDER BY emp_var_rate;

-- Euribor 3-Month Rate
SELECT euribor3m,COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed ='yes'THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed ='no'THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*), 2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY euribor3m
ORDER BY euribor3m; 

-- Euribor Rate Bands and analysis
SELECT CASE
WHEN euribor3m <1.0 THEN '< 1.0'
WHEN euribor3m <2.0 THEN '1.0–2.0'
WHEN euribor3m <3.0 THEN '2.0–3.0'
WHEN euribor3m< 4.0 THEN '3.0–4.0'
WHEN euribor3m < 4.5 THEN '4.0–4.5'
ELSE '4.5+'
END AS euribor_band,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed='no' THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) *100.0 / COUNT(*),2) 
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY euribor_band
ORDER BY CASE euribor_band
WHEN '< 1.0' THEN 1
WHEN '1.0–2.0' THEN 2
WHEN '2.0–3.0' THEN 3
WHEN '3.0–4.0' THEN 4
WHEN '4.0–4.5' THEN 5
ELSE 6
END;

-- number of employees in the economy
SELECT CASE
WHEN nr_employed  <5000 THEN '< 5000'
WHEN nr_employed>=5000 and nr_employed< 5100 THEN '5000–5100'
WHEN nr_employed>=5100 and nr_employed< 5200 THEN '5100–5200'
ELSE '5200+'
END AS employment_band,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed='no' THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*),2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY employment_band
ORDER BY CASE employment_band
WHEN '< 5000' THEN 1
WHEN '5000–5100' THEN 2
WHEN '5100–5200' THEN 3
ELSE 4
END;

-- Consumer Confidence Index
SELECT CASE
WHEN cons_conf_idx < -45 THEN '< -45'
WHEN cons_conf_idx >= -45 AND cons_conf_idx < -40 THEN '-45 to -40'
WHEN cons_conf_idx >= -40 AND cons_conf_idx < -35 THEN '-40 to -35'
WHEN cons_conf_idx >= -35 AND cons_conf_idx < -30 THEN '-35 to -30'
ELSE '>= -30'
END AS confidence_band,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed='no' THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY confidence_band
ORDER BY CASE confidence_band
WHEN '< -45' THEN 1
WHEN '-45 to -40' THEN 2
WHEN '-40 to -35' THEN 3
WHEN '-35 to -30' THEN 4
ELSE 5
END;

-- Consumer Price Index
SELECT CASE
WHEN cons_price_idx < 93 THEN '< 93'
WHEN cons_price_idx >= 93 AND cons_price_idx < 94 THEN '93–94'
WHEN cons_price_idx >= 94 AND cons_price_idx < 95 THEN '94–95'
ELSE '>= 95'
END AS price_index_band,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed='no' THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY price_index_band
ORDER BY CASE price_index_band
WHEN '< 93' THEN 1
WHEN '93–94' THEN 2
WHEN '94–95' THEN 3
ELSE 4
END;


WITH profile AS ( SELECT previously_contacted,campaign_contact_group,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2) 
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY previously_contacted, campaign_contact_group
)
SELECT previously_contacted,
campaign_contact_group,
total_contacts,
successful_subscriptions,
conversion_rate
FROM profile
ORDER BY previously_contacted, conversion_rate DESC;

-- Age × Previous Contact
WITH profile AS ( SELECT age_group,
previously_contacted,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) *100.0 /COUNT(*),2)
 AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY age_group, previously_contacted
)
SELECT age_group,previously_contacted,total_contacts,
successful_subscriptions,conversion_rate
FROM profile
ORDER BY previously_contacted, conversion_rate DESC;

-- Education × Previous Contact
WITH profile AS ( SELECT education,previously_contacted,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY education, previously_contacted
)
SELECT education,previously_contacted,total_contacts,
successful_subscriptions,
conversion_rate
FROM profile
ORDER BY previously_contacted, conversion_rate DESC;

-- High-Opportunity Profiles
WITH profile AS (SELECT age_group,previously_contacted,campaign_contact_group,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*),2)
 AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY age_group, previously_contacted, campaign_contact_group
)
SELECT age_group,previously_contacted,campaign_contact_group,
total_contacts,successful_subscriptions,
conversion_rate
FROM profile
WHERE total_contacts >= 100
ORDER BY conversion_rate DESC;

-- Age × Previous Contact Conversion Ranking analysis
WITH profile AS (SELECT age_group,previously_contacted,
COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
ROUND(SUM(CASE WHEN subscribed='yes' THEN 1 ELSE 0 END) *100.0/COUNT(*),2)
AS conversion_rate
FROM bank_marketing_cleaned
GROUP BY age_group, previously_contacted
)
SELECT age_group,previously_contacted,
total_contacts,successful_subscriptions,
conversion_rate,
RANK() OVER (
PARTITION BY previously_contacted
ORDER BY conversion_rate DESC
) AS conversion_rank
FROM profile
WHERE total_contacts>=100
ORDER BY previously_contacted, conversion_rank;

-- Executive Summary Query
SELECT COUNT(*) AS total_contacts,
SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
SUM(CASE WHEN subscribed = 'no' THEN 1 ELSE 0 END) AS unsuccessful_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' THEN 1 ELSE 0 END) *100.0 /COUNT(*),2)
AS overall_conversion_rate,
    
SUM(CASE WHEN previously_contacted = 'Yes' THEN 1 ELSE 0 END) AS previously_contacted_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' AND previously_contacted = 'Yes'
THEN 1 ELSE 0 END)*100.0/
NULLIF(SUM(CASE WHEN previously_contacted ='Yes' THEN 1 ELSE 0 END),0),2) 
AS previously_contacted_conversion_rate,
    
SUM(CASE WHEN previously_contacted ='No' THEN 1 ELSE 0 END)
AS first_time_contacts,
ROUND(SUM(CASE WHEN subscribed ='yes' AND previously_contacted ='No' 
THEN 1 ELSE 0 END) *100.0/
NULLIF(SUM(CASE WHEN previously_contacted = 'No' THEN 1 ELSE 0 END),0),2)
AS first_time_conversion_rate
FROM bank_marketing_cleaned;

