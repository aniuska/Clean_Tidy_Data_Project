# Readme

Getting and Cleaning Data Course Project
========================================

## Project Description
The purpose of this project is to prepare a tidy data set, from several untidy data sets, that can be used for later analysis. 

The R script run_analysis.R does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data used for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## What you find in this repository

This repo contains:

1. Tidy data set __cleaned_data.txt__
2. R script __run_analysis.R__ to transform the raw data set in a tidy data set
2. Code book __CodeBook.md__ that describes the variables, the data, and any   
   transformations or work performed to clean up the data. 
3. This file __README.md__


## How to create the tidy data set

1. Clone this repository: `git clone https://github.com/aniuska/Clean_Tidy_Data_Project.git`
2. Download and unzip [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. Copy the content  `UCI HAR Dataset` directory to the cloned repository root
4. Open a R console and set the working directory to the repository root
5. In the console run this command `source('run_analysis.R')` (requires the plyr package) to generate tidy dataset 

In the repository root directory you will find the tidy data set on `cleaned_data.txt` file.
