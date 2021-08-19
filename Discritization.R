# Discretization
library(readr)
# Importing Dataset
iris <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/DataSets/iris.csv")
View(iris) # Viewing the Dataset
colnames(iris)
# Dicretization of continous data to discrete data
iris$Sepal.Length <- cut(iris$Sepal.Length,breaks =c(4,5,6,8), labels = c("Shortsepallength","Averagesepallength","Highsepallength"))
iris$Sepal.Width <- cut(iris$Sepal.Width,breaks = c(1,3,4,5),labels = c("Shortsepalwidth","Averagesepalwidth","Highsepalwidth"))
iris$Petal.Length <- cut(iris$Petal.Length,breaks = c(0,3,5,7),labels = c("Shortpetallength","Averagepetallength","Highpetallength"))
iris$Petal.Width <- cut(iris$Petal.Width,breaks = c(0,1,2,3),labels = c("Shortpetalwidth","Averagepetalwidth","Highpetalwidth"))
# Now we will perform processing techniques
# Checking for NA values in the dataset
is.na(iris)
table(is.na(iris)) # From this there are no NA values.
# Checking str and summary of the iris dataset
str(iris)
summary(iris)
# Doing dummy variables creation and doing standardization 
install.packages("fastDummies") 
library(fastDummies)
irisdummy <- dummy_cols(iris, select_columns = c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species"),remove_first_dummy = TRUE,remove_most_frequent_dummy = FALSE,remove_selected_columns = TRUE)
colnames(irisdummy) # Viewing column names
summary(irisdummy)
# Scalling the data to make it free of unit
irisdatastan <- irisdummy # Assigning the irisdummy to irisdatastan
# Remove index column 
irisdatastan <- irisdatastan[,-1]
# Using scale function to standardize the data 
irisdatascale <- as.data.frame(scale(irisdatastan))
attach(irisdatascale)  # By attaching there is no need to call with $ operator everytime
colnames(irisdatascale) 
# After standardizing our datapoints in each column should get mean as 0 and standard deviation as 1
mean(Sepal.Length_Averagesepallength)
var(Sepal.Length_Averagesepallength) 
mean(Species_virginica)
var(Species_virginica)
# We are getting mean and variance as 0 and 1 so the standardization we have done is correct.

