# Dataset

This project uses the **Bank Marketing Dataset** from the UCI Machine Learning Repository.

Dataset Source:
https://archive.ics.uci.edu/dataset/222/bank%2Bmarketing

The original dataset contains information about bank marketing campaigns and customer responses to term-deposit offers.

## Dataset Used

- Dataset: Bank Marketing
- Records after cleaning: 41,176
- Target variable: `subscribed`
- Positive subscriptions: 4,639
- Overall conversion rate: 11.27%

## Data Preparation

The dataset was cleaned and prepared using Excel and Power Query.

Main preparation steps included:

- Removed exact duplicate records
- Validated numeric and categorical fields
- Retained `unknown` categorical values
- Created customer age groups
- Created campaign contact frequency groups
- Created previous-contact recency groups
- Created loan-status classification
- Standardized column names

The cleaned dataset was then analyzed using MySQL, SQL, Python, Statistics, and Power BI.

> The raw dataset is not included in this repository. Please use the official UCI source above to access the original data.
