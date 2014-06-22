#Coursera Getting and Cleaning Data Project
## Required Data
This script analyzes data obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Please unzip this data to your working directory before running the script

## Script Overview
run_analysis.R

Running this script will create a tidy data set dataframe called tidyset.
It will also output the same tidy data set to a file called tidydataset.csv.

## Script Details
This script will perform the following manipulations of the source raw data

### Training Data Set
* Read raw measurements from training data set (X_train.txt)
* Rename measurements with the variable names from features.txt
* Add activity types from y_train.txt
* Add activity labels from activity_labels.txt
* Add subjects from subject_train.txt

### Test Data Set
* Read raw measurements from test data set (X_test.txt)
* Rename measurements with variable names from features.txt
* Add activity types from y_test.txt
* Add activity lables from activity_labels.txt
* Add subjects from subject_test.txt

### Create full dataset, extract std() and mean() variables, summarize
* Combine train and test datasets
* Drop all variables except Subject, Activity, std() variables, and mean() variables
* Average all remaining variables for each Subject and ActivityName 
