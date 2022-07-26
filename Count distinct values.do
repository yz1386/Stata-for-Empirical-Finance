
*Count Unique number of observation      @author: Dr. You Zhou, Leeds University Business School


*Example 1
clear all
input str20 company year total_asset bm 
A 2010 1000 1.2
A 2011 1200 1.5 
A 2012 1300 1.4
B 2010 3000 0.8
B 2011 3200 0.9 
B 2012 3300 1.2 
C 2010 600 1.6 
C 2015 900 1.8 
C 2014 800 1.3
end  

*Once you have prepared a large panel dataset, we generally like to know how many years we have and how many companies we have
*Thanks to Michael Hills and Tony Brady's great works, we can use the unique packge. Please install the packe first.

*ssc install unique

*Count the number of company of your dataset
unique company

*unique company,detail

*if you want to store the results
return list
gen number_of_company =  r(unique) 

*Count the number of year of your dataset
unique year

*if you want to store the results
return list
gen number_of_year =  r(unique) 

*unique year,detail


*Example 2
clear all
input str20 city str20 company year total_asset bm 
Leeds A 2010 1000 1.2
Leeds A 2011 1200 1.5 
Leeds A 2012 1300 1.4
Leeds B 2010 3000 0.8
Leeds B 2011 3200 0.9 
Leeds B 2012 3300 1.2 
York C 2010 600 1.6 
York C 2015 900 1.8 
York C 2014 800 1.3
end  

*How many company do we have in each city?
unique company, by(city)

