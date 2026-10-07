# 📊 Bank Marketing Campaign Analytics

[![Dataset](https://img.shields.io/badge/Dataset-UCI%20Machine%20Learning%20Repository-blue.svg)](https://archive.ics.uci.edu/dataset/222/bank%2Bmarketing)
[![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB.svg?logo=python&logoColor=white)](https://www.python.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1.svg?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2C811.svg?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Excel](https://img.shields.io/badge/Excel-Power%20Query-217346.svg?logo=microsoftexcel&logoColor=white)](https://www.microsoft.com/excel)

> **End-to-End Data Analytics Project** analyzing bank marketing campaign performance and term-deposit subscription behavior across **41,176 campaign records**. Combining **Excel, Power Query, MySQL, Python, Statistics, and Power BI** to transform raw campaign interaction data into actionable business insights, strategic recommendations, and an operational **90-Day Action Plan**.

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Key Business Questions](#-key-business-questions)
- [Key Results](#-key-results)
- [Dataset](#-dataset)
- [Project Workflow](#-project-workflow)
- [1. Data Cleaning & Preparation](#1-data-cleaning--preparation)
- [2. MySQL & SQL Analysis](#2-mysql--sql-analysis)
- [3. Python Analysis](#3-python-analysis)
- [4. Power BI Dashboard](#4-power-bi-dashboard)
- [Key Business Insights](#-key-business-insights)
- [Important Analytical Consideration](#-important-analytical-consideration)
- [Strategic Business Recommendations](#-strategic-business-recommendations)
- [🗓️ 90-Day Action Plan](#️-90-day-action-plan)
- [Repository Structure](#-repository-structure)
- [Tools & Technologies](#️-tools--technologies)
- [Skills Demonstrated](#-skills-demonstrated)
- [Author](#-author)

---

## 🎯 Project Overview

Bank marketing campaigns generate large amounts of customer and campaign interaction data. Understanding which customer segments are more likely to subscribe, which contact methods perform better, and how repeated contacts affect conversion can help improve campaign efficiency, reduce customer fatigue, and lower operational overhead.

This project analyzes the **Bank Marketing dataset** from the UCI Machine Learning Repository to evaluate telemarketing performance and identify patterns associated with term-deposit subscription.

### ❓ Key Business Questions

- **Overall Conversion:** What is the overall campaign conversion rate?
- **Customer Segmentation:** Which customer segments show higher subscription rates?
- **Contact Method:** Which contact method performs better?
- **Repeated Contacts:** How does repeated campaign contact affect conversion?
- **Previous Campaign History:** Does previous campaign success influence future subscriptions?
- **Campaign Timing:** Which days and months show stronger campaign performance?
- **Economic Indicators:** How do economic indicators relate to campaign conversion?
- **Actionable Execution:** What strategic actions can improve future campaign performance?

---

## 📌 Key Results

| Metric | Result | Analytical Significance |
|---|---:|---|
| **Cleaned Campaign Records** | **41,176** | Verified analytical dataset after duplicate removal |
| **Successful Subscriptions** | **4,639** | Term-deposit subscriptions recorded |
| **Overall Conversion Rate** | **11.27%** | Baseline campaign conversion rate |
| **Previous Campaign Contacts** | **7,124** | Campaign records with previous contact history |
| **Average Call Duration** | **258 sec** | Descriptive indicator of contact length (~4.3 min) |
| **Total Campaign Contacts** | **105,735** | Cumulative campaign contacts across records |
| **Cellular Conversion Rate** | **~14.7%** | Observed conversion via cellular channel |
| **Telephone Conversion Rate** | **~5.2%** | Observed conversion via fixed telephone channel |
| **Previous Campaign Success Conversion** | **~65.11%** | Highest observed subscription rate among outcome categories |

---

## 🗂️ Dataset

The project uses the **Bank Marketing Dataset** from the **UCI Machine Learning Repository**:
- **Dataset Source:** [UCI Machine Learning Repository - Bank Marketing](https://archive.ics.uci.edu/dataset/222/bank%2Bmarketing)
- **Original Dimensions:** 41,188 records × 21 variables (20 input features + 1 target variable)
- **Data Preparation:** 12 exact duplicate records identified and removed
- **Final Analytical Dataset:** **41,176 campaign records**

> *Note on Terminology:* The dataset does not contain a unique customer identifier. Records represent campaign contacts/interactions rather than confirmed unique individuals.

### Target Variable

| Field | Values | Description |
|---|---|---|
| `subscribed` (`y`) | `yes` (4,639) / `no` (36,537) | Has the client subscribed to a term deposit? |

> The raw dataset is not included in this repository. Please use the official UCI source to obtain the original dataset.

---

## 🔄 Project Workflow

```text
                 Raw Bank Marketing Dataset
                            │
                            ▼
                  Excel / Power Query
                            │
                  Data Cleaning & Validation
                            │
                            ▼
                    Clean Dataset (41,176)
                            │
              ┌─────────────┴─────────────┐
              ▼                           ▼
          MySQL / SQL                   Python
              │                           │
       Business Analysis          EDA & Statistics
              │                           │
              └─────────────┬─────────────┘
                            ▼
                    Business Insights
                            │
                            ▼
                 Microsoft Power BI
               (4-Page Interactive Dashboard)
                            │
                            ▼
            Recommendations & 90-Day Action Plan
```

---

## 🧹 1. Data Cleaning & Preparation

**Tools:** Microsoft Excel + Power Query

The raw dataset was prepared before analytical processing.

### Data Preparation Steps
1. **Deduplication:** Removed 12 exact duplicate records (41,188 → 41,176).
2. **Data Types:** Validated column data types across numeric and categorical features.
3. **Range & Category Validation:** Checked numerical boundaries and audited categorical values.
4. **Missing Values:** Retained meaningful `unknown` categorical entries to prevent loss of relevant information.
5. **Feature Engineering:**
   - **Age Group:** Grouped into `Under 25`, `25–34`, `35–44`, `45–54`, `55–64`, `65+`.
   - **Campaign Contact Group:** Grouped outreach frequency into `1 Contact`, `2 Contacts`, `3–5 Contacts`, `6–10 Contacts`, `11+ Contacts`.
   - **Previous Contact Recency:** Grouped previous campaign contact timing into `Not Previously Contacted`, `0–30 Days`, `31–90 Days`, `91–180 Days`, `181+ Days`.
   - **Loan Status:** Consolidated housing and personal loan details into `No Loan`, `Home Loan`, `Personal Loan`, `Both Loans`, and `Unknown`.
6. **Standardization:** Standardized column names and performed final data-quality validation.

---

## 🗄️ 2. MySQL & SQL Analysis

**Tools:** MySQL + MySQL Workbench  
**Database:** `bank_marketing_analytics`  
**Table:** `bank_marketing_cleaned`  
**Records:** 41,176  

### SQL Analysis Areas
- Dataset validation, record counts, and duplicate validation
- Subscription performance and conversion rate calculations
- Campaign contact frequency distribution
- Contact method performance comparison
- Previous campaign outcomes
- Customer characteristics (age groups, education, marital status, loan status)
- Campaign timing and economic indicators

### Key SQL Queries

#### Overall Campaign Conversion & Baseline Metrics
```sql
SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS successful_subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct,
    ROUND(AVG(duration), 1) AS avg_call_duration_sec,
    SUM(campaign) AS total_campaign_contacts
FROM bank_marketing_cleaned;
```

#### Conversion Rate by Contact Method
```sql
SELECT 
    contact AS contact_method,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM bank_marketing_cleaned
GROUP BY contact
ORDER BY conversion_rate_pct DESC;
```

#### Conversion Rate by Campaign Contact Frequency
```sql
SELECT 
    CASE 
        WHEN campaign = 1 THEN '1 Contact'
        WHEN campaign = 2 THEN '2 Contacts'
        WHEN campaign BETWEEN 3 AND 5 THEN '3-5 Contacts'
        WHEN campaign BETWEEN 6 AND 10 THEN '6-10 Contacts'
        ELSE '11+ Contacts'
    END AS contact_frequency_tier,
    COUNT(*) AS total_records,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM bank_marketing_cleaned
GROUP BY contact_frequency_tier
ORDER BY conversion_rate_pct DESC;
```

#### Conversion Rate by Previous Campaign Outcome
```sql
SELECT 
    poutcome AS previous_outcome,
    COUNT(*) AS total_records,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM bank_marketing_cleaned
GROUP BY poutcome
ORDER BY conversion_rate_pct DESC;
```

---

## 🐍 3. Python Analysis

**Tools:** Python + Pandas + NumPy + Matplotlib + Seaborn + SciPy

Python was used as a supporting analytical layer alongside SQL and Power BI for exploratory data analysis, data validation, distribution inspection, and statistical interpretation.

### Python Analysis Included
- Dataset inspection and validation
- Target variable distribution analysis (11.27% overall subscription rate)
- Customer segmentation analysis
- Contact method and previous campaign outcome comparison
- Monthly campaign trend analysis
- Statistical evaluation of campaign categorical variables

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load cleaned dataset
df = pd.read_csv("data/bank_marketing_cleaned.csv")

# Contact channel conversion rate
channel_summary = df.groupby('contact')['subscribed'].apply(
    lambda s: (s == 'yes').mean() * 100
).reset_index(name='conversion_rate_pct')

print(channel_summary)
```

---

## 📊 4. Power BI Dashboard

**Tool:** Microsoft Power BI Desktop

A professional 4-page interactive Power BI dashboard was developed to communicate the analytical findings through business-focused visualizations.

### 1️⃣ Overview
Provides a high-level view of campaign performance.
- **Key Metrics:** Total Contacts (41,176 records), Successful Subscriptions (4,639), Conversion Rate (11.27%), Previous Contacts (7,124), Average Call Duration (258 sec)
- **Key Visualizations:**
  - Conversion Rate by Month
  - Subscription Conversion Overview
  - Conversion Rate by Contact Type (Cellular ~14.7% vs. Telephone ~5.2%)
  - Conversion Rate by Age Group
  - Conversion Rate by Previous Campaign Outcome (Success ~65.11%)

### 2️⃣ Customer Analysis
Analyzes customer characteristics and their relationship with subscription behavior.
- **Key Areas:**
  - Job Profile
  - Age Groups
  - Education Level
  - Marital Status
  - Housing and Personal Loans
  - Campaign Contacts & Call Duration patterns

### 3️⃣ Campaign Performance
Evaluates campaign effectiveness and contact strategies.
- **Key Areas:**
  - Conversion Rate by Campaign Contacts:
    - 1 Contact: ~13%
    - 2 Contacts: ~11.5%
    - 3–5 Contacts: ~10%
    - 6–10 Contacts: ~6.5%
    - 11+ Contacts: ~3.2%
  - Conversion Rate by Day of Week
  - Conversion Rate by Contact Method
  - Conversion Rate by Previous Contacts and Recency
  - Conversion Rate by Credit Default Status

### 4️⃣ Economic Insights
Examines campaign performance in relation to economic indicators.
- **Key Indicators:**
  - Euribor 3-Month Rate
  - Employment Variation Rate
  - Consumer Confidence Index
  - Consumer Price Index
  - Monthly Conversion Trends

---

## 💡 Key Business Insights

1. **Overall Conversion:** The campaign achieved an overall subscription rate of **11.27%** (4,639 subscriptions from 41,176 campaign records).
2. **Previous Campaign Success:** Records with a successful previous campaign outcome showed the strongest observed conversion rate (**~65.11%**), indicating that past campaign history is an important targeting signal.
3. **Repeated Campaign Contacts:** Conversion generally declined as campaign contact frequency increased (~13% at 1 contact down to ~3.2% at 11+ contacts), suggesting that excessive repeated outreach reduces campaign efficiency.
4. **Contact Method:** Cellular contact performed substantially better (~14.7%) than fixed telephone contact (~5.2%) in the observed campaign data.
5. **Customer Segments:** Conversion varied across job categories, age groups, education levels, marital status, and loan status, highlighting distinct differences across demographic segments.
6. **Campaign Timing:** Conversion varied across months and days of the week, indicating opportunities for campaign scheduling optimization.
7. **Economic Conditions:** Conversion varied across Euribor 3-month rate bands, employment variation levels, and consumer confidence indicators, demonstrating the value of economic context when interpreting performance.

---

## 🚨 Important Analytical Consideration

### Call Duration & Pre-Contact Targeting (Data Leakage)
> ⚠️ **Critical Analytical Consideration:** The `duration` variable represents the length of the campaign contact in seconds.
> 
> Because call duration is known **only after the contact occurs**, it cannot be treated as a pre-contact targeting feature when designing predictive targeting models.
> 
> Using call duration for pre-contact targeting introduces **data leakage**, resulting in unrealistically optimistic model metrics that fail in operational deployment.
> 
> Therefore, this project primarily uses duration for **descriptive and post-contact operational analysis**, rather than treating it as a clean pre-contact targeting variable.

---

## 📈 Strategic Business Recommendations

| # | Recommendation | Implementation Focus | Expected Impact |
|---|---|---|---|
| **1** | **Prioritize High-Performing Channels** | Prioritize cellular outreach where operationally appropriate and validate channel allocation through controlled campaign testing. | Improved contact efficiency |
| **2** | **Manage Contact Frequency** | Establish operational guidelines to limit excessive repeated contact attempts where response declines. | Potential reduction in unnecessary repeated outreach |
| **3** | **Leverage Previous Campaign Outcomes** | Prioritize clients with a history of successful previous campaign interactions for relevant future campaigns. | Improved targeting of responsive cohorts |
| **4** | **Refine Customer Segmentation** | Utilize demographic variables such as age, job, and education to develop more focused campaign segments. | Improved audience relevance and segmentation |
| **5** | **Optimize Campaign Timing** | Analyze seasonal and weekday conversion patterns to refine campaign outreach scheduling. | Better operational scheduling |
| **6** | **Incorporate Economic Context** | Monitor economic indicators (e.g., Euribor rate, employment trends) when planning campaign timing and setting expectations. | Better contextual planning |

---

## 🗓️ 90-Day Action Plan

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        90-DAY IMPLEMENTATION PLAN                      │
└────────────────────────────────────────────────────────────────────────┘

  Days 1–30                  Days 31–60                  Days 61–90
  OPTIMIZE TARGETING         TEST & IMPROVE              SCALE
  ───────────────────        ──────────────────────      ────────────────────
  • Identify high-performing • Test different customer   • Scale successful
    customer segments          segments                    campaign strategies
  • Prioritize successful    • Compare contact           • Refine customer
    previous outcomes          strategies                  targeting
  • Review contact method    • Evaluate campaign         • Monitor conversion &
    performance                timing                      contact efficiency
  • Review repeated contacts • Monitor conversion        • Build recurring
  • Establish baseline KPIs    against baseline            Power BI reporting
```

### Phase Breakdown

- **Days 1–30 — Optimize Targeting:**
  - Identify high-performing customer segments from historical data.
  - Prioritize records with successful previous campaign outcomes.
  - Review contact-method performance across available communication channels.
  - Reduce unnecessary repeated contacts by setting contact frequency guidelines.
  - Establish baseline campaign KPIs.

- **Days 31–60 — Test & Improve:**
  - Test different customer segment strategies through pilot outreach.
  - Compare contact strategies across communication channels.
  - Evaluate campaign timing across high-performing days and months.
  - Monitor conversion changes and compare performance against baseline KPIs.

- **Days 61–90 — Scale:**
  - Scale successful campaign strategies across broader campaign operations.
  - Refine customer targeting rules based on pilot findings.
  - Monitor ongoing conversion and contact efficiency.
  - Build recurring Power BI reporting dashboards for stakeholder monitoring.
  - Establish an ongoing campaign-performance review process.

---

## 📁 Repository Structure

```text
bank-marketing-campaign-analytics/
│
├── data/
│   └── README.md
│
├── sql/
│   ├── README.md
│   └── bank_marketing_analysis.sql
│
├── python/
│   ├── README.md
│   └── bank_marketing_analysis.ipynb
│
├── powerbi/
│   ├── README.md
│   └── bank_marketing_campaign_dashboard.pbix
│
├── report/
│   ├── README.md
│   └── Bank_Marketing_Campaign_Analytics_Project_Report.docx
│
├── screenshots/
│   ├── README.md
│   ├── dashboard_overview.png
│   ├── customer_analysis.png
│   ├── campaign_performance.png
│   └── economic_insights.png
│
└── README.md
```

---

## 🛠️ Tools & Technologies

| Category | Tools | Project Application |
|---|---|---|
| **Data Cleaning** | Excel, Power Query | Ingestion, data type validation, deduplication, feature engineering |
| **Database** | MySQL | Relational data storage, structured business analysis |
| **Query Language** | SQL | Aggregations, conditional `CASE` logic, subqueries, validation queries |
| **Programming** | Python | Exploratory data analysis, statistical checks, distributions |
| **Data Analysis** | Pandas, NumPy | Data manipulation, grouping, statistical summaries |
| **Visualization** | Matplotlib, Seaborn, Power BI | Visual analytics, charts, exploratory plots |
| **Statistics** | Statistical Analysis | Validation of categorical relationships and distributions |
| **Dashboard** | Power BI, DAX | 4-page interactive dashboard, KPI development, slicers |
| **Documentation** | Microsoft Word, GitHub | Project report, repository README documentation |
| **Version Control** | GitHub | Project repository management and sharing |

---

## 📚 Skills Demonstrated

- **Data Cleaning & Validation:** Duplicate removal, schema validation, range checks, handling unknown categories.
- **SQL Analysis:** Aggregations, conditional grouping with `CASE`, percentage calculations, exploratory queries.
- **Exploratory Data Analysis (EDA):** Feature distribution analysis, data leakage identification, segment analysis.
- **Business Intelligence & Reporting:** Power BI multi-page dashboard development, DAX calculations, interactive slicers.
- **Business Insights & Communication:** Translating analytics into business takeaways, recommendations, and structured action plans.

---

## 👤 Author

**Aditya Narayan Panda**  
🎓 *B.Tech — Computer Science & Engineering*  
🎯 *Aspiring Data Analyst*  

- **Skills:** SQL | Python | Power BI | Excel | MySQL | Pandas | Statistics | Data Visualization

---

## ⭐ Feedback & Support

If you found this project helpful or insightful, feel free to explore the repository, review the analysis, and share feedback!
