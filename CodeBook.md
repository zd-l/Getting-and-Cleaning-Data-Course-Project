# Getting-and-Cleaning-Data-Course-Project CodeBook

The run_analysis.R code executes the following functions as specified in the Course Project guidelines:

##0.Prepares the data
dplyr package is loaded.
Data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
Data is unzipped
Each ".txt" text file is read using the read.table command, and assigned to a variable corresponding to the file name of the ".txt" file.

##1.Merges the training and the test sets to create one data set.
allx is created by merging x_test and x_train datasets using rbind.
ally is created by merging y_test and y_train datasets using rbind.
allsubject is created by merging subject_test and subject_train datasets using rbind.
allsubject, ally, allx are combined into one file named alldata using cbind.

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
The following columns are selected using the select function from alldata: subject, class, and all measuremenets containing "mean" and "std".
This is stored in the variable extracteddata.

##3.Uses descriptive activity names to name the activities in the data set
The class codes of extracteddata are replaced with their corresponding labels in accordance with the activity_labels variable.

##4.Appropriately labels the data set with descriptive variable names.
Various columns are renamed to human readable names:
- class is replaced with Activity
- if a variable starts with t, it is replaced with Time.
- if a variable starts with f, it is replaced with Frequency.
- Acc is replaced with Accelerometer and Gyro with Gyroscope.
- Mag is replaced with Magnitude, std with StandardDeviation, Freq with Frequency, mean with Mean, and gravity with Gravity.

##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
extracteddata is grouped by subject, then within each subject data is further grouped by activity, using the group_by function from the dplyr package.
means of each column are obtained using the summarise_all function.
Final output data is obtained using the write.table command as "Outputdata.txt"