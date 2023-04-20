
*Previous 5-month average
clear all
input str20 company year total_asset bm 
A 2008 1200 1.3 
A 2009 1300 1.8 
A 2010 1000 1.2
A 2011 1200 1.5 
A 2012 1300 1.4
A 2012 1305 1.5 
A 2013 1306 1.3 
A 2014 1205 1.1 
B 2008 3800 0.3
B 2009 3600 0.9
B 2010 3000 0.8
B 2011 3200 0.9 
B 2012 3300 1.2 
B 2013 3200 1.1 
B 2014 3100 1.3 
C 2008 3880 0.2
C 2009 3660 0.3
C 2010 600 1.6 
C 2011 900 1.8 
C 2012 800 1.3
C 2013 900 1.3
C 2014 200 1.3

end 


/*take lags*/
sort company year
by company: gen bm_lag1=bm[_n-1] /*This is correct to take lags in panel data*/
by company: gen bm_lag2=bm[_n-2] /*This is correct to take lags in panel data*/
by company: gen bm_lag3=bm[_n-3] /*This is correct to take lags in panel data*/
by company: gen bm_lag4=bm[_n-4] /*This is correct to take lags in panel data*/
by company: gen bm_lag5=bm[_n-5] /*This is correct to take lags in panel data*/

gen bm_avg=(bm_lag1+bm_lag2+bm_lag3+bm_lag4+bm_lag5)/5
