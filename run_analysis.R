

###Installing and Loading the "tidyverse" set of packages, plus "stringr", and "lubridate" packages

#install.packages("tidyverse") #Remove "#" if not already installed
library(tidyverse)
#install.packages("stringr") #Remove "#" if not already installed
library(stringr)
#install.packages("lubridate") #Remove "#" if not already installed
library(lubridate)



###Downloading the zip file, and initial working on the files inside the zipfile

#Downloading the zip file and unzipping the contents in my working directory
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = "UCI_HAR.zip")
unzip("UCI_HAR.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)



#Reading the FEATURES file
features <- read_delim("./UCI HAR Dataset/features.txt", delim = " ",
                       col_names = FALSE)
#Adding suitable column names
colnames(features) <- c("featureID", "featureName")
#Making the observations of variable "featureName" unique, since there are some repeating observations
features$featureName <- make.names(features$featureName, unique = TRUE) #***STEP 4***#



#Reading the ACTIVITY_LABELS file
activity_labels <- read_delim("./UCI HAR Dataset/activity_labels.txt", delim = " ",
                       col_names = FALSE)
#Adding suitable column names
colnames(activity_labels) <- c("activityID", "activityName")
#Changing the observations in "activityName" variable to a fixed format
activity_labels$activityName <- tolower(activity_labels$activityName)
activity_labels$activityName <- sub("_u"," u", activity_labels$activityName)
activity_labels$activityName <- sub("_d"," d", activity_labels$activityName)
activity_labels$activityName <- sub("$"," while wearing a smartphone on the waist", 
                                    activity_labels$activityName) #***STEP 3 P1***#



#Reading the X_TEST file
x_test <- read_delim("./UCI HAR Dataset/test/X_test.txt", delim = " ",
           col_names = FALSE)
#Removing white spaces
x_test <- apply(x_test, 2, str_trim)
x_test <- as.data.frame(x_test)
#Using "apply" function to change variable type from Character to Double
x_test <- apply(x_test, 2, as.double)
x_test <- as.data.frame(x_test)
#Changing colNames of all variables to match the features that they are capturing 
colnames(x_test) <- features$featureName #***STEP 3 P2***#



#Reading the Y_TEST file
y_test <- read_delim("./UCI HAR Dataset/test/y_test.txt", delim = " ",
                     col_names = FALSE)
#Adding a column name to Y_TEST
colnames(y_test) <- c("activityID")
#Merging Y_TEST with ACTIVITY_LABELS to add "activityName" variable to Y_TEST 
y_test <- y_test %>%
   left_join(activity_labels, by = "activityID")



#Reading the SUBJECT_TEST file
subject_test <- read_delim("./UCI HAR Dataset/test/subject_test.txt", delim = " ",
                     col_names = FALSE)
colnames(subject_test) <- c("subjectID")



#Reading the X_TRAIN file
x_train <- read_delim("./UCI HAR Dataset/train/X_train.txt", delim = " ",
                     col_names = FALSE)
#Removing white spaces
x_train <- apply(x_train, 2, str_trim)
x_train <- as.data.frame(x_train)
#Using "apply" function to change variable type from Character to Double
x_train <- apply(x_train, 2, as.double)
x_train <- as.data.frame(x_train)
#Changing colNames of all variables to match the features that they are capturing 
colnames(x_train) <- features$featureName #***STEP 3 P3***#



#Reading the Y_TRAIN file
y_train <- read_delim("./UCI HAR Dataset/train/y_train.txt", delim = " ",
                     col_names = FALSE)
colnames(y_train) <- c("activityID")
#Merging Y_TRAIN with ACTIVITY_LABELS to add "activityName" variable to Y_TRAIN
y_train <- y_train %>%
   left_join(activity_labels, by = "activityID")



#Reading the SUBJECT_TRAIN file
subject_train <- read_delim("./UCI HAR Dataset/train/subject_train.txt", delim = " ",
                           col_names = FALSE)
colnames(subject_train) <- c("subjectID")



###Computations on X_TEST

#Removing !(mean) & !(standard deviation) columns from X_TEST and X_TRAIN
x_test <- x_test %>%
   select(contains (".mean.") | contains ("std")) #***STEP 2 P1***#
#Adding Y_TEST to X_TEST
x_test <- cbind(y_test, x_test)
#Adding SUBJECT_TEST to X_TEST
x_test <- cbind(subject_test, x_test)
#Adding "group" identifier on X_TEST
x_test$group <- "testing"
#Reordering variables so that "group" comes first
x_test <- x_test[,c(70, 1:69)]



###Computations on X_TRAIN

#Removing !(mean) & !(standard deviation) columns from X_TEST and X_TRAIN
x_train <- x_train %>%
   select(contains (".mean.") | contains ("std")) #***STEP 2 P2***#
#Adding Y_TRAIN to X_TRAIN
x_train <- cbind(y_train, x_train)
#Adding SUBJECT_TRAIN to X_TRAIN
x_train <- cbind(subject_train, x_train)
#Adding "group" identifier on X_TRAIN
x_train$group <- "training"
#Reordering variables so that "group" comes first
x_train <- x_train[,c(70, 1:69)]



###Combining X_TEST and X_TRAIN

#Creating the new dataset SMARTPHONERECORDS
smartphone_records <- rbind(x_test, x_train) #***STEP 1***#
#Arranging SMARTPHONERECORDS by variable "subjectID" followed by "activityID"
smartphone_records <- smartphone_records %>%
   arrange(subjectID, activityID)



###Making the final dataset

#Creating the new dataset SMARTPHONERECORDSAVERAGE
smartphone_records_average <- smartphone_records %>%
   group_by(subjectID, activityID, group, activityName) %>%
   summarise_all(funs(mean), na.rm = TRUE) #***STEP 5***#

#Writing the final dataset into my working directory
write_csv(smartphone_records_average, "Smartphone Records Average.csv")
write.table(smartphone_records_average, "Smartphone Records Average.txt", 
            row.names = FALSE, sep = " ")


###Appendix: In case you want to read the saved file SMARTPHONERECORDSAVERAGE, run the below code
#sraNew <- read.table("Smartphone Records Average.txt", sep = " ", header = TRUE)
#view(sraNew)


