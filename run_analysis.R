# Getting and Cleaning Data, John Hopkins University
# freddylearnsc0de

# You should create one R script called run_analysis.R that does the following. 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load library 
library(dplyr)

# Load the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
path <- getwd()

download.file(fileUrl, file.path(path, "UCI_HAR_Dataset.zip"))
unzip("UCI_HAR_Dataset.zip")

# Load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("n", "activity"))

# Load training and test data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Merge the data
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Combine into one data set
merged_data <- cbind(subject_data, y_data, X_data)

# Extract only the measurements on the mean and standard deviation
mean_std_features <- grep("mean|std", features$feature)
X_data_mean_std <- X_data[, mean_std_features]

# Update names
names(X_data_mean_std) <- features[mean_std_features, 2]

# Combine data to create independent data set
tidy_data <- cbind(subject_data, y_data, X_data_mean_std)

# Replace activity code with descriptive activity names
tidy_data$activity <- factor(tidy_data$activity, 
                             levels = activity_labels$n, 
                             labels = activity_labels$activity)

# Group by subject and activity and summarize each variable with mean
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write final tidy data set to file
write.table(final_tidy_data, "final_tidy_data.txt", row.names = FALSE)
