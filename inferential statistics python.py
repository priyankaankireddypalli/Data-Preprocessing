import pandas as pd
import numpy as np
# Importing the dataset 
inf = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/Q7.csv") 
inf.columns # To get the column names
# In this given dataset we cannot calculate mean,meadan,variance and sd for the first column
# T
np.mean(inf.Points) # To calculate mean of Points column
np.mean(inf.Score) # To calculate mean of Score column
np.mean(inf.Weigh) # To calculate mean of Weigh column
# To calculate median for the given dataset
np.median(inf.Points) # To calculate median of Points column
np.median(inf.Score) # To calculate median of Score column
np.median(inf.Weigh) # To calculate median of Weigh column
# To calculate mode we need to import stats from scipy
from scipy import stats 
# To calculate mode for the given dataset
stats.mode(inf.Points) # To calculate mode of Points column
stats.mode(inf.Score) # To calculate mode of Score column
stats.mode(inf.Weigh) # To calculate mode of Weigh column
stats.mode(inf['Unnamed: 0']) # To calculate mode of X column
# Since no value is repeating in the first column it gave the first character in alphabetical order
# To calculate variance for the given dataset
np.var(inf.Points) # To calculate variance of Points column
np.var(inf.Score) # To calculate variance of Score column
np.var(inf.Weigh) # To calculate variance of Weigh column
# To calculate standard deviation for the given dataset
np.std(inf.Points) # To calculate standard deviation of points column
np.std(inf.Score) # To calculate standard deviation of Score column
np.std(inf.Weigh) # To calculate standard deviation of Weigh column
# To calculate standard deviation for the given dataset
rangepoints = max(inf.Points)-min(inf.Points) # To calculate range of points column
rangepoints
rangescore = max(inf.Score)-min(inf.Score) # To calculate range of Score column
rangescore
rangeweigh = max(inf.Weigh)-min(inf.Weigh) # To calculate range of Weigh column
rangeweigh
# To draw inference from the dataset we need to visualize it
# Plotting Histogram to get the skeweness of the dataset
import matplotlib.pyplot as plt
import seaborn as sns
plt.hist(inf['Points'],color='blue',bins=10)
plt.xlabel('Points')
plt.ylabel('frequency')
plt.title('Points VS frequency') # Histogram of Points is normally skewed
plt.hist(inf['Score'],color='blue',bins=10)
plt.xlabel('Score')
plt.ylabel('frequency')
plt.title('Score VS frequency') # Histogram of Score is positively skewed
plt.hist(inf['Weigh'],color='blue',bins=10)
plt.xlabel('Weigh')
plt.ylabel('frequency')
plt.title('Weigh VS frequency') # Histogram of Weigh is positively skewed
# Plotting Boxplot to get the outliers from the dataset
plt.boxplot(inf['Points'],vert=False)
plt.xlabel('Points')
plt.ylabel('frequency')
plt.title('Points VS frequency') # There are no outliers in the dataset
plt.boxplot(inf['Score'],vert=False)
plt.xlabel('Score')
plt.ylabel('frequency')
plt.title('Score VS frequency') # There are outliers in the Score dataset
plt.boxplot(inf['Weigh'],vert=False)
plt.xlabel('Weigh')
plt.ylabel('frequency')
plt.title('Weigh VS frequency') # There are outliers in the Weigh dataset
# There are outliers in the dataset we have to deal with them winsorization or trimming method.
# Problem on inferential statistics of Q7 dataset
infstat = pd.read_excel("C:/Users/rammo/Downloads/DPP/datasets/inferential_statistics.xls")
infstat.columns
infstat.isna().sum() # To check if there are any na values in the dataset
# In the given dataset we cannot calculate mean,median,var,sd and range for the 1st column
# To calculate mean for the given dataset
np.mean(infstat['measure X']) # To calculate mean of measure X column
# To calculate median for the given dataset
np.median(infstat['measure X']) # To calculate median of measure X column
# To calculate mode we need to import stats from scipy
from scipy import stats 
stats.mode(infstat['measure X']) # To calculate mode of measure X column
stats.mode(infstat['Name of the company']) # To calculate mode of X column
# Since no value is repeating in the first column it gave the first character in alphabetical order
# To calculate variance for the given dataset
np.var(infstat['measure X']) # To calculate variance of measure X column
# To calculate standard deviation for the given dataset
np.std(infstat['measure X']) # To calculate standard deviation of measure X column
# To calculate standard deviation for the given dataset
rangemeas = max(infstat['measure X'])-min(infstat['measure X']) # To calculate range of measure X column
rangemeas
# To draw inference from the dataset we need to visualize it
# Plotting histogram
plt.hist(infstat['measure X'],color='blue',bins=10)
plt.xlabel('measure X')
plt.ylabel('frequency')
plt.title('measure X VS frequency') # histogram of measure X is positively skewed
# Boxplot to get the outliers from the dataset
plt.boxplot(infstat['measure X'],vert=False)
plt.xlabel('measure X')
plt.ylabel('frequency')
plt.title('measure X VS frequency') # There are outliers in the measure X dataset
# There are outliers in the dataset we have to deal with them winsorization or trimming method.


