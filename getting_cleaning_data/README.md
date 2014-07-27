##Readme for Coursera's 'Getting and Cleaning data' course project.

###Files in current repository
* run_analysis.R - script containing R code transforming used raw data set into tidy data set
* README.md - current file
* CodeBook.md - description  of variables, data and information on how the resulting tidy data set was obtained

###R Script 
Transforms the raw data set, merges multiple files and summarizes selected variables.

###Data Set used
As an input a "Human Activity Recognition Using Smartphones Data Set" was used. It is fetched from UC Irvine Machine Learning Repository.
Details on the data set can be obtained at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###R Script usage
Open and execute the script in R or RStudio

###Transformations applied to raw data set by run_analysis.R script
* Multiple files with test and training set data for sensors, activities and subjects were merged into one data set.
* Only mean and standard deviation variables for each measurement were retained from the original data set. All others were dropped. As a result data set consists of only 68 features.
* Labels were provided for the subject's activities
* Labels for the variables were added for the data set
* Data was aggregated, mean of the retained measurements was computed grouped by activity and Subject ID.

###Assumptions
Working directory is already set by user, before executing the script.
