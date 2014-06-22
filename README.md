# Read me for runanaysis.R

## Goal

The purpose of this script is to clean and tidy data from this dataset that Samsung has provided according to the specifications given by the Coursera course

## Requirements

1. The R script, run_analysis.R must be located in the top level directory of the data files. In this case, that is the "UCI HAR dataset". 

2. The test and train folders are located in the same working directory as the R script, as well as the activity_labels.txt and the features_labels.txt

3. The Inertial signals data are not used since they are already summerized in the other files

4. The 'reshape' package

## Data
The code book for this data is located in a file called "CodeBook.md" That explains what each of the data means. Please refer to that for more information.

## Tiny Data
A set of tidy data is produced that is a subset of the original data, organized in a different manner. Mainly, only the mean and standard deviations of each value was taken. This set also combines both the training and testing sets into one large data set. 

The data is organized by subject and their activity, where the subsequent values are the mean of all the values taken for that feature. There are 79 features measured. For each activity a subject performs (of which there are 6) the average of these values are listed. And since there are 30 subjects there are 180 rows!