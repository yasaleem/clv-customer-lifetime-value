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

#### Finding 1 - VIP At Risk — £6.7M projected revenue at risk - 551 high value customers gone silent for 379 days
<img width="2242" height="1185" alt="finding_1" src="https://github.com/user-attachments/assets/186808a1-e4bb-488a-af21-d0606fba9bca" />

---

#### Finding 2 - Growth At Risk is the highest volume opportunity - 1,121 customers, £3.4M CLV, £517K justifiable campaign budget
<img width="2056" height="1271" alt="finding2_growth_at_risk" src="https://github.com/user-attachments/assets/4277ab7c-21e0-4d35-bb3d-1d31657b9fab" />

---

#### Finding 3 - Revenue is highly concentrated - top 20% of customers generate majority of total predicted revenue
<img width="1836" height="1106" alt="finding3_revenue_concentration" src="https://github.com/user-attachments/assets/a447ea26-94a2-4da3-a281-6caababf9642" />

---

#### Finding 4 - Platinum vs VIP At Risk — same value, opposite engagement - 17 days avg recency vs 379 days — same CLV tier, completely different urgency
<img width="2113" height="1185" alt="finding4_platinum_comparison" src="https://github.com/user-attachments/assets/644badfb-322e-404d-92b2-2efd210a4fd4" />

---

#### Finding 5 - Low Value segment is misleadingly named - £4,657 avg CLV despite Bronze tier — likely high-spend infrequent buyers worth investigating
<img width="2197" height="1185" alt="finding5_low_value_anomaly" src="https://github.com/user-attachments/assets/4aa123b4-250b-4280-90ab-9109a460b25c" />

---

### Business Recommendations

### Recommendation 1 — VIP At Risk: Personal Win-Back Within 30 Days
> **Linked to Finding 1 — £6.7M projected revenue at risk**

551 customers worth £12,193 average CLV silent for 379 days.
Justifiable spend: £1,829 per customer. Personal outreach — not mass email.
Target 25% response rate = £1.7M recovered revenue.

---

### Recommendation 2 — Growth At Risk: Three-Wave Campaign
> **Linked to Finding 2 — highest volume opportunity**

1,121 customers. £517K campaign budget. Three waves over 6 weeks —
re-engagement, product recommendation, time-limited incentive.
Target 20% response = £690K recovered revenue.

---

### Recommendation 3 — Protect Before You Acquire
> **Linked to Finding 3 — revenue concentration**

Top 20% drive majority of revenue. Redirect 30% of acquisition
budget toward retention. Build early warning system for Platinum
and Gold customers going silent.

---

### Recommendation 4 — VIP Active and VIP At Risk Need Different Treatment
> **Linked to Finding 4 — same value, opposite engagement**

17 days vs 379 days recency — same CLV tier, completely different
urgency. VIP Active needs retention. VIP At Risk needs recovery.
Never treat them the same.

---

### Recommendation 5 — Investigate Low Value Before Writing Off
> **Linked to Finding 5 — £4,657 avg CLV despite Bronze tier**

Bronze customers show Gold-level CLV — likely seasonal high-spend
buyers misclassified by frequency. Investigate purchase timing
before applying low-budget strategy.



### License
This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.


