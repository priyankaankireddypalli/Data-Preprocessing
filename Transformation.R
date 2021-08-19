library(readr)
calories_consumed <- read_csv("C:/Users/WIN10/Desktop/LEARNING/DS/DPP/datasets/calories_consumed.csv")
View(calories_consumed)
attach(calories_consumed) # By attaching file there is no need to call it using $ operator every time
# We have to check with the data whether the data is normal or non-normal
# If it is a non-normal data we apply Transformations such as sqrt,exp,reciprocal and log
# Normal Quantile-Quantile Plot
qqnorm(`Weight gained (grams)`)
qqline(`Weight gained (grams)`)
# The data column weight gained is non normal data, if we observe the graph, we can see that the data is not falling in the interquartile region 
#and taking a exponential curve, so we have to do transformation to the data.
qqnorm(`Calories Consumed`)
qqline(`Calories Consumed`)
# The data calories consumed is normal data, if we observe the graph, we can see that the data is falling in the interquartile region and datapoints 
# falling in a straight line.
# Transformation to make 'weighted gained(grams)' variable as normal
# Applying sqrt transformation and checking whether the data is getting transformed to normal data or not
qqnorm(sqrt(`Weight gained (grams)`))
qqline(sqrt(`Weight gained (grams)`))
# After applying the sqrt transformation the data is still non-normal data. 
# Applying reciprocal transformation and checking whether the data is getting transformed to normal data or not
qqnorm(1/(`Weight gained (grams)`))
qqline(1/(`Weight gained (grams)`))
# After applying the reciprocal transformation the data is transformed to normal data. 
# Applying log transformation and checking whether the data is getting transformed to normal data or not
qqnorm(log(`Weight gained (grams)`))
qqline(log(`Weight gained (grams)`))
# After applying the log transformation the data is transformed to normal data. 
# After applying both the reciprocal and log transformation the data is getting transformed to normal, 
# so we can proceed with either reciprocal transormed data or log transormed data.



