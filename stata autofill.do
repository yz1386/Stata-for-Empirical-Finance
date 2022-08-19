
*Autofill data      @author: Dr. You Zhou, Leeds University Business School

clear all
input str20 company year value1
A 2010 1.2
A 2011 .
A 2012 1.4
B 2010 0.8
B 2011 .
B 2012 1.2 
C 2010 1.6 
C 2011 .
C 2012 .
end 


encode company, gen(companyid)

tsset companyid year


tsfill, full

bysort companyid: carryforward value1, gen(value1_filled)

order company companyid