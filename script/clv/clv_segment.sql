
DROP TABLE IF EXISTS clv.clv_segments;
GO
SELECT 
	p.Customer_ID,
	p.CLV_Tier,
	CASE 
		WHEN p.CLV_Tier = 'Platinum' AND r.R_Score >= 4 AND r.F_Score > 4 THEN 'VIP Active'
		WHEN p.CLV_Tier = 'Platinum' AND r.R_Score <= 2					  THEN 'VIP At Risk'
		WHEN p.CLV_Tier = 'Gold' AND r.R_Score >= 4						  THEN 'Growth Active'
		WHEN p.CLV_Tier = 'Gold' AND r.R_Score <= 2						  THEN 'Growth At Risk'
		WHEN p.CLV_Tier = 'Silver' AND r.R_Score >= 3					  THEN 'Developing'
		WHEN p.CLV_Tier = 'Silver' AND r.R_Score <= 2					  THEN 'Developing At Risk'
		ELSE 'Bronze'
	END AS SegmentName
INTO clv.clv_segments
FROM clv.projected_clv p
JOIN clv.rfm_scores r ON p.Customer_ID = r.Customer_ID
