
*example-find deal type
clear all
input deal_no str20 deal_type  value 
1 friendly 1000 
2 friendly 1200  
3 friendly 1300
4 hostile 3000 
5 hostile 3200  
6 hostile 3300 
7 NA 600 
8 NA 900  
end 

gen id=1  /*friendly*/
replace id=2 if deal_type == "hostile"
replace id=3 if deal_type == "NA"

list 