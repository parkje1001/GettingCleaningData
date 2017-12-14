# Code Book

## Source Data
Description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Details on Source Data
The "README.txt" file in the downloaded data provides details on the experiment parameters, data collection techiniques, and descriptions of the data files provided.

The "features_info.txt" file in the downloaded data provides details of the features in the data set and the variables that were estimated for each feature.

## Data Files
The data files that are used in the run_analysis.R script are:
* activity_labels.txt
* features.txt
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

## Analysis
The run_analysis.R script accomplishes the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output is a "summarizedData.csv" file, containing the average values by subject and activity grouping for every mean and std deviation measurement in the original train and test data.

## Analysis Details
Load all of the data files, then rename columns in specific resulting dataframes so data can be merged together into one data set. 
* activity_Labels: The columns in the activity_labels.txt file are renamed to "activityId" and "activityLabel".
* test_subject: The subject_... files have the column renamed to "subjectId".
* testX, trainX: The X_... files have their columns renamed to the values found in the second column of the features.txt file.
* testY, trainY: The y_... files have the column renamed to "activityId" to allow for merging with the data from the activity_Labels dataframe.

* testData: The data files from the test set are column-binded together
* trainData: The data files from the train set are column-binded together
* dataAllFeatures: The combined test and train dataframes are row-binded together into one dataframe. Input dataframes have same dimensions and have same column names and orders. Data for all features are included in this dataframe.

* finalData: Dataframe containing metadata columns, only the mean() and std() feature columns. Mean and Std feature columns are  identified by having the text "-mean()" or "-std()" in the column name. activity_Labels dataframe is merged into this dataframe using the "activityId" column to make the join. The column for activityId is then removed, leaving a dataframe with only the desired columns and all rows.

* groupedData: Dataframe is grouped (using dplyr package) by activityLabel and subjectId
* summarizedData: Mean is taken against the grouped dataframe, with NA's being removed. This is the dataframe that is written into the "summarizedData.csv" file as the output tidy data set.
