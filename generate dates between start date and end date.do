

*1. prepare start and end date as a panel
clear
input company  director  str10 start  str10 end
      1   1      "01-06-2022"  "06-30-2022"
      1   2      "03-18-2008"  "08-30-2008"
end

*2. give start and end date correct format
gen start2 = date(start, "MDY")
gen end2 = date(end, "MDY")

format start2 %td
format end2 %td


*3. generate date series for each director in each company between start date and end date

sum start2
local min = r(min)
sum end2
local range = r(max) - `min' + 1
expand `range'

bys company  director : gen date = `min' + _n - 1
format date %td
keep if date >= start2 & date <= end2



