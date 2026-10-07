# SQL Analysis

## Bank Marketing Campaign Analytics

This folder contains the MySQL and SQL analysis performed for the **Bank Marketing Campaign Analytics** project.

SQL was used to validate the cleaned dataset, calculate campaign KPIs, analyze subscription conversion, and identify important customer and campaign patterns.

## Database

**Database:** `bank_marketing_analytics`

**Main Table:** `bank_marketing_cleaned`

The cleaned dataset contains **41,176 records** after removing exact duplicate records and completing data validation and feature engineering.

## Data Validation

SQL was used to validate:

- Total record count
- NULL values
- Duplicate records
- Numeric fields
- Subscription values
- Campaign variables
- Customer and campaign attributes
- Data consistency

## Business Analysis

The SQL analysis covers the following areas:

### 1. Subscription Performance

- Total campaign contacts
- Successful subscriptions
- Unsuccessful contacts
- Overall conversion rate

### 2. Campaign Contact Frequency

Analyzed how subscription conversion changes as customers receive multiple campaign contacts.

### 3. Contact Method Analysis

Compared conversion performance between different contact methods, including:

- Cellular
- Telephone

### 4. Previous Campaign Outcome

Analyzed subscription conversion based on the outcome of previous campaigns.

### 5. Customer Analysis

Analyzed conversion across:

- Age groups
- Job categories
- Education
- Marital status
- Housing loan status
- Personal loan status

### 6. Campaign Timing

Analyzed conversion patterns across:

- Months
- Days of the week

### 7. Economic Indicators

Examined campaign conversion in relation to selected economic variables, including:

- Euribor 3-Month Rate
- Employment Variation Rate
- Consumer Confidence Index
- Consumer Price Index
- Employment Index

## Key SQL Findings

The analysis identified several important patterns:

- Overall subscription conversion was **11.27%**.
- There were **4,639 successful subscriptions** from 41,176 campaign records.
- Previous campaign success showed the strongest observed conversion.
- Conversion generally declined as campaign contact frequency increased.
- Cellular contact performed better than telephone contact.
- Conversion varied across customer segments and economic conditions.

## SQL Techniques Used

The project uses several practical SQL concepts, including:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- Aggregate Functions
- `CASE`
- Subqueries
- Conditional Aggregation
- Percentage Calculations
- Data Validation Queries

## SQL File

The complete SQL analysis is available in:

```text
bank_marketing_analysis.sql
