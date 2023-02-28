
********************************************************************************
* Data Export from Stata @author: Dr. You Zhou, Leeds University Business School
********************************************************************************

*set your working directory
cd "M:\"

*prepare the dataset
clear all
input str20 company year total_asset bm ret
A 2010 1000 1.2 0.01
A 2011 1200 1.5 0.016
A 2012 1300 1.4 0.03
B 2010 3000 0.8 0.016
B 2011 3200 0.9 0.013
B 2012 3300 1.2 0.018
C 2010 600 1.6 0.06
C 2011 900 1.8 0.03
C 2012 800 1.3 0.08
end 

*export to Stata data

save test.dta,replace

*1. To excel file

export excel using "test.xlsx", firstrow(variables) replace


*1.1 to different excel sheets

export excel using "test1.xlsx", sheet("Sheet1",replace) firstrow(variables)

export excel using "test1.xlsx", sheet("Sheet2",replace) firstrow(variables)

export excel using "test1.xlsx", sheet("Sheet3",replace) firstrow(variables)

*2. To csv file
export delimited using "test_csv.csv", replace

*3. Output to txt file
outfile using "test_txt.txt", replace


*4.data import

*excel
import excel "M:\test.xlsx", sheet("Sheet1") firstrow clear

*csv
import delimited "M:\test_csv.csv", clear 

*dta
use test.dta,clear

use "M:\test.dta",clear 



