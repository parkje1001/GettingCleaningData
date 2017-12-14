## The run_analysis.R script should be placed inside the UCI HAR Dataset folder that is
## created by downloading the source data.

## The UCI HAR Dataset folder should be set as the working directory in order to source the
## run_analysis.R script. Use: source("run_analysis.R")

## Note: the dplyr package is used in this script. It will be installed if not available
if (!require("dplyr")) {
  install.packages("dplyr")
}
## Load the dplyr package so grouping and summarizing can be used
library(dplyr)

## Read in features data
features <- read.table("features.txt")
## Read in activity labels data and rename columns
activity_Labels <- read.table("activity_labels.txt")
colnames(activity_Labels)<-c("activityId","activityLabel")

## Read in data from "test" subfolder and give columns consistent names for rowbinding later
test_subject <- read.table("test/subject_test.txt")
colnames(test_subject) <- "subjectId"
testX <- read.table("test/X_test.txt")
colnames(testX) <- features[,2] # apply names from second column of features dataframe
testY <- read.table("test/y_test.txt")
colnames(testY) <- "activityId"
## Bind together test data into one dataframe
testData <- cbind(testY,test_subject,testX)


## Read in data from "training" subfolder and give columns consistent names for rowbinding later
train_subject <- read.table("train/subject_train.txt")
colnames(train_subject) <- "subjectId"
trainX <- read.table("train/X_train.txt")
colnames(trainX) <- features[,2] # apply names from second column of features dataframe
trainY <- read.table("train/y_train.txt")
colnames(trainY) <- "activityId"
## Bind together training data into one dataframe in same column order as testData dataframe
trainData <- cbind(trainY,train_subject,trainX)


## Add rows from test and training dataframes together (dataframes have same dimensions and have same column names and orders)
dataAllFeatures <- rbind(trainData,testData)

## Create character vector of column names to be able to search feature columns for specific text pattens
dataColNames <- colnames(dataAllFeatures)

## Create dataframe containing metadata columns, only the mean() and std() feature columns
finalData <- dataAllFeatures[,grepl("-mean\\(\\)|-std\\(\\)|subject|activityId",dataColNames)]

## Merge in activity_Labels data frame
finalData <- merge(activity_Labels,finalData,by = "activityId")
finalData <- finalData[,-1] # Remove first column (activityId) since activityLabel is a more intuitive column


## Group the finalData by activityId and subjectId
groupedData <- group_by(finalData, activityLabel, subjectId)

## Take the mean of the data in the grouped dataframe
summarizedData <- summarize_all(groupedData, funs(mean(., na.rm=TRUE)))


## Write the summarized data to a CSV and Text file in the working directory
write.csv(summarizedData, file = "summarizedData.csv", row.names = FALSE)
write.table(summarizedData, file = "summarizedData.txt", row.names = FALSE)

## Write to the console to alert the user that the summarized data is available
print("Summarized data is available in the summaryData.csv and summaryData.txt files in the working directory")
