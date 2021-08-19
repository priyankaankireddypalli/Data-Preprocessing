import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
df = pd.read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/DataSets/boston_data.csv") #to import dataset from external source
df.dtypes # To check type of dataset in each column
df.isna().sum() # To check na values existing in dataset
# To find the outliers in crim column
sns.boxplot(df.crim);plt.title('Boxplot');plt.show()
# Detection of outliers 
IQR1 = df['crim'].quantile(0.75) - df['crim'].quantile(0.25)
lower_limit1 = df['crim'].quantile(0.25) - (IQR1 * 1.5)
lower_limit1
upper_limit1 = df['crim'].quantile(0.75) + (IQR1 * 1.5)
upper_limit1
# let's flag the outliers in the data set
outliers_df1 = np.where(df['crim'] > upper_limit1, True, np.where(df['crim'] < lower_limit1, True, False))
outliers_df1
# Manually replacing the  outliers value by maximum and minimum value
df['df_replaced1']= pd.DataFrame(np.where(df['crim'] > upper_limit1, upper_limit1, np.where(df['crim'] < lower_limit1, lower_limit1, df['crim'])))
sns.boxplot(df.df_replaced1);plt.title('Boxplot');plt.show()
# To find the outliers in zn column
sns.boxplot(df.zn);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for zn based on IQR)
IQR2 = df['zn'].quantile(0.75) - df['zn'].quantile(0.25)
lower_limit2 = df['zn'].quantile(0.25) - (IQR2 * 1.5)
lower_limit2
upper_limit2 = df['zn'].quantile(0.75) + (IQR2 * 1.5)
upper_limit2
# let's flag the outliers in the data set
outliers_df2=np.where(df['zn']>upper_limit2,True, np.where(df['zn']<lower_limit2,True,False))
outliers_df2
#we will manually replace the  outliers value by maximum and minimum value
df['df_replaced2']= pd.DataFrame(np.where(df['zn'] > upper_limit2, upper_limit2, np.where(df['zn'] < lower_limit2, lower_limit2, df['zn'])))
sns.boxplot(df.df_replaced2);plt.title('Boxplot');plt.show()
# To find the outliers in indus column
sns.boxplot(df.indus);plt.title('Boxplot');plt.show()
# There are no outliers in indus column
# The column chas has categorical data so we ignored it 
# To find outliers in nox column
sns.boxplot(df.nox);plt.title('Boxplot');plt.show()
# There are no outliers in the nox column
# To find the outliers in the rm column
sns.boxplot(df.rm);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for rm based on IQR)
IQR3=df['rm'].quantile(0.75)-df['rm'].quantile(0.25)
IQR3
lower_limit3=df['rm'].quantile(0.25)-(IQR3*1.5)
lower_limit3
upper_limit3=df['rm'].quantile(0.75)+(IQR3*1.5)
upper_limit3
# let's flag the outliers in the data set
outliers_df3=np.where(df['rm']>upper_limit3,True,np.where(df['rm']<lower_limit3,True,False))
outliers_df3
#we will manually replace the  outliers value by maximum and minimum value
df['df_replaced3']=pd.DataFrame(np.where(df['rm']>upper_limit3,upper_limit3, np.where(df['rm']<lower_limit3,lower_limit3,df['rm'])))
sns.boxplot(df.df_replaced3);plt.title('Boxplot');plt.show()
# To find the outliers in the age column
sns.boxplot(df.age);plt.title('Boxplot');plt.show()
# There are no outliers in the age column
# To find the outliers in the dis column
sns.boxplot(df.dis);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for dis based on IQR)
IQR4=df['dis'].quantile(0.75)-df['dis'].quantile(0.25)
IQR4
lower_limit4=df['dis'].quantile(0.25)-(IQR4*1.5)
lower_limit4
upper_limit4=df['dis'].quantile(0.75)+(IQR4*1.5)
upper_limit4
# let's flag the outliers in the data set
outliers_df4=np.where(df['dis']>upper_limit4,True,np.where(df['dis']<lower_limit4,True,False))
outliers_df4
# we will manually replace the  outliers value by maximum and minimum value
df['df_replaced4']=pd.DataFrame(np.where(df['dis']>upper_limit4,upper_limit4, np.where(df['dis']<lower_limit4,lower_limit4,df['dis'])))
sns.boxplot(df.df_replaced4);plt.title('Boxplot'),plt.show()
# To find the outliers in the rad column
sns.boxplot(df.rad);plt.title('Boxplot');plt.show()
# There are no outliers in rad column
# To find the outliers in the tax column
sns.boxplot(df.tax);plt.title('Boxplot');plt.show()
# There are no outliers in tax column
# To find the outliers in the ptratio column
sns.boxplot(df.ptratio);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for ptratio based on IQR)
IQR5=df['ptratio'].quantile(0.75)-df['ptratio'].quantile(0.25)
IQR5
lower_limit5=df['ptratio'].quantile(0.25)-(IQR5*1.5)
lower_limit5
upper_limit5=df['ptratio'].quantile(0.75)+(IQR5*1.5)
upper_limit5
# let's flag the outliers in the data set
outliers_df5=np.where(df['ptratio']>upper_limit5,True,np.where(df['ptratio']<lower_limit5,True,False))
outliers_df5
#we will manually replace the  outliers value by maximum and minimum value
df["df_replaced5"]=pd.DataFrame(np.where(df['ptratio']>upper_limit5,upper_limit5,np.where(df['ptratio']<lower_limit5,lower_limit5,df['ptratio'])))
sns.boxplot(df.df_replaced5);plt.title('Boxplot');plt.show()
# To find the outliers in the black column
sns.boxplot(df.black);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for black based on IQR)
IQR6=df['black'].quantile(0.75)-df['black'].quantile(0.25)
IQR6
lower_limit6=df['black'].quantile(0.25)-(IQR6*1.5)
lower_limit6
upper_limit6=df['black'].quantile(0.75)+(IQR6*1.5)
upper_limit6
# let's flag the outliers in the data set
outliers_df6=np.where(df['black']>upper_limit6,True,np.where(df['black']<lower_limit6,True,False))
outliers_df6
# we will manually replace the  outliers value by maximum and minimum value
df["df_replaced6"]=pd.DataFrame(np.where(df['black']>upper_limit6,upper_limit6,np.where(df['black']<lower_limit6,lower_limit6,df['black'])))
sns.boxplot(df.df_replaced6);plt.title('Boxplot');plt.show()
# To find the outliers in the lstat column
sns.boxplot(df.lstat);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for lstat based on IQR)
IQR7=df['lstat'].quantile(0.75)-df['lstat'].quantile(0.25)
IQR7
lower_limit7=df['lstat'].quantile(0.25)-(IQR7*1.5)
lower_limit7
upper_limit7=df['lstat'].quantile(0.75)+(IQR7*1.5)
upper_limit7
# let's flag the outliers in the data set
outliers_df7=np.where(df['lstat']>upper_limit7,True,np.where(df['lstat']<lower_limit7,True,False))
outliers_df7
# we will manually replace the  outliers value by maximum and minimum value
df['df_replaced7']=pd.DataFrame(np.where(df['lstat']>upper_limit7,upper_limit7,np.where(df['lstat']<lower_limit7,lower_limit7,df['lstat'])))
sns.boxplot(df.df_replaced7);plt.title('Boxplot');plt.show()
# To find the outliers in the medv column
sns.boxplot(df.medv);plt.title('Boxplot');plt.show()
# Detection of outliers (find limits for ptratio based on IQR)
IQR8=df['medv'].quantile(0.75)-df['medv'].quantile(0.25)
IQR8
lower_limit8=df['medv'].quantile(0.25)-(IQR8*1.5)
lower_limit8
upper_limit8=df['medv'].quantile(0.75)+(IQR8*1.5)
upper_limit8
# let's flag the outliers in the data set
outliers_df8=np.where(df['medv']>upper_limit8,True,np.where(df['medv']<lower_limit8,True,False))
outliers_df8
# we will manually replace the  outliers value by maximum and minimum value
df['df_replaced8']=pd.DataFrame(np.where(df['medv']>upper_limit8,upper_limit8,np.where(df['medv']<lower_limit8,lower_limit8,df['medv'])))
sns.boxplot(df.df_replaced8);plt.title('Boxplot');plt.show()




