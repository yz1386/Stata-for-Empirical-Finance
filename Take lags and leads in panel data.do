
***********************************************************************************
*Take lags and leads in panel data @author: Dr You Zhou, Leeds University Business School
***********************************************************************************
*******************************************
*Example 1: take leads and lags for panel data
*******************************************

*1. prepare the dataset
clear all
input str20 company	year	total_asset	bm	liability	ratings	roa
A	2011	1200	1.5	1100	2.5	.04
A	2012	1300	1.4	1200	6.4	.02
B	2010	3000	.8	2000	2.8	-.01
B	2011	3200	.9	2200	4.9	-.003
B	2012	3300	1.2	2300	6.2	-.005
C	2010	600	1.6	300	1.8	.08
C	2011	900	1.8	500	2.8	.06
C	2012	800	1.3	600	2.3	.065
D	2011	1200	1.2	3200	.3	-.08
D	2012	1300	1.5	2800	.6	-.003
D	2013	1500	1.6	3000	.5	.01
E	2016	3100	.8	1200	1.6	.02
E	2017	3600	.6	1500	1.8	.03
E	2018	3200	1.3	1800	1.6	.01
F	2009	800	1.6	5000	3	.02
F	2011	900	1.3	6000	2.8	.03
F	2012	800	1.6	6600	2.6	.06
F	2013	860	1.8	6800	3	.03
end

*please  sort your data properly before take leads or lags.

*2. take lags
sort company year 
by company: gen total_asset_lag1 = total_asset[_n-1]
by company: gen bm_lag1 = bm[_n-1]
by company: gen ratings_lag1 = ratings[_n-1]
by company: gen liability_lag1 = liability[_n-1]

*3. take leads 
by company: gen total_asset_lead1 = total_asset[_n+1]
by company: gen bm_lead1 = bm[_n+1]
by company: gen ratings_lead1 = ratings[_n+1]
by company: gen liability_lead1 = liability[_n+1]

*Always check your datasets after taking leads or lags.

****************************
*Example 2: take lags and leads
****************************

*1. prepare the dataset
clear all
input str20 company year total_asset bm 
A 2010 1000 1.2
A 2011 1200 1.5 
A 2012 1300 1.4
A 2012 1305 1.5 
B 2010 3000 0.8
B 2011 3200 0.9 
B 2012 3300 1.2 
C 2010 600 1.6 
C 2011 900 1.8 
C 2012 800 1.3
end 

gen bm_lag1_wrong=bm[_n-1] /*Don't do this. This is wrong to take lags because we have the panel data, not time series data.*/

*2. take lags
sort company year
by company: gen bm_lag1_correct=bm[_n-1] /*This is correct to take lags in panel data*/

*3. take leads 
sort company year
by company: gen bm_lead1_correct=bm[_n+1] /*This is correct to take leads in panel data*/

*Always check your datasets after taking leads or lags.

