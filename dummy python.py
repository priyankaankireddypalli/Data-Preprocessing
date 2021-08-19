import pandas as pd
import numpy as np
# Importing the dataset
dummydata = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/animal_category.csv") 
dummydata.columns # To get the column names
# To get the summary of the dataset
dummydata.dtypes 
dummydata.describe()
# We have 4 columns that has discrete data
# To check na values existing in dataset
dummydata.isna().sum() 
# There are no na values in the dataset
# The 4 column consists of discrete data and we have to proceed with dummy variable creation
dummydata_dummy = pd.get_dummies(dummydata,drop_first=True)
# Here we are doing the dummy variable creation for the discrete data by ignoring first dummy variable.
# Remove index column 
dummydata_dummy.drop(['Index'],axis=1,inplace=True)
# Standardize the data after creating dummy variable creation
# To perform standardization operation we have to define an user defined function
def stan_func(i):
    x = (i-i.mean())/(i.std())
    return (x)
dummystand = stan_func(dummydata_dummy)
# After applying standardizing we have to check the type of the columns
dummystand.dtypes 
# After standardizing our datapoints in each column should get mean as 0 and standard deviation as 1
# Let us randomly check mean and variance for some columns
dummystand.columns # To get the column names
np.mean(dummystand.Homly_Yes) #we are getting mean as 0
np.var(dummystand.Homly_Yes) #we are getting variance as 1
np.mean(dummystand.Types_B) #we are getting mean as 0
np.var(dummystand.Types_B) #we are getting variance as 1
# We are getting mean and variance as 0 and 1 so the standardization we have done is correct.
