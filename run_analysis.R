#loads the dplyr package
library(dplyr)
#downloads the file into ./data. Creates this folder if it does not exist
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="./data/dataset.zip", method = "curl")

#unzips the downloaded zip file
unzip("./data/dataset.zip", exdir = "./data")

#assigns all downloaded data files
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","signals"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("class", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$signals)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "class")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$signals)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "class")

#Merges the training and the test sets to create one data set.
allx <- rbind(x_test, x_train)
ally <- rbind(y_test, y_train)
allsubject <- rbind(subject_test, subject_train)
alldata <- cbind(allsubject, ally, allx)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
extracteddata <- select(alldata, subject, class, contains("mean"), contains("std"))

#Uses descriptive activity names to name the activities in the data set
extracteddata$class <- activity_labels[extracteddata$class,"activity"]

#Appropriately labels the data set with descriptive variable names. 
names(extracteddata) <- gsub("class", "Activity", names(extracteddata))
names(extracteddata) <- gsub("^t", "Time", names(extracteddata))
names(extracteddata) <- gsub("^f", "Frequency", names(extracteddata))
names(extracteddata) <- gsub("Acc", "Accelerometer", names(extracteddata))
names(extracteddata) <- gsub("Gyro", "Gyroscope", names(extracteddata))
names(extracteddata) <- gsub("Mag", "Magnitude", names(extracteddata))
names(extracteddata) <- gsub("std", "StandardDeviation", names(extracteddata))
names(extracteddata) <- gsub("Freq", "Frequency", names(extracteddata))
names(extracteddata) <- gsub("mean", "Mean", names(extracteddata))
names(extracteddata) <- gsub("gravity", "Gravity", names(extracteddata))

#From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

groupeddata <- group_by(extracteddata, subject, Activity)
finaldata<- summarise_all(groupeddata, funs(mean))

write.table(finaldata,"Outputdata.txt", row.name=FALSE)


