*Prepare panel data: WIDE to Long     @author: Dr. You Zhou, Leeds University Business School

*If the output of dataset is a WIDE format, like this. Please download each variable ONE BY ONE! Then, transform it to LONG format and merge them together.


*1. BM-book to market ratio
*input you wide data, name your wanted variable in excel as name+year （eg. bm2001, bm2021, bm2022...)
clear all
input str20 company bm2001 bm2002 bm2003 
A 1.2 1.3 1.6
B 0.8 1.2 1.8
C 1.6 1.4 1.8
end  
save bm_wide.dta,replace

*transform and save
reshape long bm, i(company) j(year)  
save bm_long.dta,replace

*2. asset-Total asset 
*input you wide data
clear all
input str20 company asset2001 asset2002 asset2003 
A 1.2 1.3 1.6
B 0.8 1.2 1.8
C 1.6 1.4 1.8
end  
save asset_wide.dta,replace


*transform and save
reshape long asset, i(company) j(year)  
save asset_long.dta,replace


*3.merge them together

use bm_long.dta,clear
merge m:1 company year using asset_long
save your_panel_data.dta,replace


*Sometimes the data input of wide format is quite complicated, we should manually do it in excel to prepare a panel. Please also see my excel example.
