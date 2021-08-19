# Problem on Dummy variable 
library(readr)
# Importing the dataset
animal_category <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/animal_category.csv")
View(animal_category)
attach(animal_category)  # By attaching file there is no need to call it using $ operator every time
summary(animal_category) # To get summary of the dataset
# We have columns that has discrete data
# Hence, We can't do outlier treatment to those columns
# To check the number of NA values
sum(is.na(animal_category)) 
table(is.na(animal_category)) 
# Therefore there are no NA values in our dataset
# Will do dummy variable creation
library(fastDummies)
colnames(animal_category)
animaldummy <- dummy_cols(animal_category,select_columns = c('Animals','Gender','Homly','Types'), remove_first_dummy = T,remove_most_frequent_dummy = F,remove_selected_columns = T)
# Remove index column 
animaldummy <- animaldummy[,-1]
summary(animaldummy)
# Here the data is not standardized, so we will make it scale free
# We will perform standardization
# Assigning the animaldummy to animalstand
animalstand <- animaldummy 
# For standardization  we have already defined function as scale
animalstand <- as.data.frame(scale(animaldummy))
animalstand
attach(animalstand)
colnames(animalstand) # To get the column names
# After standardizing the datapoints in each column should get mean as 0 and Variance as 1
mean(Animals_Dog) 
var(Animals_Dog) 
mean(Gender_Male)
var(Gender_Male) 
# We are getting mean and variance as 0 and 1 so the standardization we have done is correct.


