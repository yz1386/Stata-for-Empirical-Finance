
********************************************************************************
* Data Export from Stata @author: Dr. You Zhou, Leeds University Business School
********************************************************************************

*set your working directory
cd "M:\"

*prepare the dataset
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

