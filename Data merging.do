
************************************************
*Datasets merging examples @author: Dr. You Zhou, Leeds University Business School
************************************************

*Please speficy your Working Folder first!!!
cd M:\stata

*Prepare 4 datasets first
*str20 tells Stata it is a string variable and that it could be up to 20 characters wide.

*Dataset 1 Firm-Year Data Panel
clear all
input str20 company year total_asset bm 
A 2010 1000 1.2
A 2011 1200 1.5 
A 2012 1300 1.4 
B 2010 3000 0.8
B 2011 3200 0.9 
B 2012 3300 1.2 
C 2010 600 1.6 
C 2011 900 1.8 
C 2012 800 1.3
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
B 2010 2000 2.8
B 2011 2200 4.9 
B 2012 2300 6.2 
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
B 2012 3600 0.6 
B 2013 3200 1.3 
C 2009 800 1.6 
C 2011 900 1.3 
C 2012 800 1.6
end  
save data4.dta,replace

/*merging process */

*Dataset 1+ Dataset 2
clear all
use data1.dta,replace
merge m:1 year using data2

*keep the matched observations
keep if _merge == 3
drop _merge

*Dataset 1+ Dataset 2+Dataset 3
merge 1:1 company year using data3

*keep the matched observations
keep if _merge == 3
drop _merge

*Dataset 1+ Dataset 2+Dataset 3+ Dataset 4
merge 1:1 company year using data4

*keep the matched observations
keep if _merge == 3
drop _merge
