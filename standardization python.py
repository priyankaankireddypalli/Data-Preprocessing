import pandas as pd
import numpy as np
# To import dataset 
stand = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/Seeds_data.csv") 
stand.columns # To get the column names
# Checking for NA values in our dataset
stand.isna().sum() 
# To check type of dataset in each column
stand.dtypes 
# Now we have to check with outliers 
import seaborn as sns
import matplotlib.pyplot as plt
# Boxplot to identify outliers
sns.boxplot(stand.Area);plt.title('Boxplot');plt.show()
# There are no outliers in the Area column.
sns.boxplot(stand['Perimeter ']);plt.title('Boxplot');plt.show()
# There are no outliers in the perimeter column.
# Boxplot to identify outliers in compactness column
sns.boxplot(stand.Compactness);plt.title('Boxplot');plt.show()
# There are outliers in the compactness column.
# Detection of outliers (find limits for crim based on IQR)
IQR1 = stand['Compactness'].quantile(0.75) - stand['Compactness'].quantile(0.25)
lower_limit1 = stand['Compactness'].quantile(0.25) - (IQR1 * 1.5)
lower_limit1
upper_limit1 = stand['Compactness'].quantile(0.75) + (IQR1 * 1.5)
upper_limit1
# let's flag the outliers in the data set
outliers_stand1 = np.where(stand['Compactness'] > upper_limit1, True, np.where(stand['Compactness'] < lower_limit1, True, False))
outliers_stand1
# We will manually replace the  outliers value by maximum and minimum value
stand['Compactness'] = pd.DataFrame(np.where(stand['Compactness'] > upper_limit1, upper_limit1, np.where(stand['Compactness'] < lower_limit1, lower_limit1, stand['Compactness'])))
sns.boxplot(stand.Compactness);plt.title('Boxplot');plt.show()
# boxplot to identify outliers in length column
sns.boxplot(stand.length);plt.title('Boxplot');plt.show()
# There are no outliers in the length column.
# boxplot to identify outliers in Width column
sns.boxplot(stand.Width);plt.title('Boxplot');plt.show()
# There are no outliers in the length column.    
# boxplot to identify outliers in Assymetry_coeff column
sns.boxplot(stand.Assymetry_coeff);plt.title('Boxplot');plt.show()
# There are outliers in the Assymetry_coeff column.
# Detection of outliers (find limits for crim based on IQR)
IQR2 = stand['Assymetry_coeff'].quantile(0.75)-stand['Assymetry_coeff'].quantile(0.25)
lower_limit2 = stand['Assymetry_coeff'].quantile(0.25)-(1.5*IQR2)
lower_limit2
upper_limit2 = stand['Assymetry_coeff'].quantile(0.75)+(1.5*IQR2)
upper_limit2
# let's flag the outliers in the data set
outliers_stand2 = np.where(stand['Assymetry_coeff']>upper_limit2,True,np.where(stand['Assymetry_coeff']<lower_limit2,True,False))
outliers_stand2
# we will manually replace the  outliers value by maximum and minimum value
stand['Assymetry_coeff'] = pd.DataFrame(np.where(stand['Assymetry_coeff']>upper_limit2,upper_limit2,np.where(stand['Assymetry_coeff']<lower_limit2,lower_limit2,stand['Assymetry_coeff'])))
sns.boxplot(stand.Assymetry_coeff);plt.title('Boxplot');plt.show()
# boxplot to identify outliers in len_ker_grove column
sns.boxplot(stand.len_ker_grove);plt.title('Boxplot');plt.show()
# there are no outliers in the len_ker_grove column.
# Therefore there are no outliers left in our dataset
# The 8th column consists of discrete data and we have to proceed with dummy variable creation
standdummy = pd.get_dummies(stand['Type'],drop_first=True)
# concatenate standdummy and stand 
standconcat = pd.concat([stand,standdummy],axis=1)
# Drop the Type column which is of no use we already did dummy variable on those
standconcat.drop(['Type'],axis=1,inplace=True)
standconcat.columns # To get the column names
# To rename the columns 2 and 3 as Type 2  and Type 3
standconcat.rename(columns={2:'Type2',3:'Type3'},inplace=True)
# Standardize the data after creating dummy variable creation
# To perform standardization operation we have to define an user defined function
def stan_func(i):
    x = (i-i.mean())/(i.std())
    return (x)
standardized = stan_func(standconcat)
standardized.columns
# After standardizing our datapoints in each column should get mean as 0 and standard deviation as 1
np.mean(standardized['Width']) #we are getting mean as 0
np.var(standardized['Width']) #we are getting variance as equal to 1
np.mean(standardized['Type3']) #we are getting mean as 0
np.var(standardized['Type3']) #we are getting variance as equal to 1
# We are getting mean and variance as 0 and 1 so the standardization we have done is correct.
# Normalize the data after creating dummy variable creation
def norm_func(i):
    x = (i-i.min())/(i.max()-i.min())
    return (x)
# Applying normalization to the dataset
normalized = norm_func(standconcat)
normalized.columns # to get column names
# After normalizing our datapoints in each column should get min as 0 and max as 1
np.min(normalized.Compactness) #we are getting min as 0
np.max(normalized.Compactness) #we are getting max as 1
np.min(normalized.length)#we are getting min as 0
np.max(normalized.length)#we are getting max as 1
# We are getting min and max as 0 and 1 so the normalization we have done is correct.


