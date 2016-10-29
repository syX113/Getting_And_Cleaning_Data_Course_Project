Getting and Cleaning Data - Course Project

The R script "run_analysis.R" does the following:

1) Download the dataset (if it's not already existing in the WD)
2) Load the activity and feature info
3) Import both datasets and keeps only these columns with a mean or SD
4) Loads the activity and subject data for each dataset, and merges those columns with the dataset
5) Merges the two datasets (activity and feature)
6) Converts the activity and subject columns into factors
7) Creates a tidy dataset. The "mean" value of each variable for each subject & activity pair.
8) Clean data is shown in the "tidy_data.txt"