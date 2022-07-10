***********************************************************************************
*Generate dummy vartiables in Stata @author: Dr. You Zhou, Leeds University Business School
***********************************************************************************

***********************************************************************************
*1. Generate times series dummy variables : d1_time (bewteen dates) d2_time (larger than dates)
***********************************************************************************
clear all
set more off

*generate the start date and end date
local start = date("2021/01/01", "YMD")
local end = date("2021/12/31", "YMD")
local ob = `end' - `start' + 1

*generate a date seies bewteen start date and end date
set obs `ob'
egen date = seq(), from(`start') to(`end')
format %td date

gen d1_time = 1 if inrange(date, mdy(3,16,2021), mdy(6,30,2021))
replace d1_time = 0 if d1_time == .

gen d2_time = 1 if  date >= date("01nov2021","DMY") 
replace d2_time = 0 if d2_time == .

*save the dataset
save data_time_dummies.dta,replace


***********************************************************************************
*2. Generate firm level dummy variables : d1_firm (bewteen numbers) d2_time (larger than a number)
***********************************************************************************

*prepare dataset
clear all
input str20 company year total_asset bm liability ratings 
D 2011 1200 1.2 3200 0.3
D 2012 1300 1.5 2800 0.6
D 2013 1500 1.6 3000 0.5
E 2016 3100 0.8 1200 1.6
E 2017 3600 0.6 1500 1.8
E 2018 3200 1.3 1800 1.6
F 2009 800 1.6  5000 3
F 2011 900 1.3  6000 2.8
F 2012 800 1.6  6600 2.6
F 2013 860 1.8  6800 3
end  
save data1.dta,replace

*generate d1_firm (bewteen numbers) d2_time (larger than a number)
gen d1_firm =1 if bm >=1.2 &  bm <=1.8
replace d1_firm = 0 if d1_firm == .

gen d2_firm =1 if bm >=1.3
replace d2_firm = 0 if d2_firm == .

*save the dataset
save data_firm_dummies.dta,replace