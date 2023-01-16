
***********************************************************************************
*Substr function to extract company id @author: Dr. You Zhou, Leeds University Business School
***********************************************************************************

*1.prepare datasets
clear all
input str20 firm_id1  str20 firm_id2 str20 firm_id3
abc123456 abc12345 abc123
end  
save data1.dta,replace

*2.generate new company ID using the substr() functoin 
use data1.dta,clear
gen firm_id1a=substr(firm_id1,1,8)
gen firm_id1b=substr(firm_id1,1,6)

*3. Check data
*Now check the varaiables: firm_id1a, firm_id1b, firm_id2,firm_id3
describe

list 

