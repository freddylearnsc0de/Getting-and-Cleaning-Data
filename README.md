# Getting-and-Cleaning-Data
## Overview

This project is part of the "Getting and Cleaning Data" course from John Hopkins University. The goal is to prepare tidy data that can be used for later analysis. The project involves collecting, working with, and cleaning a dataset collected from accelerometers from a Samsung Galaxy S smartphone.

## Script Description

### run_analysis.R

The `run_analysis.R` script performs the following steps:

1. **Merges the Training and Test Sets:**
   - Loads and combines the training and test datasets for both the subject and activity data.
   
2. **Extracts Measurements on the Mean and Standard Deviation:**
   - Identifies and extracts only the measurements on the mean and standard deviation for each measurement.

3. **Uses Descriptive Activity Names:**
   - Replaces activity codes with descriptive activity names for clarity.

4. **Labels the Data Set:**
   - Appropriately labels the dataset with descriptive variable names to enhance readability.

5. **Creates a Tidy Data Set:**
   - Produces a second, independent tidy dataset with the average of each variable for each activity and each subject. This final dataset is written to a file named `final_tidy_data.txt`.

## Required Libraries

This script requires the following R package:

- `dplyr`: For data manipulation and summary operations.

You can install it using the command:

```R
install.packages("dplyr")
