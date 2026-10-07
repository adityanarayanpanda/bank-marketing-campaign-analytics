# 📊 Bank Marketing Campaign Analytics

[![Dataset](https://img.shields.io/badge/Dataset-UCI%20Machine%20Learning%20Repository-blue.svg)](https://archive.ics.uci.edu/dataset/222/bank%2Bmarketing)
[![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB.svg?logo=python&logoColor=white)](https://www.python.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1.svg?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2C811.svg?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Excel](https://img.shields.io/badge/Excel-Power%20Query-217346.svg?logo=microsoftexcel&logoColor=white)](https://www.microsoft.com/excel)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **End-to-End Data Analytics Project** analyzing bank marketing campaign performance and term-deposit subscription behavior across **41,176 records**. Combining **Excel, Power Query, MySQL, Python, Statistics, and Power BI** to transform raw interactions into actionable business strategy and a **90-Day Action Plan**.

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Key Business Questions](#-key-business-questions)
- [Key Results & Metrics](#-key-results)
- [Dataset Architecture](#-dataset)
- [Project Workflow](#-project-workflow)
- [1. Data Cleaning & Preparation (Excel & Power Query)](#1-data-cleaning--preparation)
- [2. MySQL & SQL Analysis](#2-mysql--sql-analysis)
- [3. Python Exploratory Data Analysis & Statistics](#3-python-analysis)
- [4. Power BI Interactive Dashboard (4 Pages)](#4-power-bi-dashboard)
- [Key Business Insights](#-key-business-insights)
- [Critical Analytical Notice (Data Leakage)](#-important-analytical-consideration)
- [Strategic Business Recommendations](#-business-recommendations)
- [🗓️ 90-Day Action Plan](#️-90-day-action-plan)
- [Repository File Structure](#-repository-structure)
- [Tools & Technologies](#️-tools--technologies)
- [Skills Demonstrated](#-skills-demonstrated)
- [Author & Contact](#-author)

---

## 🎯 Project Overview

Bank marketing campaigns generate massive volumes of customer contact and campaign interaction data. Understanding which customer segments are more likely to subscribe, which communication channels perform better, and how repeated contacts impact conversion can drastically improve marketing ROI, reduce customer fatigue, and lower operational overhead.

This project analyzes the **Bank Marketing dataset** from the UCI Machine Learning Repository to derive data-driven answers to core commercial banking challenges.

### ❓ Key Business Questions

- **Overall Conversion:** What is the baseline campaign conversion rate?
- **Customer Segmentation:** Which demographics (age, job, marital, education, loans) convert at the highest rate?
- **Channel Optimization:** Does cellular contact outperform traditional landline telephone contact?
- **Contact Fatigue:** At what contact frequency does customer response diminish?
- **Historical Propensity:** Does a successful outcome in a prior campaign predict future subscription?
- **Campaign Timing:** Which months and weekdays generate the highest conversion density?
- **Macroeconomic Correlation:** How do interest rates (Euribor 3M) and employment trends influence financial commitment?
- **Actionable Execution:** What strategic interventions will maximize campaign conversion for the next 90 days?

---

## 📌 Key Results

| Metric | Analytical Result | Business Significance |
|---|---:|---|
| **Cleaned Campaign Records** | **41,176** | Verified, deduplicated analytical universe |
| **Successful Subscriptions** | **4,639** | Total term-deposit contracts secured |
| **Overall Conversion Rate** | **11.27%** | Portfolio baseline subscription rate |
| **Previous Campaign Contacts** | **7,124** | Customers with past historical outreach |
| **Average Call Duration** | **258 sec** (~4.3 min) | Descriptive indicator of customer engagement |
| **Total Campaign Contacts** | **105,735** | Cumulative sales contacts logged |
| **Cellular vs. Telephone Conversion** | **14.7% vs. 5.2%** | **~2.8x higher** conversion on mobile channels |
| **Prior Campaign Success Conversion** | **65.1%** | **~6x higher** conversion than overall baseline |
| **1-2 Contacts Conversion** | **12.5%** | Highest response window before diminishing returns |
| **Low Euribor (< 1.5%) Conversion** | **23.4%** | Favorable rate environment drives savings interest |

---

## 🗂️ Dataset

The project uses the **Bank Marketing Dataset** from the **UCI Machine Learning Repository**:
- **Source:** [UCI Machine Learning Repository - Bank Marketing](https://archive.ics.uci.edu/dataset/222/bank%2Bmarketing)
- **Institution:** Portuguese banking institution direct marketing campaigns (telemarketing)
- **Original Dimensions:** 41,188 records × 21 attributes (20 input features + 1 target variable)
- **Post-Cleaning Analytical Dataset:** **41,176 verified records** (12 duplicate records removed, zero synthetic padding)

### Target Variable

| Field | Values | Description |
|---|---|---|
| `subscribed` (`y`) | `yes` (4,639) / `no` (36,537) | Has the client subscribed to a term deposit? |

---

## 🔄 Project Workflow

```text
                 Raw Bank Marketing Dataset (UCI)
                            │
                            ▼
                  Excel / Power Query
                            │
                  Data Cleaning & Validation
               (Deduplication, NULL check, Dtypes)
                            │
                            ▼
                    Cleaned Dataset (41,176)
                            │
              ┌─────────────┴─────────────┐
              ▼                           ▼
          MySQL / SQL                  Python (Pandas / Seaborn)
              │                           │
       Business Analysis          EDA & Statistical Testing
       (Aggregations, CASE)        (Distributions, Leakage Check)
              │                           │
              └─────────────┬─────────────┘
                            ▼
                    Business Insights
                            │
                            ▼
                 Microsoft Power BI
               (4-Page Executive Dashboard)
                            │
                            ▼
            Strategic Recommendations & 90-Day Plan
```

---

## 🧹 1. Data Cleaning & Preparation

**Tools Used:** Microsoft Excel & Power Query

### Data Preparation Steps
1. **Deduplication:** Identified and purged 12 identical duplicate records (41,188 → 41,176).
2. **Data Type Standardization:** Enforced explicit schema types (`INT` for age, duration, campaign; `VARCHAR` for categoricals; `FLOAT` for macroeconomic indices).
3. **Categorical Handling:** Audited missing values; retained `unknown` as a legitimate business category to prevent survivorship bias.
4. **Feature Engineering:**
   - **Age Grouping:** Categorized into `Under 25`, `25–34`, `35–44`, `45–54`, `55–64`, `65+`.
   - **Campaign Contact Frequency:** Grouped outreach attempts into `1 Contact`, `2 Contacts`, `3–5 Contacts`, `6–10 Contacts`, `11+ Contacts`.
   - **Previous Contact Recency:** Binned `pdays` into `Not Previously Contacted` (999), `0–30 Days`, `31–90 Days`, `91–180 Days`, `181+ Days`.
   - **Consolidated Loan Status:** Combined `housing` and `loan` into `No Loan`, `Home Loan`, `Personal Loan`, `Both Loans`, and `Unknown`.

---

## 🗄️ 2. MySQL & SQL Analysis

**Tools Used:** MySQL 8.0, MySQL Workbench  
**Database:** `bank_marketing_analytics`  
**Table:** `bank_marketing_cleaned` (41,176 rows)

### Key Analytical Queries

#### 1. Baseline Conversion & Overall KPIs
```sql
SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS total_subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct,
    ROUND(AVG(duration), 1) AS avg_duration_sec,
    SUM(campaign) AS total_campaign_contacts
FROM bank_marketing_cleaned;
```

#### 2. Conversion by Contact Method
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

#### 3. Impact of Repeated Contacts (Contact Fatigue Analysis)
```sql
SELECT 
    CASE 
        WHEN campaign = 1 THEN '1 Contact'
        WHEN campaign = 2 THEN '2 Contacts'
        WHEN campaign BETWEEN 3 AND 5 THEN '3-5 Contacts'
        WHEN campaign BETWEEN 6 AND 10 THEN '6-10 Contacts'
        ELSE '11+ Contacts'
    END AS contact_frequency_tier,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM bank_marketing_cleaned
GROUP BY contact_frequency_tier
ORDER BY conversion_rate_pct DESC;
```

#### 4. Prior Campaign Outcome Influence
```sql
SELECT 
    poutcome AS previous_outcome,
    COUNT(*) AS customers,
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) AS subscriptions,
    ROUND(SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM bank_marketing_cleaned
GROUP BY poutcome
ORDER BY conversion_rate_pct DESC;
```

---

## 🐍 3. Python Analysis

**Libraries:** `pandas`, `numpy`, `matplotlib`, `seaborn`, `scipy.stats`

### Python Workflow
1. **Exploratory Data Analysis (EDA):** Evaluated distributions, skewness, and class imbalance (11.27% target class).
2. **Chi-Square Tests of Independence:** Confirmed statistically significant relationships between subscription and:
   - Contact communication channel (`p < 0.001`)
   - Previous campaign outcome (`p < 0.001`)
   - Job category and age tier (`p < 0.001`)
3. **Diminishing Returns Curve:** Plotted conversion probability against successive contact attempts, identifying that 84% of total conversions occur within the first 2 calls.

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load cleaned dataset
df = pd.read_csv("data/bank_marketing_cleaned.csv")

# Conversion rate by contact channel
channel_perf = df.groupby('contact')['subscribed'].apply(
    lambda x: (x == 'yes').mean() * 100
).reset_index(name='conversion_rate_pct')

print(channel_perf)
# Output:
#      contact  conversion_rate_pct
# 0   cellular            14.74%
# 1  telephone             5.23%
```

---

## 📊 4. Power BI Dashboard

**Tool:** Microsoft Power BI Desktop (4 Dedicated Interactive Pages)

### Page 1: Overview
- **KPI Ribbon:** Total Contacts (41,176), Subscriptions (4,639), Conversion Rate (11.27%), Avg Call Duration (258s), Total Outreach (105,735).
- **Monthly Conversion Dynamics:** Peak conversions in March (50.5%), December (48.9%), September (44.9%), October (43.9%). High volume but low conversion in May (6.4%).
- **Channel Performance:** Donut chart contrasting Cellular (14.7%) vs. Telephone (5.2%).
- **Prior Outcome Influence:** Bar chart highlighting `success` (65.1%) vs. `nonexistent` (8.8%).

### Page 2: Customer Analysis
- **Job Demographic Matrix:** Students (31.4%) and Retirees (25.2%) display highest propensity, while Blue-collar workers (6.9%) convert lowest.
- **Age Tier Distribution:** High bimodal distribution in Young (<25: 24.0%) and Senior (65+: 45.6%) segments.
- **Education & Marital Split:** University graduates dominate raw conversion volume; singles show higher relative subscription rates than married clients.

### Page 3: Campaign Performance
- **Repeated Contact Curve:** Steeper drop-off after 2 attempts (1 Contact: 13.0%, 2 Contacts: 11.5%, 3–5: 9.0%, 6–10: 5.8%, 11+: 2.4%).
- **Weekday Heatmap:** Balanced weekday distribution with subtle peaks on Thursdays (12.1%) and Tuesdays (11.8%).
- **Recency Impact:** Clients contacted within 0–30 days of prior outreach converted at 63.8%.

### Page 4: Economic Insights
- **Euribor 3-Month Benchmark:** In periods with Euribor < 1.5%, conversion surged to 23.4% compared to 5.1% during high-rate intervals (>4.5%).
- **Macro Volatility:** Strong negative correlation between employment variation rate (`emp.var.rate`) and term deposit acceptance.

---

## 💡 Key Business Insights

1. **Massive Power of Previous Success (65.1% vs 11.3%):** Customers who previously subscribed represent the single most profitable campaign segment (~6x overall baseline).
2. **Channel Efficiency Gap:** Cellular contacts convert at 14.7% versus 5.2% on fixed telephone lines (~2.8x efficiency).
3. **Severe Diminishing Returns on Repeated Calling:** 
   - 1–2 contacts generate **83.9% of all total conversions**.
   - Beyond 3 contacts, cost-per-acquisition escalates dramatically while conversion drops from 13.0% down to 2.4%.
4. **Niche High-Converting Age Groups:** Students (31.4%) and Retirees (65+ age: 45.6%) have lower loan obligations and higher interest in fixed deposit security.
5. **Macroeconomic Sensitivity:** Term deposit marketing thrives during lower Euribor and stabilizing economic conditions when liquidity seeks safe bank yields.

---

## 🚨 Important Analytical Consideration

### Call Duration & Pre-Contact Data Leakage
> ⚠️ **Critical Modeling Rule:** The `duration` variable represents the length of the telemarketing call in seconds. 
> 
> Because call duration is **only known AFTER the call takes place**, it cannot be utilized as a pre-call feature for targeting or lead scoring. Models trained on call duration will exhibit synthetic, artificially inflated accuracy that immediately breaks in production.
> 
> **Methodological Standard:** In this project, `duration` is strictly treated as a **descriptive post-campaign metric** to analyze agent engagement, never as a pre-contact predictive input.

---

## 📈 Strategic Business Recommendations

| # | Strategic Recommendation | Implementation Mechanism | Expected Impact |
|---|---|---|---|
| **1** | **Channel Reallocation to Cellular** | Phase out fixed landline outreach; prioritize verified mobile phone numbers. | **+25% to +35%** campaign ROI |
| **2** | **Strict Contact Frequency Cap (Max 3 Calls)** | Enforce CRM rule limiting telemarketing attempts to a hard ceiling of 3 calls per campaign. | **-35% call center costs**, zero customer fatigue |
| **3** | **VIP Re-Engagement for Past Buyers** | Automatically queue clients with `poutcome = 'success'` into dedicated priority queues. | **~65% conversion** on repeat cohorts |
| **4** | **Student & Retiree Tailored Products** | Formulate dedicated marketing collateral for young savers (<25) and retirement wealth preservers (65+). | **+15% conversion** in specialty segments |
| **5** | **Macro-Conditioned Campaign Timing** | Align marketing spend with quarterly macroeconomic rate environments and avoid low-efficiency months. | **Optimized budget allocation** |

---

## 🗓️ 90-Day Action Plan

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        90-DAY IMPLEMENTATION ROADMAP                   │
└────────────────────────────────────────────────────────────────────────┘

  Phase 1: Days 1–30         Phase 2: Days 31–60         Phase 3: Days 61–90
  TARGETING & CADENCE        TESTING & OPTIMIZATION      SCALING & GOVERNANCE
  ───────────────────        ──────────────────────      ────────────────────
  • Enforce 3-call cap in    • Launch A/B split on       • Roll out model to
    CRM / Dialer rules         Cellular vs Phone           entire regional base
  • Automate VIP queue       • Pilot Student/Retiree     • Establish automated
    for past successes         specialized campaigns       Power BI daily feeds
  • Audit & scrub landline   • Evaluate day/month        • Calibrate agent KPIs
    phone lists                timing adjustments          based on duration
```

### Phase Breakdown

- **Days 1–30 — Optimize Targeting & Hygiene:**
  - Audit existing lead databases; purge non-cellular numbers where possible.
  - Establish hard system limits in CRM to cease dialing after 3 unanswered attempts.
  - Build automated prioritization tag for past successful subscribers.
  - Baseline daily conversion KPIs across all telemarketing shifts.

- **Days 31–60 — Pilot & Segment Optimization:**
  - Launch targeted telemarketing pilot on high-propensity segments (Retirees 65+, Students).
  - Test modified script structures to optimize call duration sweet-spots (3–5 minutes).
  - Measure interim conversion rates against 11.27% baseline.

- **Days 61–90 — Scale & Automated Business Intelligence:**
  - Scale validated scripts and channel rules across full regional banking footprint.
  - Implement recurring Power BI data refreshes directly linked to data warehouse.
  - Establish monthly executive review on macroeconomic indicators (Euribor, CPI).

---

## 📁 Repository Structure

```text
bank-marketing-campaign-analytics/
│
├── data/
│   ├── README.md                          # Data dictionary & provenance
│   └── bank_marketing_cleaned.csv         # Cleaned analytical dataset (41,176 rows)
│
├── sql/
│   ├── README.md                          # Database architecture docs
│   └── bank_marketing_analysis.sql        # Full MySQL analytical queries & validation
│
├── python/
│   ├── README.md                          # Python environment & requirements
│   └── bank_marketing_analysis.ipynb      # EDA, Chi-Square statistical tests, charts
│
├── powerbi/
│   ├── README.md                          # DAX measures and page definitions
│   └── bank_marketing_campaign_dashboard.pbix # 4-Page interactive Power BI report
│
├── report/
│   ├── README.md                          # Executive brief & distribution notes
│   └── Bank_Marketing_Campaign_Analytics_Project_Report.docx # Complete business report
│
├── screenshots/
│   ├── README.md                          # Visual index
│   ├── dashboard_overview.png             # Power BI Page 1 Overview
│   ├── customer_analysis.png              # Power BI Page 2 Customer Analysis
│   ├── campaign_performance.png           # Power BI Page 3 Campaign Performance
│   └── economic_insights.png              # Power BI Page 4 Economic Insights
│
└── README.md                              # Main project documentation (this file)
```

---

## 🛠️ Tools & Technologies

| Category | Tools & Libraries | Purpose in Project |
|---|---|---|
| **Data Cleaning** | Microsoft Excel, Power Query | Initial ingestion, schema audit, deduplication, feature binning |
| **Database** | MySQL 8.0, MySQL Workbench | Relational storage, aggregations, conditional KPIs, business validation |
| **Programming** | Python 3.10+ | Statistical computation, distribution audits, EDA |
| **Data Libraries** | Pandas, NumPy, SciPy | Data manipulation, Chi-square hypothesis tests, aggregations |
| **Visualization** | Matplotlib, Seaborn | Exploratory plots, contact decay curves |
| **Business Intelligence** | Microsoft Power BI Desktop, DAX | 4-page interactive reporting suite, executive slicers |
| **Documentation** | GitHub Markdown, MS Word | Professional reporting, technical README, executive briefings |

---

## 📚 Skills Demonstrated

- **Data Wrangling:** Schema normalization, outlier evaluation, deduplication, handling non-standard values.
- **Relational SQL:** `CASE` expressions, conditional aggregates, subqueries, group rollups, query performance.
- **Statistical Analytics:** Class imbalance analysis, Chi-Square tests, correlation matrices, leakage mitigation.
- **Business Intelligence & DAX:** Star schema modeling, measure formulation, interactive drill-throughs.
- **Domain Business Acumen:** Banking term deposits, telemarketing contact fatigue, channel ROI optimization.
- **Executive Communication:** Structured 90-day action plans, translation of analytical stats into commercial revenue levers.

---

## 👤 Author

**Aditya Narayan Panda**  
🎓 *B.Tech — Computer Science & Engineering*  
🎯 *Aspiring Data Analyst*  

- **Core Competencies:** SQL | Python | Power BI | Excel | MySQL | Pandas | Statistics | Data Storytelling
- **Focus:** Transforming complex enterprise data into high-conviction commercial decisions.

---

## ⭐ Project Support

If you found this project insightful or applicable to your work, please consider **starring this repository**! Feedback and suggestions are always welcome.
