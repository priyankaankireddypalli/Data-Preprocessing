# Problem on Inferential Statistics
library(readr)
# Importing dataset
Q7 <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/Q7.csv")
View(Q7) # Viewing the dataset
attach(Q7) # By attaching file there is no need to call it using $ operator every time
# In the given dataset we cannot calculate mean,median,var,sd and range, fot the 1st column
# Since it has discrete data we apply only mode to that column.
# Calculating mean for the given dataset
mean(Points) # To calculate mean of Points column
mean(Score) # To calculate mean of Score column
mean(Weigh) # To calculate mean of Weigh column
# Calculating median for the given dataset
median(Points) # To calculate median of Points column
median(Score) # To calculate median of Score column
median(Weigh) # To calculate median of Weigh column
# To calculate mode we need user defined function
mode<- function(x){
  a = table(x)
  return (a[which.max(a)])
}
mode(Points) # To calculate mode of Points column
mode(Score) #To calculate mode of Score column
mode(Weigh) #To calculate mode of Weigh column
mode(X1) #To calculate mode of X1 column
# Since no value is repeating in the first column it gave the first character in alphabetical order
# To calculate variance for the given dataset
var(Points) # To calculate variance of Points column
var(Score) # To calculate variance of Score column
var(Weigh) # To calculate variance of Weigh column
# To calculate standard deviation for the given dataset
sd(Points) # To calculate standard deviation of points column
sd(Score) # To calculate standard deviation of Score column
sd(Weigh) # To calculate standard deviation of Weigh column
# To calculate Range for the given dataset
rangepoints = max(Points)-min(Points) # To calculate range of points column
rangepoints
rangescore = max(Score)-min(Score) # To calculate range of Score column
rangescore
rangeweigh = max(Weigh)-min(Weigh) # To calculate range of Weigh column
rangeweigh
# To draw inference from the dataset we need to visualize it
# We will plot histogram for skewness
hist(Points, xlab = 'Points', ylab= 'frequency', col= 'blue', border = 'red', breaks = 15) # Histogram of Points is normally skewe
hist(Score, xlab = 'Score', ylab= 'frequency', col= 'blue', border = 'red', breaks = 15) # Histogram of Score is positively skewed
hist(Weigh, xlab = 'Weigh', ylab= 'frequency', col= 'blue', border = 'red', breaks = 15) # Histogram of Weigh is positively skewed 
# Boxplot to get the outliers from the dataset
x <- boxplot(Points,horizontal = T, xlab='Points', ylab='frequency', main='Points vs frequency', col = 'blue', border='red') # There are no outliers in the Points dataset
y <- boxplot(Score,horizontal = T, xlab='Score', ylab='frequency', main='Score vs frequency', col = 'blue', border='red') # There are outliers in the Score dataset
y$out
z <- boxplot(Weigh,horizontal = T, xlab='Weigh', ylab='frequency', main='Weigh vs frequency', col = 'blue', border='red') # There are outliers in the Weigh dataset
z$out
# There are outliers in the dataset 
# Since there are outliers in the dataset, we do winsorisation or trimming method 
library(readxl)
inferential_statistics <- read_excel("C:/Users/rammo/Downloads/DPP/datasets/inferential_statistics.xls")
View(inferential_statistics)
attach(inferential_statistics) # By attaching file there is no need to call it using $ operator every time
table(is.na(inferential_statistics)) # To check if there are any na values in the dataset
# Here we cannot calculate mean median and mode for first column since it has discrete data we can calculate mode 
# To calculate mean for the given dataset
colnames(inferential_statistics) # To get the column names
mean(`measure X`,na.rm = T) # To calculate mean of measure x column
# To calculate median for the given dataset
median(`measure X`,na.rm = T) # To calculate median of measure x column
# To calculate mode we need user defined function
mode<- function(x){
  a= table(x)
  return (a[which.max(a)])
}
mode(inferential_statistics$`Name of the company`) #To calculate mode of name of the company column
mode(`measure X`) # To calculate mode of measure.x column
# Since no value is repeating in the first column it gave the first character in alphabetical order
# To calculate variance for the given dataset
var(`measure X`,na.rm = T) # To calculate variance of measure.x column
# To calculate standard deviation for the given dataset
sd(`measure X`,na.rm = T) # To calculate standard deviation of measure.x column
# To calculate standard deviation for the given dataset
range = max(`measure X`,na.rm = T) - min(`measure X`,na.rm = T) # To calculate range of 'measure x' column
range
# To draw inference from the dataset we need to visualize it
# Histogram to get the skeweness of the dataset
hist(`measure X`, xlab = 'measure.X', ylab= 'frequency', col= 'blue', main = 'measure.x vs frequency', border = 'red', breaks = 15) # Histogram of measure x is positively skewed
# Boxplot to get the outliers from the dataset
g <- boxplot(`measure X`,horizontal = T, xlab='measure.x', ylab='frequency', main='measure.x vs frequency', col = 'blue', border='red') # There are outliers in the measure X dataset
g$out
# There are outliers in the dataset we have to deal with them winsorization or trimming method.






