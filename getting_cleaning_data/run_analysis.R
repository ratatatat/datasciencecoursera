#Coursera's 'Getting and Cleaning data' course project
#Working directory should be set before executing code below (use setwd("directory_of_your_choice") to set it up)

#setting up directories and downloading data
projectURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
outputDir <- getwd()
fileName <- "samsungData.zip"

zipdir <- tempdir()

if (!file.exists(zipdir)) {
  dir.create(zipdir)
}

download.file(projectURL,destfile=paste(zipdir,fileName,sep="\\"))

#list files
unzip(zipfile=paste(zipdir,fileName,sep="\\"),list=T)
#unzip files
unzip(zipfile=paste(zipdir,fileName,sep="\\"),exdir=outputDir)

testSetFolder <- ".\\UCI HAR Dataset\\test\\"
trainingSetFolder <- ".\\UCI HAR Dataset\\train\\"

#reading data
XtestSet <- read.table(paste0(testSetFolder,"X_test.txt"))
YtestSet <- read.table(paste0(testSetFolder,"y_test.txt"))

XtrainingSet <- read.table(paste0(trainingSetFolder,"X_train.txt"))
YtrainingSet <- read.table(paste0(trainingSetFolder,"Y_train.txt"))

featuresNamesFile <- ".\\UCI HAR Dataset\\features.txt"
activityNamesFile <- ".\\UCI HAR Dataset\\activity_labels.txt"

featuresLabels <- read.table(featuresNamesFile)
activityLabels <- read.table(activityNamesFile)

testSubjectLabelFile <- ".\\UCI HAR Dataset\\test\\subject_test.txt"
trainSubjectLabelFile <- ".\\UCI HAR Dataset\\train\\subject_train.txt"

testSubjectLabels <- read.table(paste0(outputDir,testSubjectLabelFile))
trainSubjectLabels <- read.table(paste0(outputDir,trainSubjectLabelFile))


#1. Merges the training and the test sets to create one data set.
dataSet <- rbind(XtestSet,XtrainingSet)


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#already adding column labels ->step 4 of the instruction "Appropriately labels the data set with descriptive variable names. "
colnames(dataSet) <- as.character(featuresLabels[,2])

filteredDataSet <- dataSet[,grep("mean\\(\\)|std\\(\\)",colnames(dataSet))]


#3. Uses descriptive activity names to name the activities in the data set
activitiesSet <- apply(rbind(YtestSet,YtrainingSet),1, function(x) activityLabels[x,2])

filteredDataSet <- cbind(activitiesSet,filteredDataSet)
colnames(filteredDataSet)[1] <- "Activity"

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

#adding subject information
filteredDataSet <- cbind(rbind(testSubjectLabels,trainSubjectLabels),filteredDataSet)
colnames(filteredDataSet)[1] <- "SubjectLabel"
filteredDataSet <- transform(filteredDataSet,SubjectLabel=as.factor(SubjectLabel))

#sorted by activity
summarizedData <- aggregate(. ~ SubjectLabel + Activity,filteredDataSet,mean)
#sorted by subject
summarizedData <- aggregate(. ~ Activity + SubjectLabel,filteredDataSet,mean)

#storing the resulting data frame to outputData.txt file
write.table(summarizedData,"outputData.txt",quote=F,row.names=F)