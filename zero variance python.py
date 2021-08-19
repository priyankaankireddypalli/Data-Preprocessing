import pandas as pd
import numpy as np
z = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/Z_dataset.csv") #to import dataset from external source
# To check if there any missing values in the dataset
z.isna().sum()
# To get the datatype of all the columns
z.info()
# From summary we can see that column colour has character data in it, we need to do dummy variable creation to perform zero variance operation.
zdummy = pd.get_dummies(z,drop_first=True)
# Here we are doing the dummy variable creation for the discrete data by ignoring first dummy variable.
# Will eliminate ID column
zdummy.columns # To get the columns name
zdummy.drop(['Id'],axis=1,inplace=True)
# Now we have to apply zero Variance
print(np.var(zdummy,axis=0))
# We have non zero variance in all the columns if we had any column with zero variance,we could have ignored that column.


