library(readr)
OnlineRetail <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/OnlineRetail.csv")
View(OnlineRetail)
attach(OnlineRetail)  # By attaching file there is no need to call it using $ operator every time
# Problem a to perform type casting operation
summary(OnlineRetail) 
typeof(InvoiceNo)  # To get the type of the dataset.
is.character(InvoiceNo) 
a1 <- as.factor(InvoiceNo) # Converting character to factor
typeof(a1) # To get the type of the dataset.
View(a1) # To view the dataset
typeof(StockCode)  # To get the type of the dataset.
is.character(StockCode) 
a2 <- as.factor(StockCode) # Converting character to factor
typeof(a2) # To get the type of the dataset.
View(a2) # To view the dataset
typeof(Description)  # To get the type of the dataset.
is.character(Description) 
a3 <- as.factor(Description) # Converting character to factor
typeof(a3) # To get the type of the dataset.
View(a3) # To view the dataset
typeof(Quantity)  # To get the type of the dataset.
is.integer(Quantity) 
a4 <- as.double(Quantity) # Converting integer to double
typeof(a4) # To get the type of the dataset.
View(a4) # To view the dataset
typeof(InvoiceDate)  # To get the type of the dataset.
is.character(InvoiceDate) 
a5 <- as.factor(InvoiceDate) # Converting character to factor
typeof(a5) # To get the type of the dataset.
View(a5) # To view the dataset
typeof(UnitPrice)  # To get the type of the dataset.
is.double(UnitPrice) 
a6 <- as.integer(UnitPrice) # Converting double to integer 
typeof(a6) # To get the type of the dataset.
View(a6) # To view the dataset
typeof(CustomerID)  # To get the type of the dataset.
is.integer(CustomerID) 
a7 <- as.double(CustomerID) # Converting integer to double
typeof(a7) # To get the type of the dataset.
View(a7) # To view the dataset
typeof(Country)  # To get the type of the dataset.
is.character(Country) 
a8 <- as.data.frame(Country) # Converting character to factor
typeof(a8) # To get the type of the dataset.
View(a8) # To view the dataset

# Problem b to check with duplicates and handle with it
table(duplicated(InvoiceNo)) # To check with duplicated values
drop1 <- InvoiceNo[!duplicated(InvoiceNo)] # To drop the duplicated values
table(duplicated(drop1)) # To check with whether we have removed duplicated values
table(duplicated(StockCode)) # To check with duplicated values
drop2 <- StockCode[!duplicated(StockCode)] # To drop the duplicated values
table(duplicated(drop2)) # To check with whether we have removed duplicated values
table(duplicated(Description)) # To check with duplicated values
drop3 <- Description[!duplicated(Description)] # To drop the duplicated values
table(duplicated(drop3)) # To check with whether we have removed duplicated values
table(duplicated(Quantity)) # To check with duplicated values
drop4 <- Quantity[!duplicated(Quantity)] # To drop the duplicated values
table(duplicated(drop4)) # To check with whether we have removed duplicated values
table(duplicated(InvoiceDate)) # To check with duplicated values
drop5 <- InvoiceDate[!duplicated(InvoiceDate)] # To drop the duplicated values
table(duplicated(drop5)) # To check with whether we have removed duplicated values
table(duplicated(UnitPrice)) # To check with duplicated values
drop6 <- UnitPrice[!duplicated(UnitPrice)] # To drop the duplicated values
table(duplicated(drop6)) # To check with whether we have removed duplicated values
table(duplicated(CustomerID)) # To check with duplicated values
drop7 <- CustomerID[!duplicated(CustomerID)] # To drop the duplicated values
table(duplicated(drop7)) # To check with whether we have removed duplicated values
table(duplicated(Country)) # To check with duplicated values
drop8 <- Country[!duplicated(Country)] # To drop the duplicated values
table(duplicated(drop8)) # To check with whether we have removed duplicated values

# Problem c to perform EDA on dataset
# To calculate mean of the numerical data
mean(Quantity)
mean(UnitPrice)
mean(CustomerID,na.rm = T)
# To calculate median of the numerical data
median(Quantity)
median(UnitPrice)
median(CustomerID,na.rm = T)
# To calculate mode we need user defined function
mode<- function(x){
  a= table(x)
  return (a[which.max(a)])
}
mode(InvoiceNo)
mode(StockCode)
mode(Description)
mode(Quantity)
mode(InvoiceDate)
mode(UnitPrice)
mode(CustomerID)
mode(Country)
# To calculate var of the numerical data
var(Quantity)
var(UnitPrice)
var(CustomerID,na.rm = T)
# Graphical representation is done only to numerical data
# Histogram to get the skeweness of the dataset
hist(CustomerID,xlab = 'CustomerID',ylab= 'frequency',col= 'blue',border = 'red',breaks = 10) # Histogram is normally skewed
# Boxplot to get the outliers from the dataset
x<- boxplot(CustomerID,horizontal = T,xlab='CustomerID',ylab='frequency',main='CustomerID vs frequency',col = 'blue',border='red') # There are no outliers in the dataset



