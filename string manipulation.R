library(stringr) # Package required for accessing string.
# problem 1 to create a string Grow Gratitude
# Creating string 'Growing Gratitude'
p <- "Grow Gratitude"  
str_sub(p,1,1) # To access letter G
str_length(p) # To find the length of string
str_count(p,pattern = 'G') # To count how many times letter 'G' has been repeated in the string

# Problem 2 to create a string "Being aware of a single shortcoming within yourself is far more useful than being aware of a thousand in someone else." and count the number of characters
q <- "Being aware of a single shortcoming within yourself is far more useful than being aware of a thousand in someone else"
str_count(q,boundary("character")) # To count the number of characters in the string
str_count(q,boundary("word")) # To count the number of Word in the string

# Problem 3 to create a string "Idealistic as it may sound, altruism should be the driving force in business, not just competition and a desire for wealth" and find character of the string
r <- "Idealistic as it may sound, altruism should be the driving force in business, not just competition and a desire for wealth"
str_sub(r,1,1) # To get one char of the word
str_sub(r,1,3) # To get first three character
str_sub(r,120) # To get last three character

# Problem 4 to create a string "stay positive and optimistic"
s <- "stay positive and optimistic"
str_split(s," ") # To split based on whitespace
str_detect(s,"H") # To detect any string starts with H
str_detect(s,"d") # To detect any string ends with d
str_view(s,"d") # To highlight the letter ends with d in the viewer window
str_detect(s,"c") # To detect any string ends with c
str_view(s,"c") # To highlight the letter ends with c in the viewer window

# Problem 6 to repeat 'o' 108 time
t <- 'o' # Assigning o to variable 't'
u <- str_dup(t,108) # Code to duplicate 'o' 108 times
u
str_length(u) #to check the length of the variable 'u'

# Problem 7 to create a string and replace it with another one.
v <- "Grow Gratitude"
str_replace(v,"Grow","Growth of") # To replace "Grow" with "Growth of"

# Problem 8 to print the story in correct order.

w <- (".elgnuj eht otni ffo deps meht fo htoB .eerf noil eht tes ot sepor eht no dewang dna nar 
eh ,ylkciuQ .elbuort ni noil eht deciton dna tsap deklaw esuom eht ,nooS 
.repmihw ot detrats dna tuo teg ot gnilggurts saw noil ehT .eert a tsniaga pu mih deit yehT 
.meht htiw noil eht koot dna tserof eht otni emac sretnuh wef a ,yad enO .og mih tel dna ecnedifnoc 
s???esuom eht ta dehgual noil ehT ???.em evas uoy fi yademos uoy ot pleh taerg fo eb lliw I 
,uoy esimorp I??? .eerf mih tes ot noil eht detseuqer yletarepsed esuom eht nehw esuom eht tae ot tuoba 
saw eH .yrgna etiuq pu ekow eh dna ,peels s???noil eht debrutsid sihT 
.nuf rof tsuj ydob sih nwod dna pu gninnur detrats esuom a nehw elgnuj eht ni gnipeels ecno saw noil A")
library(stringi) # Package for string manupulation
x <- stri_reverse(w) # Code to print string in reverse order.
x # To get the output of string in correct order
# In the output we have lot of \n in the sentence which we don't required so we will remove it
str_remove_all(x,"\n") # To get the output in proper order.

