import numpy as np
import pandas as pd
# Load the dataset
claimants = pd.read_csv('C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/claimants.csv')
# To check for any na values in the dataset
claimants.isna() 
claimants.isna().sum() # To check the total count of na values in each columns
# There are 4 column in which the missing values are there
# We apply mode imputaton method to CLMSEX,CLMINSUR,SEATBELT since all these data are categorical data
# The CLMAGE column data is a ratio data, we check with outliers and decide whether,
# We have to proceed with mean/median imputation method.
# For mean median mode imputation method we need to install Simple Imputer module.
from sklearn.impute import SimpleImputer
# For column CLMSEX applying mode imputation method
modeimputation = SimpleImputer(missing_values=np.nan,strategy='most_frequent') # Defining mode imputation
claimants['CLMSEX'] = pd.DataFrame(modeimputation.fit_transform(claimants[['CLMSEX']])) # Applying mode imputation to CLMSEX
claimants.CLMSEX.isna().sum() # To check with count of na values in column CLMSEX
# For column CLMINSUR applying mode imputation method
claimants['CLMINSUR'] = pd.DataFrame(modeimputation.fit_transform(claimants[['CLMINSUR']])) # Applying mode imputation to CLMINSUR
claimants.CLMINSUR.isna().sum() # To check with count of na values in column CLMINSUR
# For column SEATBELT applying mode imputation method
claimants['SEATBELT'] = pd.DataFrame(modeimputation.fit_transform(claimants[['SEATBELT']])) # Applying mode imputation to SEATBELT
claimants.SEATBELT.isna().sum() # To check with count of na values in column SEATBELT
# For column CLMAGE we have to check with outliers
# To boxplot we need to install sns module and matplotlib.pyplot
import seaborn as sns
import matplotlib.pyplot as plt
sns.boxplot(claimants.CLMAGE);plt.title('BOXPLOT');plt.show()
# There is one outliers in the column CLMAGE so we proceed with median imputation
medianimputation = SimpleImputer(missing_values=np.nan,strategy='median') # To define median imputation
claimants['CLMAGE'] = pd.DataFrame(medianimputation.fit_transform(claimants[['CLMAGE']])) # Applying median imputation to CLMAGE
claimants.CLMAGE.isna().sum() # To check with count of na values in column CLMAGE
# To check the dataset finally whether we have removed the missing values in the dataset
claimants.isna() # To check the column wise missing values
claimants.isna().sum() # To check the total count of na values in each columns
# The output we are getting is false so that means we have successfully imputated the missing values.
