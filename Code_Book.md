Code Book
==========

## Getting and Cleaning Data Project
This page contains information about the `input data` and `variables` used, and the transformations applied as required by the course project.


## Sources of Data
* The dataset used is **described** here: http://bit.ly/1mEvWTG.

* The data used can be **downloaded** here: http://bit.ly/1p1sdWC.


## DataSet Information

* The data came from experiments that involved *30 volunteers* (age bracket: ***19-48 years***). 
* Each person performed six activities: `1)` WALKING, `2)` WALKING_UPSTAIRS, `3)` WALKING_DOWNSTAIRS, `4)` SITTING, `5)` STANDING, `6)` LAYING 
* All six activities were done while wearing a `smartphone` (Samsung Galaxy S II) on the waist. 
* Using the smartphone's accelerometer and gyroscope, the following were captured: **3-axial linear acceleration** and **3-axial angular velocity** at a constant rate of 50Hz. 
* The experiments have been video-recorded to label the data manually. 
* The obtained dataset has been randomly partitioned into two: where 70% of the volunteers was selected for generating the **training data** and 30% the **test data**.


## Attribute Information

For `each record` in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


## Preliminary activities

After setting the source directory (**UCI HAR Dataset** **folder**) of the files, the following data tables were opened and **read**:

**from test folder**
* `subject_test` : subject IDs for `test`
* `X_test` : values of variables in `test`
* `y_test` : activity ID in `test`

**from train folder**
* `X_train` : values of variables in `train`
* `subject_train`  : subject IDs for `train`
* `y_train` : activity ID in `train`

**from the UCI HAR Dataset folder**
* `activity_labels` : Description of activity IDs in `y_test` and `y_train`
* `features` : description(label) of each variables in `X_test` and `X_train`

The training and the test sets were **merged** to create ***one data set***, as follows:
* `s` : bind of `subject_train` and `subject_test`
* `y` : bind of `y_train` and `y_test`
* `x` : bind of `X_train` and `X_test`


## Project Summary

The project asked to create an *R script* called `run_analysis.R` that does the following:

* Merges the **training** and the **test** sets to create one data set.
* Extracts only the measurements on the *mean* and *standard deviation* for each measurement.
* Uses *descriptive activity names* to name the activities in the data set
* Appropriately *labels* the data set with descriptive activity names.
* Creates a second, independent ***tidy data set*** with the average of each variable for each activity and each subject.
