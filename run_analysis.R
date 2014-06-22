# Coursera - Getting and Cleaning Data - Course Project
# ej - 062214

# Raw data is available from: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# This script needs to be run in the directory where you extracted the dataset such that "UCI HAR Dataset" is a subdirectory of the working directory
# If you need to first set the working directory, uncomment and set the below line 
#setwd()

#Read in required libraries
cat("Reading libraries\n")
library(data.table)
library(plyr)

# Read in the raw training set
cat("Reading Raw Training DataSet\n")
xtrainraw <- read.table("UCI HAR Dataset/train/X_train.txt")

# Read in the column names from the features file
cat("Reading variables names\n")
columnNames <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors = FALSE)

# Rename the training set columns with the feature names
cat("Renaming columns with variable names\n")
names(xtrainraw) <- c(columnNames$V2)

# Read in the training set observations and rename new column
cat("Adding observation types\n")
xtrainobs <- read.table("UCI HAR Dataset/train/y_train.txt")
xtrain <- cbind(xtrainobs, xtrainraw)
names(xtrain)[1] <- "Activity"

# read in activities and add column for observation friendly name
cat("Adding observation friendly names\n")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activitynames <- c(as.character(activities$V2))
xtrain <- cbind(activitynames[xtrain$Activity], xtrain)
names(xtrain)[1] <- "ActivityName"

# add column for subject
cat("Adding subjects to observations\n")
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainsubjects, xtrain)
names(train)[1] <- "Subject"

## do the same for test set

# read in raw
cat("Reading raw Test DataSet\n")
xtestraw <- read.table("UCI HAR Dataset/test/X_test.txt")

#we already have columnNames from above so just assign them
cat("Renaming columns with variable names\n")
names(xtestraw) <- c(columnNames$V2)

#bring in observations
cat("Adding observation types\n")
xtestobs <- read.table("UCI HAR Dataset/test/y_test.txt")
xtest <- cbind(xtestobs, xtestraw)
names(xtest)[1] <- "Activity"

#activity friendly names, we have activities and activity names from above, add them
cat("Adding observation friendly names\n")
xtest <- cbind(activitynames[xtest$Activity],xtest)
names(xtest)[1] <- "ActivityName"

#add subjects
cat("Adding subjects to observations\n")
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testsubjects,xtest)
names(test)[1] <- "Subject"


## merge them together
cat("Merging train and test DataSets\n")
fulldataset <- rbind(train, test)

## now extract only mean and std variables
## note that we want to keep subject and activity name so bring those in too and we know they are 1 and 2
## the rest we ‘grep’ for
cat("Extract mean and standard deviation variables\n")
variables <- names(fulldataset)
variablelist <- c(1,2,which(variables %like% "-mean()" | variables %like% "-std()"))
fulldatasetMeanAndSTD <- fulldataset[,variablelist]

## build average of each variable for each subject and each activity
cat("Calculating average for each variable for each activity and subject\n")
tidyset <- ddply(fulldatasetMeanAndSTD,.(Subject,ActivityName), numcolwise(mean))
cat("Tidy dataset is available in variable: tidyset\n")

# write out dataset
cat("Writing tidy dataset to: tidydataset.csv")
write.csv(tidyset, "tidydataset.csv")


