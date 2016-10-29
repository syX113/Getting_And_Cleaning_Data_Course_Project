# Load needed package (you'll need packages "plyr" and "Rcpp" as well)
# Introduction to Reshape2 -> http://seananderson.ca/2013/10/19/reshape.html
library(reshape2)

#Setting Working Directory
setwd("C:/Users/Tim/Documents/")

# Load activity labels & features
acLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
acLabels[,2] <- as.character(acLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only mean and SD
featNeeded <- grep(".*mean.*|.*std.*", features[,2])
featNeeded.names <- features[featNeeded,2]
featNeeded.names = gsub('-mean', 'Mean', featNeeded.names)
featNeeded.names = gsub('-std', 'Std', featNeeded.names)
featNeeded.names <- gsub('[-()]', '', featNeeded.names)

# Load both datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featNeeded]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featNeeded]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featNeeded.names)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = acLabels[,1], labels = acLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidy_data.txt", row.names = FALSE, quote = FALSE)