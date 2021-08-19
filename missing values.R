# Problem on Missing Values
library(readr)
# Importing the dataset
claimants <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/claimants.csv")
View(claimants)
attach(claimants) # By attaching file there is no need to call it using $ operator every time
# To check for NA values existing in our dataset
sum(is.na(claimants)) # To check the sum of NA value in our dataset
table(is.na(claimants)) # It will display the total number of NA values in our dataset
summary(is.na(claimants)) # To get the summary of dataset column wise.
# MICE (Multivariate Imputation via Chained Equations)
library(mice)
md.pattern(claimants[-1]) # Will not consider first column since it has nominal data
# Returns observations with no missing values
# Omitting NA values from the Data 
data_omit <- na.omit(claimants) # na.omit => will omit the rows which has atleast 1 NA value
data_omit
dim(data_omit)
sum(is.na(data_omit)) 
# Sex is categorical data we have missing value in it so we apply mode imputation method
# Mode imputation for categorical data
# Custom function to calculate Mode
Mode <- function(x){
  a=table(x)
  return(a[which.max(a)])
}

# To calculate mode of CLMSEX
x <- Mode(CLMSEX)
x
# To calculate mode of CLMINSUR
y <- Mode(CLMINSUR)
y
# To calculate mode of SEATBELT
z <- Mode(SEATBELT)
z

# Replacing the missing values by the mode value of CLMSEX
claimants$CLMSEX[is.na(claimants$CLMSEX)] <- Mode(claimants$CLMSEX[!is.na(claimants$CLMSEX)])
# After replacing to check with is there any na values in the column
table(is.na(claimants$CLMSEX))
summary(claimants$CLMSEX)
# Replacing the missing values by the mode value of CLMINSUR
claimants$CLMINSUR[is.na(claimants$CLMINSUR)] <- Mode(claimants$CLMINSUR[!is.na(claimants$CLMINSUR)])
# After replacing to check with is there any na values in the column
table(is.na(claimants$CLMINSUR))
summary(claimants$CLMINSUR)
# Replacing the missing values by the mode value of SEATBELT
claimants$SEATBELT[is.na(claimants$SEATBELT)] <- Mode(claimants$SEATBELT[!is.na(claimants$SEATBELT)])
# After replacing to check with is there any na values in the column
table(is.na(claimants$SEATBELT))
summary(claimants$SEATBELT)
# CLMAGE is a ratio data we have to check with is there any outliers.
# If there are any outliers we proceed with mode imputation method.
p <- boxplot(CLMAGE)
p$out # We have one outliers in the dataset
# Replacing the missing values by the median value of CLMAGE
claimants$CLMAGE[is.na(claimants$CLMAGE)] <- median(claimants$CLMAGE,na.rm = T)
# After replacing to check with is there any na values in the column
table(is.na(claimants$CLMAGE))
summary(claimants$CLMAGE)
# To check the dataset finally whether we have removed the missing values in the dataset
table(is.na(claimants))
summary(is.na(claimants)) 
# The output we are getting is false so that means we have successfully imputated the missing values.


