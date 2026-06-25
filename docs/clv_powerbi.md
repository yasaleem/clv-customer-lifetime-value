## Power BI Dashboard

### Live Dashboard
[View Interactive CLV Analytics Dashboard](YOUR_POWER_BI_LINK_HERE)

### Dashboard Overview
Built an interactive 4-page CLV Analytics dashboard connected 
directly to SQL Server — enabling real-time filtering across 
CLV tiers, customer segments, and campaign budget allocation.

### Pages

**Page 1 — CLV Overview**
High level KPIs — total customers scored, total predicted revenue 
(£23.48M), avg CLV per customer, Platinum customer count. CLV tier 
distribution donut showing Platinum generates 68% of predicted revenue 
despite being only 27% of customers. Revenue and customer count bar 
charts by tier. Filterable by CLV tier.

**Page 2 — CLV Segment Analysis**
Seven segment breakdown with KPI cards highlighting VIP Active (439), 
VIP At Risk (551), and Growth At Risk (1,121). Treemap sized by customer 
count, avg projected CLV by segment bar chart, avg recency days with 
180-day high churn risk threshold line. Cross-filterable by segment 
and CLV tier.

**Page 3 — Predictive CLV Model Validation**
Model performance KPIs — MAE of 2.63 orders, avg P(alive) of 0.46, 
3,801 customers predicted to buy. Scatter plot of predicted vs actual 
2011 orders, P(alive) by tier with 0.5 churn uncertainty threshold, 
predicted vs actual comparison by tier showing Gold and Bronze 
near-perfect accuracy.

**Page 4 — Campaign ROI Budget Allocation**
Total campaign budget £3.52M with £2.07M allocated to High priority 
segments. Justifiable budget by segment bar chart, max spend per 
customer chart, priority matrix table with conditional color coding 
— High (red), Medium (orange), Low (teal). Filterable by priority tier.

### Key DAX Measures
- Total Predicted Revenue — SUM of Projected_CLV_12M
- Avg Probability Alive — AVERAGE of Probability_Alive
- Model MAE — AVERAGEX of ABS(Predicted - Actual)
- High Priority Budget — CALCULATE with Priority filter
- Prediction Accuracy — DIVIDE of correctly predicted buyers
- Total Revenue At Risk — High priority segment CLV sum

### Screenshots

**Page 1 — CLV Overview**
![CLV Overview](charts/powerbi_clv_overview.png)

**Page 2 — CLV Segment Analysis**
![CLV Segments](charts/powerbi_clv_segments.png)

**Page 3 — Predictive CLV Model Validation**
![Model Validation](charts/powerbi_clv_validation.png)

**Page 4 — Campaign ROI Budget Allocation**
![Campaign ROI](charts/powerbi_clv_campaign_roi.png)

### Technical Details
- **Data source:** SQL Server — CLV analytics layer
- **Tables connected:** clv.historical_clv, clv.projected_clv, 
  clv.rfm_scores, clv.clv_segments, clv.campaign_roi, 
  clv.predictive_clv
- **Refresh:** Connected to live SQL Server database
- **DAX measures:** 14 custom measures
- **Interactivity:** Cross-filtering, tile slicers, 
  conditional formatting, reference lines
- **Model validation:** Predicted vs actual 2011 holdout data
