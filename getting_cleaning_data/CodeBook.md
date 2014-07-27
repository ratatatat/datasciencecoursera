##CodeBook describes the variables, data and transformations done to clean-up the data  

###Raw data set
Raw data set comprised test and training sets containing respectively 2947 and 7352 observations. 
Each of the sets contained 561 features. 
Additional variables like subject activity and subject ID's were provided in separate files. 
Data was collected from sensor signals (accelerometer and gyroscope) placed in Samsung Galaxy SII smartphone while being used by 30 subjects.
Data can be used to analyze state of sensor signals during different daily activities.

###Transformations applied to raw data set
* Multiple files with test and training set data for sensors, activities and subjects were merged into one data set.
* Only mean and standard deviation variables for each measurement were retained from the original data set. All others were dropped. As a result data set consists of only 68 features.
* Labels were provided for the subject's activities
* Labels for the variables were added for the data set
* Data was aggregated, mean of the retained measurements was computed grouped by activity and Subject ID.

###Data set on the output 
Aggregated data set was saved to outputData.txt file. File contains a header that describes the variables. 
A SubjectLabel column conveys information on the individual subject that performed the measurement.
Activity variable tells us what kind of behaviour was performed during measurement 
66 columns of mean and standard deviation in 3 dimensions(x,y,z) are provided aggregared for each subject and activity.

Output file can be read back into R by using read.table("outputData.txt",header=T) command

