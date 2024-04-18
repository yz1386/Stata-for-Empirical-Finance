************************************************************************************************
*Note : Examples for merging datasets  monthly data+ yearly data; monthly data+ monthly data
************************************************************************************************
************************************************************************************************
*@author: Dr. You Zhou, Leeds University Business School
************************************************************************************************

*see the merge function manual first
help merge

******************************
*1. monthly data + yearly data 
*******************************
*Prepare  datasets first
*str20 tells Stata it is a string variable and that it could be up to 20 characters wide.

*Dataset 1 Firm-Year-Month Data Panel
clear all
input str20 company year month total_asset bm 
A 2010 1 1000 1.2
A 2010 2 1200 1.3
A 2010 3 1300 1.5
A 2011 1 1200 1.6 
A 2011 2 1600 1.4 
A 2011 3 1600 1.7 
A 2012 1 1200 1.8 
A 2012 2 1100 1.6 
A 2012 3 1600 1.3 
B 2010 1 3000 0.8
B 2010 2 3100 0.5
B 2010 3 3300 0.6
B 2011 1 3600 0.9 
B 2011 2 3200 0.5 
B 2011 3 3300 0.7 
B 2012 1 3200 1.2 
B 2012 2 3100 1.5 
B 2012 3 3600 1.8 
C 2010 1 600 1.6 
C 2010 2 400 1.6 
C 2010 3 700 1.7 
C 2011 1 800 1.8 
C 2011 2 900 1.9 
C 2011 3 500 1.5 
C 2012 1 800 1.2
C 2012 2 900 1.6
C 2012 3 800 1.8
end  
save data1.dta,replace

*Dataset 2 Year Time series Data 
clear all
input year index1 index2 index3
2009 30 56 65
2010 26 67 35
2011 38 61 23
2012 39 58 13
2013 23 58 66
end
save data2.dta,replace

*Dataset 3 Firm-Year Data Panel
clear all
input str20 company year liability ratings 
A 2009 800 3.2
A 2011 1100 2.5 
A 2012 1200 6.4
B 2009 1900 2.6 
B 2010 2000 2.8
B 2011 2200 4.9 
B 2012 2300 6.2
C 2009 400 1.6  
C 2010 300 1.8 
C 2011 500 2.8 
C 2012 600 2.3
end  
save data3.dta,replace

*Dataset 4 Firm-Year Data Panel
clear all
input str20 company year equity roa
A 2011 1200 1.2
A 2012 1300 1.5 
A 2013 1500 1.6 
B 2011 3100 0.8 
B 2013 3200 1.3 
C 2009 800 1.6 
C 2012 800 1.6
end  
save data4.dta,replace

/*merging process */

*Dataset 1+ Dataset 2
clear all
use data1.dta,replace
merge m:1 year using data2

sort company year

*if we keep the matched observations
keep if _merge == 3
drop _merge

*Dataset 1+ Dataset 2+Dataset 3
merge m:1 company year using data3

/* Here we don't have duplicates in both master file and the using file. Both master file and the using file are clean and are uniquely identified by company and year.

Always check the merged file after you complete the merging prcoess!!!

 */

*make it easier to read the data panel
sort company year

*if the variables from dataset 1 are more important to keep
*if we keep the observation from master file and the matched observations
keep if _merge == 1 | _merge == 3
drop _merge

*Dataset 1+ Dataset 2+Dataset 3+ Dataset 4
merge m:1 company year using data4

sort company year

*if we keep the observation from master file and the matched observations
keep if _merge == 1 | _merge == 3
drop _merge

save data_month_to_year.dta,replace


************************************************
*2.  monthly data+monthly data
************************************************

