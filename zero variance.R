library(readr)
Z_dataset <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/Z_dataset.csv")
View(Z_dataset)
attach(Z_dataset)     # By attaching file there is no need to call it using $ operator every time
# To check is there any missing values in the dataset
table(is.na(Z_dataset))
summary(Z_dataset)
# Since there is a character column in our dataset we will proceed with dummy variable creation
library(fastDummies)
colnames(Z_dataset)
zdummy <- dummy_cols(Z_dataset,select_columns = ('colour'),remove_first_dummy = T,remove_most_frequent_dummy = F,remove_selected_columns = T)
# We will eliminate ID column
zdummy <- zdummy[,-1]
# Now we have to apply zero Variance
library(ggplot2)
library(ggthemes)
# Use 'apply' and 'var' functions to check for variance on numerical values
apply(zdummy, 2, var)
# Check for the columns having zero variance
which(apply(zdummy, 2, var)==0) 
# We have variance in all the columns if we had any column with zero variance, we could have ignored that column.

