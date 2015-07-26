# Codebook

Code Book
========

Raw data collection
-------------------

### Collection

Raw data are obtained from UCI Machine Learning repository. In particular we used
the *Human Activity Recognition Using Smartphones Data Set* 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

These raw data sets are processed with __run_analisys.R__ script to create a tidy data
set.

### Merge training and test sets
1) Read data 
* Read training and test data sets from X_train.txt and X_test.txt (features values),  
* Read activities performanced for training and test sets from y_train.txt and y_test.txt  
* Read subjects that performanced activities from subject_train.txt (for training set) and subject_test.txt (for test set)  
* Read features labels from features.txt  
* Read activities labels from activity_labels.txt  

2) Append rows of data sets
* Join training and test data (X_train.txt and X_test.txt) - data_values  
* Join activities performanced (y_train.txt and y_test.txt) - data_activities 
* Join subjects that performanced activities (subject_train.txt and subject_test.txt) 
 - data_subject  

3) Rename column names 
* Use features label as column names of data values    
* Give Activity as column name of activities    
* Give Subject as column name of subjects    

### Extract mean and standard deviation variables
Create a subset extracting all columns that their name contain the word "mean" or "std" from the merged data.

### Use descriptive activity names
The activity id is changed for activity name . Activity id column is used to look up activity name in activity_labels.txt.  

Adding activities and subject to the data (data_values) as new columns to obtain a complete data set

### Label variables appropriately

Labels given from the original collectors were changed:  
* to obtain more descriptive labels  
* to obtain valid R names without parentheses 

Changes:  
* Word starts with t is repleced with Time in the column name  
* Word starts with f is repleced with Frequency in the column name   
* Word Acc is repleced with Accelerometer in the column     
* Word Gyro is repleced with Gyroscope in the column name    
* Word Mag is repleced with Magnitude in the column name  
* Word BodyBody is repleced with Body in the column name    
* Remove () on mean, std and meanFreq in the column name  

### Create a tidy data set

From the intermediate data set, a final tidy data set is created with the average of each variable for each activity and each subject. The new tidy data set contains 10299 observations with 81 variables. The data is stored in the file `Clean_data.txt`.
