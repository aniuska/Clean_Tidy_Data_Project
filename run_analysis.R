#1) Merges the training and the test sets to create one data set.
#Reading datasets
x_train <- read.table("train/X_train.txt",header = FALSE) 
x_test <- read.table("test/X_test.txt",header = FALSE)

y_train <- read.table("train/y_train.txt",header = FALSE) 
y_test <- read.table("test/y_test.txt",header = FALSE) 

subject_train <- read.table("train/subject_train.txt",header = FALSE)
subject_test <- read.table("test/subject_test.txt",header = FALSE)

features<-read.table('features.txt',header = FALSE,stringsAsFactors=FALSE) 
act_labels <- read.table('activity_labels.txt',header = FALSE)

#datasets union by row
data_values<-rbind(x_train,x_test)
data_activities<-rbind(y_train,y_test)
data_subject<-rbind(subject_train,subject_test)

#naming columns of datasets
names(data_activities)<-c("Activity")
names(data_subject)<-c("Subject")
names(data_values)<-features[,2] #features as columns name for data values

#2) Extracts only the measurements on the mean and standard deviation for each measurement. 
data_subset<-data_values[,grep("mean|std",features[,2])]

#3) Uses descriptive activity names to name the activities in the data set
#Replacing actividy Id with activity name
data_activities[,1] = act_labels[data_activities[,1], 2]

#Adding activities and subject to data
data<-cbind(data_subset,data_activities,data_subject)

#4) Appropriately labels the data set with descriptive variable names.
#Word starts with t is repleced with Time in the column name
#Word starts with f is repleced with Frequency in the column name
#Word Acc is repleced with Accelerometer in the column 
#Word Gyro is repleced with Gyroscope in the column name
#Word Mag is repleced with Magnitude in the column name
#Word BodyBody is repleced with Body in the column name
#Remove () on mean, std and meanFreq in the column name

names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<- gsub("-?mean[(][)]-?",replacement="Mean",names(data))
names(data)<- gsub("-?std[()][)]-?",replacement="Std",names(data))
names(data)<- gsub("-?meanFreq[()][)]-?",replacement="MeanFreq",names(data))

#5) From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
library(plyr)
#Calculating mean for activity and subject 
data_avg<-aggregate(. ~ Activity + Subject, data, mean)

#Saving cleaned dataset to a file
write.table(data_avg, file = "cleaned_data.txt",row.name=FALSE)
