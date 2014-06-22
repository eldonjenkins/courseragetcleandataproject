# CodeBook for run_analysis.R

* Original source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The following manipulations of the source training data were made:
* Raw training data was read in from X_train.txt
* The variables were then labeled with the features from features.txt
* A column was added for activity type, read from y_train.txt
* A column was added for ActivityName
  * This column was populated by matching activity type to the type in the file activity_labels.txt and taking the friendly name
* A column was added for subject, read from subject_train.txt

## The following manipulations of the source test data were made:
* Raw test data was read in from X_test.txt
* The variables were labeled with the features from features.txt, read in above
* A column was added for activity type, read from y_test.txt
* A column was added for ActivityName
  * This column was populated by matching activity type to the activities read in above from activity_labels.txt adn taking the friendly name
* A column was added for subject, read in from subject_test.txt

## Combining and Summarizing the data
* The test and training datasets were combined with rbind(train,test)
* Variables representing standard deviation std() and mean mean() were extracted from the set
  * variables <- names(fulldataset)
  * variablelist <- c(1,2,which(variables %like% "-mean()" | variables %like% "-std()"))
    * These variables are identified by standard naming as described in original codebook
    * We also add variables 1 and 2, which are Subject and ActivityName
* These variables were then summarized as the average for each subject for each activity type
  * tidyset <- ddply(fulldatasetMeanAndSTD,.(Subject,ActivityName), numcolwise(mean))
  
## Variables in final tidy data set
  * The following variables are represented in the final tidy dataset
    * Subject         - The subject number of the observation
    * ActivityName    - The name of the activity associated with the observed variables
    * The mean for each below variable for each subject and each activity:
    * tBodyAcc-mean()-X
      * tBodyAcc-mean()-Y
      * tBodyAcc-mean()-Z
      * tBodyAcc-std()-X
      * tBodyAcc-std()-Y
      * tBodyAcc-std()-Z
      * tGravityAcc-mean()-X
      * tGravityAcc-mean()-Y
      * tGravityAcc-mean()-Z
      * tGravityAcc-std()-X
      * tGravityAcc-std()-Y
      * tGravityAcc-std()-Z
      * tBodyAccJerk-mean()-X
      * tBodyAccJerk-mean()-Y
      * tBodyAccJerk-mean()-Z
      * tBodyAccJerk-std()-X
      * tBodyAccJerk-std()-Y
      * tBodyAccJerk-std()-Z
      * tBodyGyro-mean()-X
      * tBodyGyro-mean()-Y
      * tBodyGyro-mean()-Z
      * tBodyGyro-std()-X
      * tBodyGyro-std()-Y
      * tBodyGyro-std()-Z
      * tBodyGyroJerk-mean()-X
      * tBodyGyroJerk-mean()-Y
      * tBodyGyroJerk-mean()-Z
      * tBodyGyroJerk-std()-X
      * tBodyGyroJerk-std()-Y
      * tBodyGyroJerk-std()-Z
      * tBodyAccMag-mean()
      * tBodyAccMag-std()
      * tGravityAccMag-mean()
      * tGravityAccMag-std()
      * tBodyAccJerkMag-mean()
      * tBodyAccJerkMag-std()
      * tBodyGyroMag-mean()
      * tBodyGyroMag-std()
      * tBodyGyroJerkMag-mean()
      * tBodyGyroJerkMag-std()
      * fBodyAcc-mean()-X
      * fBodyAcc-mean()-Y
      * fBodyAcc-mean()-Z
      * fBodyAcc-std()-X
      * fBodyAcc-std()-Y
      * fBodyAcc-std()-Z
      * fBodyAcc-meanFreq()-X
      * fBodyAcc-meanFreq()-Y
      * fBodyAcc-meanFreq()-Z
      * fBodyAccJerk-mean()-X
      * fBodyAccJerk-mean()-Y
      * fBodyAccJerk-mean()-Z
      * fBodyAccJerk-std()-X
      * fBodyAccJerk-std()-Y
      * fBodyAccJerk-std()-Z
      * fBodyAccJerk-meanFreq()-X
      * fBodyAccJerk-meanFreq()-Y
      * fBodyAccJerk-meanFreq()-Z
      * fBodyGyro-mean()-X
      * fBodyGyro-mean()-Y
      * fBodyGyro-mean()-Z
      * fBodyGyro-std()-X
      * fBodyGyro-std()-Y
      * fBodyGyro-std()-Z
      * fBodyGyro-meanFreq()-X
      * fBodyGyro-meanFreq()-Y
      * fBodyGyro-meanFreq()-Z
      * fBodyAccMag-mean()
      * fBodyAccMag-std()
      * fBodyAccMag-meanFreq()
      * fBodyBodyAccJerkMag-mean()
      * fBodyBodyAccJerkMag-std()
      * fBodyBodyAccJerkMag-meanFreq()
      * fBodyBodyGyroMag-mean()
      * fBodyBodyGyroMag-std()
      * fBodyBodyGyroMag-meanFreq()
      * fBodyBodyGyroJerkMag-mean()
      * fBodyBodyGyroJerkMag-std()
      * fBodyBodyGyroJerkMag-meanFreq()
        ** Please note these original descriptions are available in features_info.txt of the original codebook
        ** The original contents of that codebook are available below for reference
        
### Original Codebook
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
