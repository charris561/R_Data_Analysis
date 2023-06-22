#Homework Assignment 2
#Name: Caleb Harris
#Course: CS 2020-001
#Input Files: Auto.csv from canvas
#----------
# Part A: load Auto.csv file in a variable called Auto

#Install dependencies
install.packages("readr")

#Load library
library(readr)

#Set working directory
setwd("C:/dev/r_data_analysis/homework/hw2")

#Load csv input file
Auto = read_csv("Auto.csv")

#   note: file must be in your working directory to use syntax as done above.

# Part B: What is the type and class of the Auto variable

typeof(Auto)
class(Auto)

# Part C: Use a R command/function to find the dimensions of the Auto variable
str(Auto)

#Using the above command, we can see that the dimensions of this matrix are 397 X 9

# Part D: Use an R command to remove all NAs from Auto variable. Redo above steps to see new dimensions of Auto variable.
#   Note: There are no NA values directly in Auto as indicated by the "unique()" commands below for each variable, but there are "?" for horsepower. Changing those to NA and removing them for this step. 

unique(Auto$mpg)

unique(Auto$cylinders)

unique(Auto$displacement)

unique(Auto$horsepower)

unique(Auto$weight)

unique(Auto$acceleration)

unique(Auto$year)

unique(Auto$origin)

unique(Auto$name)
                        
#Change the values for horsepower to NA

Auto$horsepower = ifelse(Auto$horsepower == "?", NA, Auto$horsepower)

#We can now confirm there are NAs rather than "?" and remove them
unique(Auto$horsepower)
Auto = na.omit(Auto)

#For a later step, lets change horespower to be represented as an integer
Auto$horsepower = as.integer(Auto$horsepower)

#We can now see that Auto is 392 X 9 in dimensions
str(Auto)

# Part E: Use an R command to report the names of all variables in Auto
ls(Auto)

# Part F: Use attach() function to be able to directly access fields in Auto variable and then plot the cylinders by mpg. 
attach(Auto)
plot(mpg, cylinders)

# Part G: Convert the “cylinders” field in auto to a factor and use the plot function to generate a plot of cylinders by mpg. Make sure the results are drawn with green color and the y and x axis of the graph has “CYLINDERS” and “MPG” respectively. 
cylinders = factor(cylinders)
str(cylinders)
plot(mpg, cylinders, col = "#00FF00")

# Part H: Draw a histogram of mpg in Auto using green.
hist(mpg, col = "#00FF00")

#   Note: not sure why I am getting 9 bars when the instructions say there should be 10

# Part I: Use the pairs() function in R to generate a plot matrix, consisting of scatterplots for each variable-combination of "mpg", "displacement", "horsepower", "weight", and "acceleration" fields in Auto variable. 
#   Note: Changing the horsepower field to be represented as integers earlier was to enable the pairs function to operate correctly given that it was originally represented as strings due to the "?" value in the data. 

pairs(Auto[c("mpg", "displacement", "horsepower", "weight", "acceleration")])

# Part J: Report Descriptive Statistics for all fields of Auto variable

summary(Auto)