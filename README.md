# Getting-and-Cleaning-Data-Course-Project

This repo is zd-l's submission of the Getting and cleaning data course project.

Data collected from the accelerometers from the Samsung Galaxy S smartphone was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Further information about the data used can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Files included in this repo are:
- "Outputdata.txt" is the tidy data set as described in the course project.
- "run_analysis.R" is the R script used to perform the analysis.
- "CodeBook.md" is the CodeBook describing the variables, the data, and any transformations or work that was performed to clean up the data.

"run_analysis.R" performs the following:
    1.Merges the training and the test sets to create one data set.
    2.Extracts only the measurements on the mean and standard deviation for each measurement.
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive variable names.
    5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This repo can be found at: https://github.com/zd-l/Getting-and-Cleaning-Data-Course-Project.