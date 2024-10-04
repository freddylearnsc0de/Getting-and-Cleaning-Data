# Code Book for Getting and Cleaning Data Project

## Introduction

This code book provides a detailed description of the variables, the data, and the transformations performed during the analysis of the Human Activity Recognition Using Smartphones dataset. The dataset includes measurements taken from accelerometers and gyroscopes of 30 volunteers performing six different activities.

## Data Set Overview

- **Participants**: 30 volunteers aged 19 to 48.
- **Activities**: 
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- **Measurement Frequency**: 50 Hz
- **Sensor Type**: Accelerometer and gyroscope embedded in a smartphone (Samsung Galaxy S II).

## Variables

### 1. Subject Variable
- **Name**: `subject`
- **Description**: Identifier for each participant (1 to 30).

### 2. Activity Variable
- **Name**: `activity`
- **Description**: The type of activity performed by the participant (e.g., WALKING, SITTING).
- **Possible Values**:
  - 1 - WALKING
  - 2 - WALKING_UPSTAIRS
  - 3 - WALKING_DOWNSTAIRS
  - 4 - SITTING
  - 5 - STANDING
  - 6 - LAYING

### 3. Measurement Variables
- **Names**: `tBodyAcc-mean-X`, `tBodyAcc-mean-Y`, `tBodyAcc-mean-Z`, etc.
- **Description**: Measurements derived from the accelerometer and gyroscope signals.
- **Details**: Each variable represents a specific measurement taken during the activities and includes:
  - Mean values of linear acceleration and angular velocity.
  - Standard deviation values to assess the variability in the measurements.
  
#### Example of Measurement Variables
| Variable Name                  | Description                                     |
|--------------------------------|-------------------------------------------------|
| `tBodyAcc-mean-X`             | Mean of body acceleration in the X direction    |
| `tBodyAcc-mean-Y`             | Mean of body acceleration in the Y direction    |
| `tBodyAcc-mean-Z`             | Mean of body acceleration in the Z direction    |
| `tBodyAcc-std-X`              | Standard deviation of body acceleration in X    |
| `tBodyAcc-std-Y`              | Standard deviation of body acceleration in Y    |
| `tBodyAcc-std-Z`              | Standard deviation of body acceleration in Z    |
| `tGyro-mean-X`                | Mean of gyroscope measurement in the X direction|
| `tGyro-mean-Y`                | Mean of gyroscope measurement in the Y direction|
| `tGyro-std-X`                 | Standard deviation of gyroscope measurement in X |
| `tGyro-std-Y`                 | Standard deviation of gyroscope measurement in Y |

## Data Processing Steps

1. **Data Loading**:
   - The script loads the required libraries and downloads the dataset from the specified URL.
   - It unzips the data for analysis.

2. **Merging Datasets**:
   - The training and test datasets for both the subject and activity data are merged using `rbind()`.

3. **Extraction of Mean and Standard Deviation**:
   - Variables related to mean and standard deviation are extracted using `grep()` on the feature names.

4. **Descriptive Variable Naming**:
   - The variable names are updated to be more descriptive for better readability.

5. **Activity Labeling**:
   - The activity codes are replaced with descriptive names from the activity labels dataset.

6. **Creating the Tidy Data Set**:
   - The final tidy dataset is created by grouping the data by `subject` and `activity`, summarizing each measurement variable by taking the mean.

7. **Output**:
   - The final tidy dataset is saved as `final_tidy_data.txt`, containing the average of each variable for each activity and subject.

## Output Data Set

- **File Name**: `final_tidy_data.txt`
- **Contents**: The dataset includes the average of each measurement variable for each activity and subject.

## Additional Information

For more information on the dataset and the methods used in the analysis, please refer to the original dataset documentation and the README.txt file provided with the dataset.

## References

- [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- [Video Demonstration of Activities](http://www.youtube.com/watch?v=XOEN9W05_4A)
