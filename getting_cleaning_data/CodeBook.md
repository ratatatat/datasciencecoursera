##CodeBook describes the variables, data and transformations done to clean-up the data  

###Raw data set
Raw data set comprised test and training sets containing respectively 2947 and 7352 observations. 
Each of the sets contained 561 features. 
Additional variables like subject activity and subject ID's were provided in separate files. 
Data was collected from sensor signals (accelerometer and gyroscope) placed in Samsung Galaxy SII smartphone while being used by 30 subjects.
Data can be used to analyze state of sensor signals during different daily activities.


###Data set on the output 

Resulting data set contains 180 rows and 68 columns of data.

The below mentioned signals are still part of the resulting data set (
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

But only mean and standard deviation (std) measurements were retained from the original data set.

Features are normalized and bounded within [-1,1] just as it was in the original file.

Aggregated data set was saved to outputData.txt file. File contains a header that describes the variables. 
A SubjectLabel column conveys information on the individual subject that performed the measurement.
Activity variable tells us what kind of behaviour was performed during measurement 
66 columns of mean and standard deviation in 3 dimensions(x,y,z) are provided aggregared for each subject and activity.

Output file can be read back into R by using read.table("outputData.txt",header=T) command

