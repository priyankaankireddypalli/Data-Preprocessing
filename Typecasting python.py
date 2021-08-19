import pandas as pd
import numpy as np
# To import dataset 
onlineretail = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/OnlineRetail.csv",encoding='windows-1252') 
onlineretail.dtypes # To get the datatype of all the columns
onlineretail.describe() # To get the summary of numerical data
# Problem a to perform type casting operation
# Importing dataset to variable onlineretail1 to perform typecasting
onlineretail1 = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/OnlineRetail.csv",encoding='windows-1252')
# Converting object datatype to category
onlineretail1.InvoiceNo = onlineretail1.InvoiceNo.astype('category') 
onlineretail1.dtypes
# Converting object datatype to category
onlineretail1.StockCode = onlineretail1.StockCode.astype('category') 
onlineretail1.dtypes
# Converting object datatype to category
onlineretail1.Description = onlineretail1.Description.astype('category') 
onlineretail1.dtypes
# Converting object integer to float
onlineretail1.Quantity = onlineretail1.Quantity.astype('float64') 
onlineretail1.dtypes
# Converting object datatype to category
onlineretail1.InvoiceDate = onlineretail1.InvoiceDate.astype('category') 
onlineretail1.dtypes
# Converting float datatype to int64
onlineretail1.UnitPrice = onlineretail1.UnitPrice.astype('int64') 
onlineretail1.dtypes
# Converting float datatype to object
onlineretail1.CustomerID = onlineretail1.CustomerID.astype('object') 
onlineretail1.dtypes
# Converting object datatype to category
onlineretail1.Country = onlineretail1.Country.astype('category') 
onlineretail1.dtypes

# Problem b to check with duplicates and handle with it
# Identify duplicates records in the data
# To check with duplicated values
onlineretail.InvoiceNo.duplicated().sum()  
# To drop the duplicated values
drop1 = onlineretail.InvoiceNo.drop_duplicates() 
# To check with whether we have removed duplicated values
drop1.duplicated().sum() 
# To check with duplicated value
onlineretail.StockCode.duplicated().sum()  
# To drop the duplicated values
drop2 = onlineretail.StockCode.drop_duplicates() 
# To check with whether we have removed duplicated values
drop2.duplicated().sum() 
# To check with duplicated values
onlineretail.Description.duplicated().sum()  
# To drop the duplicated values
drop3 = onlineretail.Description.drop_duplicates() 
# To check with whether we have removed duplicated values
drop3.duplicated().sum()
# To check with duplicated values
onlineretail.Quantity.duplicated().sum()
# To drop the duplicated values  
drop4 = onlineretail.Quantity.drop_duplicates() 
# To check with whether we have removed duplicated values
drop4.duplicated().sum() 
# To check with duplicated values
onlineretail.InvoiceDate.duplicated().sum()
# To drop the duplicated values  
drop5 = onlineretail.InvoiceDate.drop_duplicates() 
# To check with whether we have removed duplicated values
drop5.duplicated().sum() 
# To check with duplicated values
onlineretail.UnitPrice.duplicated().sum()  
# To drop the duplicated values
drop6 = onlineretail.UnitPrice.drop_duplicates() 
# To check with whether we have removed duplicated values
drop6.duplicated().sum()
# To check with duplicated values
onlineretail.CustomerID.duplicated().sum()  
# To drop the duplicated values
drop7 = onlineretail.CustomerID.drop_duplicates() 
# To check with whether we have removed duplicated values
drop7.duplicated().sum() 
# To check with duplicated values
onlineretail.Country.duplicated().sum()  
# To drop the duplicated values
drop8 = onlineretail.Country.drop_duplicates() 
# To check with whether we have removed duplicated values
drop8.duplicated().sum() 

# Problem c to perform EDA on dataset
# To calculate mean of the numerical data
np.mean(onlineretail.Quantity)
np.mean(onlineretail.UnitPrice)
np.mean(onlineretail.CustomerID)
# To calculate median of the numerical data
np.median(onlineretail.Quantity)
np.median(onlineretail.UnitPrice)
np.nanmedian(onlineretail.CustomerID)
# To calculate mode we need to import stats from scipy
import statistics 
statistics.mode(onlineretail.InvoiceNo)
statistics.mode(onlineretail.StockCode)
statistics.mode(onlineretail.Description)
statistics.mode(onlineretail.Quantity)
statistics.mode(onlineretail.InvoiceDate)
statistics.mode(onlineretail.UnitPrice)
statistics.mode(onlineretail.Country)
# To calculate var of the numerical data
np.var(onlineretail.Quantity)
np.var(onlineretail.UnitPrice)
np.var(onlineretail.CustomerID)
# Graphical representation is done only to numerical data
# Plotting Histogram to get the skeweness of the dataset
import matplotlib.pyplot as plt
import seaborn as sns
plt.hist(onlineretail['CustomerID'],color='blue',bins=10)
plt.xlabel('CustomerID')
plt.ylabel('frequency')
plt.title('CustomerID VS frequency') # Histogram is normally skewed
# Boxplot to get the outliers from the dataset
sns.boxplot(onlineretail['CustomerID']) #There are outliers in the dataset
