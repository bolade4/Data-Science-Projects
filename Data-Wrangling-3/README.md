# Human Activity Recognition Using Smartphones Data Set: Cleaning the Data

## Introduction
The data used on this project is gotten from UCI Machine Learning Repository which is a collection of databases that are used in different experiments for analysis of machine learning algorithms by different researchers. This database is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## Goal
The goal of this analysis is to build a tidy dataset (i.e. getting the data ready) based on a given instructions, which could be analyzed.

## Data Collection
A group of 30 volunteers within an age bracket of 19-48 years have carried out this experiments. Each person performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The original dataset and it's full description can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## How the data was processed
Based on how the data was processed, I will be running through the R Script, which is named run_analysis.R in this repository. First the data was downloaded into a working directory and it was loaded into the run_analysis from this working directory. Also, I loaded the dplyr package because I used it sometime in the process. Then the steps for creating a tidy dataset follows based on the given instructions below:

## 0: Load the data in RStudio
All the dataset were loaded, the test dataset (subject_test, x_test, y_test), train dataset (subject_train, x_train, y_train), activity_labels, features from their folders into R.
After loading the data into R, I changed the class of the features variables to character.
Then the the variable names are changed in both x_test and x_train dataset to the features variable names.
Then the columns of all the test data are combined which is now test_data and all the train_data which is now train_data.
Lastly the first two colums for both test_data and train_data dataset are renamed.

## 1: Merge data sets
Now the datasets are merged by combining their rows, the subject datasets and named it subject_train_test, x datasets and name it x_train_test, and the y datasets and named it y_train_test


## 2: Mean and standard deviation
Using the x_train_test dataset, the dataframe is subsetted by using regular expressions grep("mean\\(\\)", columns) for both the mean and the standard deviation. The mean and standard deviation was extracted and stored in x_mean_std dataset. The resulting dataframe has 10299 obs and 66 variables.

## 3: Add new variables
Here two new variables were created Activity name and and Activity label. First the column of the y_train_test dataset is combined with the  x_mean_std dataset and stored in the new object activity_label_name. The new added variable in activity_label_name is renamed and then the activity_labels dataset is merged to the activity_label_name dataset and the first variable is also renamed and stored in activity_label_name which is our new tidy data.

## 4: Create tidy data set
Lastly, another tidy data is created with the average of each activity and each subject. Using the dplyr, mutate is used to calculate the average of each activity and each subject and the result stored in the object.. independent_tidy_set, this added up two more variables to the dataset activity_ave and subject_ave. And the final dataset is written into a csv file format.

## References:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://campus.datacamp.com/
https://www.springboard.com/workshops/data-science/