*Dataset 1 Firm-Year-Month Data Panel
clear all
input str20 company year month total_asset bm 
A 2010 1 1000 1.2
A 2010 2 1200 1.3
A 2010 3 1300 1.5
A 2011 1 1200 1.6 
A 2011 2 1600 1.4 
A 2011 3 1600 1.7 
A 2012 1 1200 1.8 
A 2012 2 1100 1.6 
A 2012 3 1600 1.3 
B 2010 1 3000 0.8
B 2010 2 3100 0.5
B 2010 3 3300 0.6
B 2011 1 3600 0.9 
B 2011 2 3200 0.5 
B 2011 3 3300 0.7 
B 2012 1 3200 1.2 
B 2012 2 3100 1.5 
B 2012 3 3600 1.8 
C 2010 1 600 1.6 
C 2010 2 400 1.6 
C 2010 3 700 1.7 
C 2011 1 800 1.8 
C 2011 2 900 1.9 
C 2011 3 500 1.5 
C 2012 1 800 1.2
C 2012 2 900 1.6
C 2012 3 800 1.8
end  
save data1.dta,replace

*Dataset 5 Firm-Year-month Data Panel
clear all
input str20 company year month cash leverage
A 2010 1 1500 1.2
A 2010 2 1700 1.3
A 2010 3 1900 1.5 
A 2011 2 1900 2.4 
A 2011 3 1500 2.7 
A 2012 2 1400 2.6 
A 2012 3 1600 2.3 
B 2010 1 3600 0.8
B 2010 2 3100 0.5
B 2010 3 3800 0.6
B 2011 1 3600 1.9 
B 2011 2 3300 0.5 
B 2011 3 3300 1.7 
B 2012 2 3100 2.5 
B 2012 3 3800 2.8 
C 2010 1 660 1.6 
C 2010 2 400 1.6 
C 2010 3 790 1.7 
C 2011 1 860 3.8 
C 2011 3 560 3.5 
C 2012 1 870 2.2
C 2012 2 900 3.6
C 2012 3 860 3.8
end  
save data5.dta,replace

*Dataset 6 Firm-Year-month Data Panel
clear all
input str20 company year month earnings eps
A 2010 1 1500 3.2
A 2010 2 2700 3.3
A 2010 3 3900 3.5
A 2011 1 4300 4.6 
A 2011 2 3900 4.4 
A 2012 2 3400 4.6 
A 2012 3 4600 5.3 
B 2010 1 6600 6.8
B 2010 2 6100 6.5
B 2010 3 6800 6.6
B 2011 1 7600 7.9 
B 2011 2 7300 8.6 
B 2011 3 7300 8.7 
B 2012 1 8300 8.2 
B 2012 2 8100 9.5  
C 2010 3 2790 2.7 
C 2011 1 3860 3.8 
C 2011 2 3900 3.9 
C 2011 3 3560 4.6 
C 2012 1 3870 4.2
C 2012 2 3900 5.6
C 2012 3 3860 5.8
end  
save data6.dta,replace

/*merging process */

*********************************************************************************
*2.1  variables in dataset 1 are important to keep (keep if _merge == 1 | _merge == 3)
**********************************************************************************
*Dataset 1+ Dataset 5+ Dataset 6
clear all
use data1.dta,replace
merge 1:1 company year month using data5

/* Here we try to keep the observations from master file data1 and the matached since they are main variables of interests*/
*if we keep the observation from master file and the matched observations
keep if _merge == 1 | _merge == 3
drop _merge

merge 1:1 company year month using data6
*if we keep the observation from master file and the matched observations
keep if _merge == 1 | _merge == 3
drop _merge

save data_month_to_month1.dta,replace

*****************************************************************************
*2.2  variables from all datasets are important to keep (keep if _merge == 3)
*****************************************************************************

*Dataset 1+ Dataset 5+ Dataset 6
clear all
use data1.dta,replace
merge 1:1 company year month using data5

/* Here we try to keep the MATACHED observations only if all variables are important*/
*if we keep the observation from master file and the matched observations
keep if _merge == 3
drop _merge

merge 1:1 company year month using data6
*if we keep the observation from master file and the matched observations
keep if _merge == 3
drop _merge

save data_month_to_month_matached_only.dta,replace


