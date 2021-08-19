# Creating string 'Growing Gratitude'
p = "Grow Gratitude"  
# To access letter G
p[0] 
# To find the length of string
len(p) 

# Problem 2 to create a string and count the number of characters
q = "Being aware of a single shortcoming within yourself is far more useful than being aware of a thousand in someone else"
#To count the number of characters in the string
len(q) 
#To count the number of Word in the string
print(q.count(' ')) 

# Problem 3 to create a string and find character of the string
r = "Idealistic as it may sound, altruism should be the driving force in business, not just competition and a desire for wealth"
# To get the length of the sentence
len(r) 
# To get one char of the word
r[0] 
# To get first three character
r[0:3] 
# To get last three character
r[120:124] 

# Problem 4 to create a string
s = "stay positive and optimistic"
# To split based on whitespace
s.split() 
# To detect any string starts with H
s.startswith("H") 
# To get the index value of 'd'
s[16] 
# To detect any string ends with d
s.endswith('d',10,17) 
# To detect any string ends with c
s.endswith("c") 

# Problem 5 to print '🪐' 108 times
print( " 🪐 "* 108 ) 

# Problem 7 to create a string and replace it with another one.
v = "Grow Gratitude"
# To replace "Grow" with "Growth of"
v.replace("Grow", "Growth of")  

# Problem 8 to print the story in correct order.
w = """.elgnuj eht otni ffo deps meht fo htoB .eerf noil eht tes ot sepor eht no dewang dna nar 
eh ,ylkciuQ .elbuort ni noil eht deciton dna tsap deklaw esuom eht ,nooS .repmihw ot detrats 
dna tuo teg ot gnilggurts saw noil ehT .eert a tsniaga pu mih deit yehT .meht htiw noil eht 
koot dna tserof eht otni emac sretnuh wef a ,yad enO .og mih tel dna ecnedifnoc s’esuom eht 
ta dehgual noil ehT ”.em evas uoy fi yademos uoy ot pleh taerg fo eb lliw I ,uoy esimorp I“ 
.eerf mih tes ot noil eht detseuqer yletarepsed esuom eht nehw esuom eht tae ot tuoba saw 
eH .yrgna etiuq pu ekow eh dna ,peels s’noil eht debrutsid sihT .nuf rof tsuj ydob sih nwod 
dna pu gninnur detrats esuom a nehw elgnuj eht ni gnipeels ecno saw noil A"""
# To get the output of string in correct order
print (''.join(reversed(w))) 









