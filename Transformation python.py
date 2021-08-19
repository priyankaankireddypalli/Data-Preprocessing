# Transformation of dataset calories consumed
import numpy as np
import pandas as pd
# To load the dataset
calories_consumed = pd.read_csv('C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/calories_consumed.csv')
calories_consumed.columns
# We have to check with the data whether the data is normal or non-normal,
# If it is a non-normal data we apply Transformations such as sqrt,exp,reciprocal and log and quantile quantile plot to check for whether the is normal or non-normal data.
import scipy.stats as stats
import pylab
stats.probplot(calories_consumed['Weight gained (grams)'],dist="norm",plot=pylab)
# If we observe the graph, we can see that the data is not falling in the interquartile region, so we have to do transformation to the data.
stats.probplot(calories_consumed['Calories Consumed'],dist='norm',plot=pylab)
# If we observe the graph,we can see that the data is falling in the interquartile region and datapoints are falling in a straight line.
# Therefore the data is normal
# Transformation to make weighted.gained.grams. variable as normal
# Applying sqrt transformation and checking whether the data is getting transformed to normal data or not
stats.probplot(np.sqrt(calories_consumed['Weight gained (grams)']),dist='norm',plot=pylab)
# After applying the sqrt transformation the data is still non-normal data. 
# Applying reciprocal transformation and checking whether the data is getting transformed to normal data or not
stats.probplot(1/(calories_consumed['Weight gained (grams)']),dist='norm',plot=pylab)
# After applying the reciprocal transformation the data is transformed to normal data. 
# Applying log transformation and checking whether the data is getting transformed to normal data or not
stats.probplot(np.log(calories_consumed['Weight gained (grams)']),dist='norm',plot=pylab)
# After applying the log transformation the data is transformed to normal data. 
# After applying both the reciprocal and log transformation the data is getting transformed to normal so we can proceed with either reciprocal transormed data or log transormed data.

