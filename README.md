# GettingCleaningData
Getting and Cleaning Data Course Project

## Summary

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Usage
1. Download the source data locally.
2. Place the "run_analysis.R" script inside the "UCI HAR Dataset" folder that is created by downloading the source data.
3. The "UCI HAR Dataset" folder should be set as the working directory in order to source the run_analysis.R script. Use: source("run_analysis.R")
+ a. **Note**: The "dplyr" package is used in this script. It will be installed if not available
4. A "summarizedData.csv" file will be created in the working directory that is the end result of steps 1-5 in the Summary section above.

