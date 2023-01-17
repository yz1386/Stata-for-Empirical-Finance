
 * Convert string variable to numeric variable @author: Dr. You Zhou, Leeds University Business School
*Prepare example data 
clear all
input  str20 company_id1 str20 company_id2	 str20 company_id3
ABC	123	ABC123
EFG	456	EFG123
end  

*1.Convert string variable with characters/characters+numbers
encode company_id1, generate(company_id1a)

encode company_id3, generate(company_id3a)

gen company_id1b=real(company_id1) /*Real function can't be used for string variables with character and numbers */

*2.Convert string variable with numbers only
encode company_id2, generate(company_id2a)

gen company_id2b=real(company_id2)

describe

list
