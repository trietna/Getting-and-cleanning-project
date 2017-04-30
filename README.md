## Getting and Cleaning Data - Course Project
This is the course project for the Getting and Cleaning Data Coursera course. 
Before run R scirpt below, you need to download data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip data into your working directory. A full description is available at the site where the data was obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The R script, run_analysis.R, does the following:
1. Load data:
  - Load training dataset store in table names **data_train**
    * read table from "UCI HAR Dataset/train/X_train.txt",  
    * read table from "UCI HAR Dataset/train/Y_train.txt"
    * read table from "UCI HAR Dataset/train/subject_train.txt"
    * Combine three by Columns and store in **train**
  - Load test dataset store in table names **data_test**
    * read table from "UCI HAR Dataset/test/X_test.txt",  
    * read table from "UCI HAR Dataset/test/Y_test.txt"
    * read table from "UCI HAR Dataset/test/subject_test.txt"
    * Combine three by Columns and store in **test**
  - Combine **data_train** and **data_test** by rows into one data set called **data**
2. Load features from "UCI HAR Dataset/features.txt" store in **features** and feature names store in **fea_names**.
3. Merges **train** and **test** by rows into one data set called **data**.
4. Filter out the data
  - Filter the Labels, we just need features which  measurements on the mean and standard deviation then store in **fea_want** and their names store in **fea_want**.
  - Get a subset data of data and rename its column name. Store in **data** again.
5. Uses descriptive activity names to name the activities in the data set:
  - Load activity labels from "UCI HAR Dataset/activity_labels.txt" store in **act_label** and feature names store in **fea_names**.
  - Merge **data** and **act_label** by label value.
  - Select **data** again.
6. Appropriately labels the data set with descriptive variable names: Replace "mean" with "Mean", "std" with "Std", "()" with "".
7. "melt" data so that each row is a unique **Subjects-Activities** combination and store in **melted_data**.
8. Use cast funtion to creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. The result stored in data which name is **tidy_data**. 
9. Last step, we wrote the **tidy_data** into file name "**tidy.txt**".