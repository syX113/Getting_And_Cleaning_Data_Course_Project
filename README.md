# Getting and Cleaning Data - Course Project

### The R script "run_analysis.R" does the following:

* Download the dataset (if it's not already existing in the WD)
* Load the activity and feature info
* Import both datasets and keeps only these columns with a mean or SD
* Loads the activity and subject data for each dataset, and merges those columns with the dataset
* Merges the two datasets (activity and feature)
* Converts the activity and subject columns into factors
* Creates a tidy dataset. The "mean" value of each variable for each subject & activity pair.
* Clean data is shown in the "tidy_data.txt"
