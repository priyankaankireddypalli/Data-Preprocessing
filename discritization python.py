import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# Load the dataset
irisdata = pd.read_csv('C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/iris.csv')
irisdata.columns # To get the column names of teh dataset.
# Dicretization of continous data to discrete data
# In our dataset we have 4 columns which consists of continous data.
# We are grouping the continous data into three groups such as 'short','average','high' based on there breaks.
irisdata['Sepal.Length'] = pd.cut(irisdata['Sepal.Length'],bins=[4,5,6,8],labels=["short_sepal_length","average_sepal_length","high_sepal_length"])
irisdata['Sepal.Width'] = pd.cut(irisdata['Sepal.Width'],bins=[1,3,4,5],labels=["short_sepal_width","average_sepal_width","high_sepal_width"])
irisdata['Petal.Length'] = pd.cut(irisdata['Petal.Length'],bins=[0,3,5,7],labels=["short_petal_length","average_petal_length","high_petal_length"])
irisdata['Petal.Width'] = pd.cut(irisdata['Petal.Width'],bins=[0,1,2,3],labels=["short_petal_width","average_petal_width","high_petal_width"])
irisdata.describe # To get the summary of the dataset
irisdata.isna().sum() # To check with if there are any NA values in the dataset after grouping
# We will do dummy variable creation and standardize the data so that we will get a better model
# Create dummy variables on categorcal columns
irisdummy = pd.get_dummies((irisdata),drop_first=True)
# Here we are doing the dummy variable creation for the discrete data by ignoring first dummy variable.
# Standardize the data after creating dummy variable creation
irisnorm = irisdummy # Assigning the irisdummy to irisnorm
irisnorm.columns 
# Remove index column 
irisnorm = irisnorm.drop(["Unnamed: 0"],axis=1)
# To perform standardization operation we have to define an user defined function
def norm_func(i):
    x = (i-i.mean())/(i.std())
    return (x)
# standardizing data frame 
irisstand = norm_func(irisnorm.iloc[:,0:10])
irisstand.columns
# After standardizing our datapoints in each column should get mean as 0 and standard deviation as 1
np.mean(irisstand['Sepal.Width_high_sepal_width']) # We are getting mean as 0
np.var(irisstand['Sepal.Width_high_sepal_width']) #we are getting variance as equal to 1
np.mean(irisstand['Species_versicolor']) #we are getting mean as 0
np.var(irisstand['Species_versicolor']) #we are getting variance as equal to 1
# We are getting mean and variance as 0 and 1 so the standardization we have done is correct.