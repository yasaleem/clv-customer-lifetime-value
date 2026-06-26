### Project Overview
This project builds a complete Customer Lifetime Value pipeline for BritGifts Online — a UK based e-commerce retailer selling gifts and homeware. It extends the RFM segmentation work from Project One by adding forward-looking value prediction — answering not just who customers are today, but how much they are likely to spend in the future.

The project covers three CLV approaches of increasing sophistication:

| Approach | Method | Output |
|----------|--------|--------|
| Historical CLV | Total revenue per customer in observation period | Actual spend baseline |
| Projected CLV | Formula based — AOV × frequency × lifespan | 12 month revenue projection |
| Predictive CLV | Probability weighted purchase rate model | Validated future value prediction |

The predictive model is validated against actual 2011 purchase data — turning a theoretical exercise into a real-world validated model.

**Observation Period:** December 2009 — December 2010  
**Prediction Period:** January 2011 — December 2011  
**Reference Date:** December 31, 2010

An Interactive Power BI dashboard can be found [here](docs/clv_powerbi.md).

### Business Questions
1 - What is each customer's predicted lifetime value for the next 12 months?\
2 - Which customers are worth the most investment to retain?\
3 - How does CLV vary across behavioral segments?\
4 - What is the ROI threshold for win-back campaigns per segment?

### Data Structure & Initial Checks
BritGifts Online database structure as seen below consists of three tables: Customer, order, order_item with a total row count of 1,067,371 records.

<img width="3209" height="2251" alt="erd_clv_pipeline" src="https://github.com/user-attachments/assets/fd4f1774-8c52-46b2-9744-6ca44674cf8a" />


### Key Findings

#### Finding 1 - VIP At Risk — £6.7M projected revenue at risk

> 551 high value customers gone silent for 379 days

---

#### Finding 2 - Growth At Risk is the highest volume opportunity

> 1,121 customers, £3.4M CLV, £517K justifiable campaign budget

---

#### Finding 3 - Revenue is highly concentrated

> top 20% of customers generate majority of total predicted revenue

---

#### Finding 4 - Platinum vs VIP At Risk — same value, opposite engagement

>  17 days avg recency vs 379 days — same CLV tier, completely different urgency

---

### Finding 5 - Low Value segment is misleadingly named

> £4,657 avg CLV despite Bronze tier — likely high-spend infrequent buyers worth investigating

---

### Business Recommendations



### License
This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.


