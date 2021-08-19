# Problem on Standardization
library(readr)
# Importing the dataset
Seeds_data <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/Seeds_data.csv")
View(Seeds_data)
attach(Seeds_data) # By attaching file there is no need to call it using $ operator every time
summary(Seeds_data) 
colnames(Seeds_data) # To get the column names
# Checking NA values in our Dataset
is.na(Seeds_data) 
table(is.na(Seeds_data)) # We will get the number of NA values in our dataset
# Therefore there are no NA values in our dataset 
# Now we have to check with outlier in each column and deal with it
# Boxplot to identify outliers in Area column
x <- boxplot(Area,horizontal = T,xlab='Area',ylab='frequency', main='Area vs frequency',col='blue',border = 'red')
x$out # There are no outliers in the Area column.
# Boxplot to identify outliers in perimeter column
y <- boxplot(Perimeter,horizontal = T,xlab='Perimeter',ylab='frequency', main='Perimeter vs frequency',col='blue',border = 'red')
y$out # There are no outliers in the perimeter column.
# Boxplot to identify outliers in compactness column
z <- boxplot(Compactness,horizontal = T,xlab='Compactness',ylab='frequency', main='Compactness vs frequency',col='blue',border = 'red')
z$out # There are outliers in the compactness column.
# To check with outleirs in the columns compactness and remove it
qunt1 <- quantile(Compactness,probs = c(0.25,.75))
qunt1 # 25%=0.856900 100%=0.887775
Wins1 <- quantile(Compactness,probs = c(0.10,0.95),na.rm = T)
Wins1
Wins1[1]
Wins1[2]
p <- 1.5*IQR(Compactness,na.rm = T)
p
q <- qunt1[1]-p
q
r <- qunt1[2]+p
r
# To flag outliers in the column compactness
outlierscompactness <- (Compactness < q)
table(outlierscompactness)
View(outlierscompactness)
# To replace the outliers with winsorization method
Compactness[Compactness < q] <- Wins1[1]
Compactness[Compactness > r] <- Wins1[2]
boxplot(Compactness,horizontal = T)
# To check with ouliers lesser than 10% of the limit value
outlierscompactness <- (Compactness<!Wins1[1])
View(outlierscompactness)
table(outlierscompactness)
# Boxplot to identify outliers in length column
a <- boxplot(length,horizontal = T,xlab='length',ylab='frequency', main='length vs frequency',col='blue',border = 'red')
a$out # There are no outliers in the length column.
# Boxplot to identify outliers in Width column
b <- boxplot(Width,horizontal = T,xlab='Width',ylab='frequency',main='Width vs frequency',col='blue',border = 'red')
b$out # There are no outliers in the length column.
# Boxplot to identify outliers in Assymetry_coeff column
c <- boxplot(Assymetry_coeff,horizontal = T,xlab='Assymetry_coeff',ylab='frequency',main='Assymetry_coeff vs frequency',col='blue',border = 'red')
c$out # There are outliers in the Assymetry_coeff column.
# To check with outleirs in the columns Assymetric_Coeff and remove it
qunt2 <- quantile(Assymetry_coeff,probs = c(0.25,0.75))
qunt2  #25%=0.856900 100%=0.887775
Wins2 <- quantile(Assymetry_coeff,probs = c(0.05,0.98),na.rm = T)
Wins2
Wins2[1]
Wins2[2]
s <- 1.5*IQR(Assymetry_coeff,na.rm = T)
s
t <- qunt2[1]-s
t
u <- qunt2[2]+s
u
# To flag outliers in the column Assymetric_Coeff
outliersAssymetric_coeff <- (Assymetry_coeff>u)
table(outliersAssymetric_coeff)
View(outliersAssymetric_coeff)
# To replace the outliers with winsorization method
Assymetry_coeff[Assymetry_coeff<t] <- Wins2[1]
Assymetry_coeff[Assymetry_coeff>u] <- Wins2[2]
boxplot(Assymetry_coeff,horizontal = T)
# To check with ouliers greater than 95% of the limit value
outliersAssymetric_coeff <- (outliersAssymetric_coeff>Wins2[2])
View(outliersAssymetric_coeff)
table(outliersAssymetric_coeff)
# Boxplot to identify outliers in len_ker_grove column
d <- boxplot(len_ker_grove,horizontal = T,xlab='len_ker_grove',ylab='frequency',main='len_ker_grove vs frequency',col='blue',border = 'red')
d$out # There are no outliers in the len_ker_grove column.
# There are no more outliers in our dataset
# 8th column consists of discrete data and we have to proceed with dummy variable creation
install.packages("fastDummies")
library(fastDummies)
seedsdatadummy <- dummy_cols(Seeds_data,select_columns = ('Type'),remove_first_dummy = T,remove_most_frequent_dummy = F,remove_selected_columns = T)
summary(seedsdatadummy)
# Performing standardization
seedsdatastand <- seedsdatadummy # Assigning the seedsdatadummy to seedsdatastan
seedsdatastand <- as.data.frame(scale(seedsdatadummy))
seedsdatastand
attach(seedsdatastand)
colnames(seedsdatastand) # To get the column names
# After standardizing our datapoints in each column should get mean as 0 and standard deviation as 1
mean(seedsdatastand$Area) #we are getting mean as 0
var(seedsdatastand$Area) #we are getting variance as 1
mean(seedsdatastand$Type_2)#we are getting mean as 0
var(seedsdatastand$Type_2)#we are getting variance as 1
# We are getting mean and variance as 0 and 1 so the standardization we have done is correct.
# For normalization we have to define user defined function
norm <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
# Applying normalization to the dataset
seedsdatanorm <- as.data.frame(lapply(seedsdatadummy, norm))
colnames(seedsdatanorm)
# After normalizing our datapoints in each column should get min as 0 and max as 1
# Let us randomly check min and maximum for some columns
min(seedsdatanorm$Assymetry_coeff) #we are getting min as 0
max(seedsdatanorm$Assymetry_coeff)#we are getting max as 1
min(seedsdatanorm$Perimeter)#we are getting min as 0
max(seedsdatanorm$Perimeter)#we are getting max as 1
# We are getting min and max as 0 and 1 so the normalization we have done is correct.




