# Problem on Outlier Treatment
library(readr)
# Importing dataset
boston_data <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/boston_data.csv")
View(boston_data) #to view the data
attach(boston_data) # By attaching file there is no need to call it using $ operator every time
# Checking for NA values
is.na(boston_data) 
sum(is.na(boston_data)) # For displaying total number of NA values 
table(is.na(boston_data)) # It will display the total number of NA values in our dataset
summary(is.na(boston_data)) 
# Boxplot to identify outliers in 'Crim' column
x <- boxplot(crim,horizontal = T,xlab='crim',ylab='frequency', main='crim vs frequency',col='blue',border = 'red')
x$out
# Replacing the outliers values by Winsorization
qunt1 <- quantile(crim,probs = c(.25,.75))
qunt1 
wins1 <- quantile(crim,probs = c(.01,.98),na.rm = T)
wins1
a <- 1.5*IQR(crim,na.rm=T)
a
# Lower limit formula Q1-(1.5*IQR)
b <- qunt1[1]-a  
b
# Lower limit formula Q3+(1.5*IQR)
c <- qunt1[2]+a  
c
# To flag outliers from the dataset crim
outliers_flag_crim <- (crim>c)
table(outliers_flag_crim) 
View(outliers_flag_crim)
# Replacing the outliers by winsorization method
crim[crim<b] <- wins1[1]
crim[crim>c] <- wins1[2]
boxplot(crim)
# To check with outliers greater than 98% of the limit value 
outliers_final_crim <- (crim>wins1[2])
View(outliers_final_crim)
table(outliers_final_crim) 
View(crim)
# Boxplot to identify outliers in 'zn' column
y <- boxplot(zn,horizontal = T,xlab='zn',ylab='frequency',main='zn vs frequency',col='blue',border = 'red')
y$out
# To check and remove outliers of second column zn
qunt2 <- quantile(zn,probs = c(.25,.75))
qunt2 
wins2 <- quantile(zn,probs = c(.01,.95),na.rm = T)
wins2
wins2[1]
wins2[2]
d <- 1.5*IQR(zn,na.rm=T)
d
# Lower limit formula Q1-(1.5*IQR)
e <- qunt2[1]-d  
e
# Lower limit formula Q3+(1.5*IQR)
f <- qunt2[2]+d  
f
# To flag outliers from the dataset zn
outliers_flag_zn <- (zn>f)
table(outliers_flag_zn) 
View(outliers_flag_zn)
zn[zn<e] <- wins2[1]
zn[zn>f] <- wins2[2]
boxplot(zn)
outliers_final_zn <- (zn>wins2[2])
View(outliers_final_zn)
table(outliers_final_zn) 
View(zn)
# Boxplot to identif outliers in 'indus' column
z <- boxplot(indus,horizontal = T,xlab='indus',ylab='frequency',main='indus vs frequency',col='blue',border = 'red')
z$out 
# There are no outliers in the indus column
# The column 'chas' can be ignored since it has categorical data
# Boxplot to identify outliers in 'nox' column
p <- boxplot(nox,horizontal = T,xlab='nox',ylab='frequency',main='nox vs frequency',col='blue',border = 'red')
p$out 
# There are no outliers in the nox column
# Boxplot to identif outliers in 'rm' column
q <- boxplot(rm,horizontal = T,xlab='rm',ylab='frequency',main='rm vs frequency',col='blue',border = 'red')
q$out
# To check and remove outliers rm
qunt3 <- quantile(rm,probs = c(.25,.75))
qunt3 
wins3 <- quantile(rm,probs = c(.01,.95),na.rm = T)
wins3
wins3[1]
wins3[2]
g <- 1.5*IQR(rm,na.rm=T)
g
# Lower limit formula Q1-(1.5*IQR)
h <- qunt3[1]-g  
h
# Lower limit formula Q3+(1.5*IQR)
i <- qunt3[2]+g  
i
# To flag outliers from the dataset rm
outliers_flag_rm <- c(rm<!h,rm>i)
table(outliers_flag_rm) 
View(outliers_flag_rm)
rm[rm<h] <- wins3[1]
rm[rm>i] <- wins3[2]
boxplot(rm)
outliers_final_rm <- c(rm>wins3[2])
View(outliers_final_rm)
table(outliers_final_rm) 
View(rm)
# Boxplot to identify outliers in age column
r <- boxplot(age,horizontal = T,xlab='age',ylab='frequency',main='age vs frequency',col='blue',border = 'red')
r$out 
# There are no outliers in the age column
# Boxplot to identify outliers in dis column
s <- boxplot(dis,horizontal = T,xlab='dis',ylab='frequency',main='dis vs frequency',col='blue',border = 'red')
s$out
# To check and remove outliers from column dis
qunt4 <- quantile(dis,probs = c(.25,.75))
qunt4 
wins4 <- quantile(dis,probs = c(.01,.95),na.rm = T)
wins4
wins4[1]
wins4[2]
j <- 1.5*IQR(dis,na.rm=T)
j
# Lower limit formula Q1-(1.5*IQR)
k <- qunt4[1]-j  
k
# Lower limit formula Q3+(1.5*IQR)
l <- qunt4[2]+j  
l
# To flag outliers from the dataset dis
outliers_flag_dis <- (dis>!l)
table(outliers_flag_dis) 
View(outliers_flag_dis)
dis[dis<k] <- wins4[1]
dis[dis>l] <- wins4[2]
boxplot(dis)
outliers_final_dis <- (dis>!wins4[2])
View(outliers_final_dis)
table(outliers_final_dis) 
View(dis)
# Boxplot to identify outliers in rad column
u <- boxplot(rad,horizontal = T,xlab='rad',ylab='frequency',main='rad vs frequency',col='blue',border = 'red')
u$out 
# There are no outliers in the rad column
# Boxplot to identify outliers in tax column
v <- boxplot(tax,horizontal = T,xlab='tax',ylab='frequency',main='tax vs frequency',col='blue',border = 'red')
v$out 
# There are no outliers in the tax column
# Boxplot to identify outliers in ptratio column
w <- boxplot(ptratio,horizontal = T,xlab='ptratio',ylab='frequency',main='ptratio vs frequency',col='blue',border = 'red')
w$out
# To check and remove outliers from column ptratio
qunt5 <- quantile(ptratio,probs = c(.25,.75))
qunt5 
wins5 <- quantile(ptratio,probs = c(.05,.95),na.rm = T)
wins5
wins5[1]
wins5[2]
m <- 1.5*IQR(ptratio,na.rm=T)
m
# Lower limit formula Q1-(1.5*IQR)
n <- qunt5[1]-m  
n
# Lower limit formula Q3+(1.5*IQR)
o <- qunt5[2]+m  
o
# To flag outliers from the dataset ptratio
outliers_flag_ptratio <- (ptratio<n)
table(outliers_flag_ptratio) 
View(outliers_flag_ptratio)
ptratio[ptratio<n] <- wins5[1]
ptratio[ptratio>o] <- wins5[2]
boxplot(ptratio)
outliers_final_ptratio <- (ptratio<!wins5[1])
View(outliers_final_ptratio)
table(outliers_final_ptratio) 
View(ptratio)
# Boxplot to identify outliers in black column
x1 <- boxplot(black,horizontal = T,xlab='black',ylab='frequency',main='black vs frequency',col='blue',border = 'red')
x1$out
# To check and remove outliers from column black
qunt6 <- quantile(black,probs = c(.25,.75))
qunt6 
wins6 <- quantile(black,probs = c(.05,.95),na.rm = T)
wins6
wins6[1]
wins6[2]
a1 <- 1.5*IQR(black,na.rm=T)
a1
# lower limit formula Q1-(1.5*IQR)
b1 <- qunt6[1]-a1  
b1
# lower limit formula Q3+(1.5*IQR)
c1 <- qunt6[2]+a1  
c1
# To flag outliers from the dataset black
outliers_flag_black <- (black<b1)
table(outliers_flag_black) 
View(outliers_flag_black)
black[black<b1] <- wins6[1]
black[black>c1] <- wins6[2]
boxplot(black)
outliers_final_black <- (black<wins6[1])
View(outliers_final_black)
table(outliers_final_black) 
View(black)
# Boxplot to identify outliers in lstat column
x2 <- boxplot(lstat,horizontal = T,xlab='lstat',ylab='frequency',main='lstat vs frequency',col='blue',border = 'red')
x2$out
# To check and remove outliers from column lstat
qunt7 <- quantile(lstat,probs = c(.25,.75))
qunt7 
wins7 <- quantile(black,probs = c(.05,.95),na.rm = T)
wins7
wins7[1]
wins7[2]
a2 <- 1.5*IQR(lstat,na.rm=T)
a2
# lower limit formula Q1-(1.5*IQR)
b2 <- qunt7[1]-a2  
b2
# lower limit formula Q3+(1.5*IQR)
c2 <- qunt7[2]+a2  
c2
# To flag outliers from the dataset lstat
outliers_flag_lstat <- (lstat<b2)
table(outliers_flag_lstat) 
View(outliers_flag_lstat)
lstat[lstat<b2] <- wins7[1]
lstat[lstat>c2] <- wins7[2]
boxplot(lstat)
outliers_final_lstat <- (lstat<!wins7[1])
View(outliers_final_lstat)
table(outliers_final_lstat) 
View(lstat)
# Boxplot to identify outliers in medv column
x3 <- boxplot(medv,horizontal = T,xlab='medv',ylab='frequency',main='medv vs frequency',col='blue',border = 'red')
x3$out
# To check and remove outliers from column medv
qunt8 <- quantile(medv,probs = c(.25,.75))
qunt8 
wins8 <- quantile(medv,probs = c(.05,.95),na.rm = T)
wins8
wins8[1]
wins8[2]
a3 <- 1.5*IQR(medv,na.rm=T)
a3
# lower limit formula Q1-(1.5*IQR)
b3 <- qunt8[1]-a3  
b3
# lower limit formula Q3+(1.5*IQR)
c3 <- qunt8[2]+a3  
c3
# To flag outliers from the dataset lstat
outliers_flag_medv <- c(medv<b3,medv>c3)
table(outliers_flag_medv) 
View(outliers_flag_medv)
medv[medv<b3] <- wins8[1]
medv[medv>c3] <- wins8[2]
boxplot(medv)
outliers_final_medv <- (medv<!wins8[1])
View(outliers_final_medv)
table(outliers_final_medv) 
View(medv)
# We have removed all the outliers from our dataset


