---
title: "Code Book - Final Assignment"
author: "Siddharth Samant"
date: "4/30/2020"
output: 
  html_document: 
    toc: yes
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```



=======================================================================


## Understanding The Mean and Standard Deviation Variables^1^

The variables in the dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc.XYZ and tGyro.XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc.XYZ and tGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk.XYZ and tBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc.XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation


The following table provides a concise explanation of the terms used in the variables:



Term          | Explanation
------------- | --------------------------------
t             | Time domain signal
f             | Frequency domain signal
X             | Axial signal in the X direction
Y             | Axial signal in the Y direction
Z             | Axial signal in the Z direction
Acc           | Accelerometer
Gyro          | Gyroscope
Body          | Body signal for accelerometer or gyroscope
Gravity       | Gravity signal for accelerometer or gyroscope
Jerk          | Jerk signals derived in time from Body Linear Acceleration and Angular Velocity
Mag           | Magnitude of signals calculated using Euclidean norm
mean          | Mean of the signals
std           | Standard deviation of the signals



## Code Book

The first 4 variables of the final dataset are described below:

* subjectID
    + Integer value between 1 and 30
    
* activityID
    + Integer value between 1 and 6
    
* group
    + Factor Level: testing
    + Factor Level: training
    
* activityName
    + Factor Level: walking while wearing a smartphone on the waist
    + Factor Level: walking upstairs while wearing a smartphone on the waist
    + Factor Level: walking downstairs while wearing a smartphone on the waist
    + Factor Level: sitting while wearing a smartphone on the waist
    + Factor Level: standing while wearing a smartphone on the waist
    + Factor Level: laying while wearing a smartphone on the waist  
    

The next 4 variables are described in the table below:  

First Header  | Second Header
------------- | -------------
tBodyAcc.mean...X  | Bounded and normalised double value between -1 and 1
tBodyAcc.mean...Y  | Bounded and normalised double value between -1 and 1
tBodyAcc.mean...Z  | Bounded and normalised double value between -1 and 1      
tGravityAcc.mean...X  | Bounded and normalised double value between -1 and 1
tGravityAcc.mean...Y  | Bounded and normalised double value between -1 and 1
tGravityAcc.mean...Z  | Bounded and normalised double value between -1 and 1
tBodyAccJerk.mean...X  | Bounded and normalised double value between -1 and 1
tBodyAccJerk.mean...Y  | Bounded and normalised double value between -1 and 1
tBodyAccJerk.mean...Z  | Bounded and normalised double value between -1 and 1
tBodyGyro.mean...X | Bounded and normalised double value between -1 and 1
tBodyGyro.mean...Y | Bounded and normalised double value between -1 and 1
tBodyGyro.mean...Z  | Bounded and normalised double value between -1 and 1
tBodyGyroJerk.mean...X  | Bounded and normalised double value between -1 and 1
tBodyGyroJerk.mean...Y  | Bounded and normalised double value between -1 and 1
tBodyGyroJerk.mean...Z  | Bounded and normalised double value between -1 and 1
tBodyAccMag.mean..  | Bounded and normalised double value between -1 and 1
tGravityAccMag.mean..  | Bounded and normalised double value between -1 and 1
tBodyAccJerkMag.mean.  | Bounded and normalised double value between -1 and 1
tBodyGyroMag.mean..  | Bounded and normalised double value between -1 and 1
tBodyGyroJerkMag.mean..  | Bounded and normalised double value between -1 and 1
fBodyAcc.mean...X  | Bounded and normalised double value between -1 and 1
fBodyAcc.mean...Y  | Bounded and normalised double value between -1 and 1
fBodyAcc.mean...Z  | Bounded and normalised double value between -1 and 1
fBodyAccJerk.mean...X  | Bounded and normalised double value between -1 and 1
fBodyAccJerk.mean...Y  | Bounded and normalised double value between -1 and 1
fBodyAccJerk.mean...Z  | Bounded and normalised double value between -1 and 1
fBodyGyro.mean...X  | Bounded and normalised double value between -1 and 1
fBodyGyro.mean...Y  | Bounded and normalised double value between -1 and 1
fBodyGyro.mean...Z  | Bounded and normalised double value between -1 and 1
fBodyAccMag.mean..  | Bounded and normalised double value between -1 and 1
fBodyBodyAccJerkMag.mean..  | Bounded and normalised double value between -1 and 1
fBodyBodyGyroMag.mean..  | Bounded and normalised double value between -1 and 1
fBodyBodyGyroJerkMag.mean..  | Bounded and normalised double value between -1 and 1
tBodyAcc.std...X  | Bounded and normalised double value between -1 and 1
tBodyAcc.std...Y  | Bounded and normalised double value between -1 and 1
tBodyAcc.std...Z  | Bounded and normalised double value between -1 and 1
tGravityAcc.std...X  | Bounded and normalised double value between -1 and 1
tGravityAcc.std...Y  | Bounded and normalised double value between -1 and 1
tGravityAcc.std...Z  | Bounded and normalised double value between -1 and 1
tBodyAccJerk.std...X  | Bounded and normalised double value between -1 and 1
tBodyAccJerk.std...Y  | Bounded and normalised double value between -1 and 1
tBodyAccJerk.std...Z  | Bounded and normalised double value between -1 and 1
tBodyGyro.std...X  | Bounded and normalised double value between -1 and 1
tBodyGyro.std...Y  | Bounded and normalised double value between -1 and 1
tBodyGyro.std...Z  | Bounded and normalised double value between -1 and 1
tBodyGyroJerk.std...X  | Bounded and normalised double value between -1 and 1
tBodyGyroJerk.std...Y  | Bounded and normalised double value between -1 and 1
tBodyGyroJerk.std...Z  | Bounded and normalised double value between -1 and 1
tBodyAccMag.std..  | Bounded and normalised double value between -1 and 1
tGravityAccMag.std..  | Bounded and normalised double value between -1 and 1
tBodyAccJerkMag.std..  | Bounded and normalised double value between -1 and 1
tBodyGyroMag.std..  | Bounded and normalised double value between -1 and 1
tBodyGyroJerkMag.std..  | Bounded and normalised double value between -1 and 1
fBodyAcc.std...X  | Bounded and normalised double value between -1 and 1
fBodyAcc.std...Y  | Bounded and normalised double value between -1 and 1
fBodyAcc.std...Z  | Bounded and normalised double value between -1 and 1
fBodyAccJerk.std...X  | Bounded and normalised double value between -1 and 1
fBodyAccJerk.std...Y  | Bounded and normalised double value between -1 and 1
fBodyAccJerk.std...Z  | Bounded and normalised double value between -1 and 1
fBodyGyro.std...X  | Bounded and normalised double value between -1 and 1
fBodyGyro.std...Y  | Bounded and normalised double value between -1 and 1
fBodyGyro.std...Z  | Bounded and normalised double value between -1 and 1
fBodyAccMag.std..  | Bounded and normalised double value between -1 and 1
fBodyBodyAccJerkMag.std..  | Bounded and normalised double value between -1 and 1
fBodyBodyGyroMag.std..  | Bounded and normalised double value between -1 and 1
fBodyBodyGyroJerkMag.std..  | Bounded and normalised double value between -1 and 1  

=======================================================================

## Study Design

* The variable names for the Mean and Standard Deviation data are taken from the "features" file (after slight modifications)
* The "activity_labels" file provides the observations under the "activityName" variable (after appropriate labelling)
* The "y_test" and "y_train" files provide the observations under the "activityID" variable
* The "subject_test" and "subject_train" files provide the observations under the "subjectID" variable
* The "group" variable is created in the "x_test" and "y_test" files  


=======================================================================

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.









