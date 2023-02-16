
**************************************************************************************
* Monthly data mergeing example @author: Dr. You Zhou, Leeds University Business School
**************************************************************************************

*1 prepare the dataset 1
clear all
input str20 company str20 DATE1	VAR1 
A 20210630	3
B 20210630	2
C 20210630	1
A 20210731	6
B 20210731	8
C 20210731	9
end  
gen year=real(substr(DATE1,1,4))
gen month=real(substr(DATE1,5,2))
save data1.dta,replace

*2 prepare the dataset 2
clear all
input str20 company str20 DATE2	VAR2 
A 30062021	8
B 30062021	9
C 30062021	10
A 31072021	3
B 31072021	6
C 31072021	8
end  

gen year=real(substr(DATE,5,4))
gen month=real(substr(DATE,3,2))
save data2.dta,replace

*3 merge them and generate new date
use data1.dta,clear
merge 1:1 company year month using data2
gen date=ym(year,month)
format date %tm

keep company date year month DATE1 DATE2 VAR1 VAR2 
