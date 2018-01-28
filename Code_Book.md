Code Book
==========


## 1. Read data and Merge
* subject_test : subject IDs for test
* subject_train  : subject IDs for train
* X_test : values of variables in test
* X_train : values of variables in train
* y_test : activity ID in test
* y_train : activity ID in train
* activity_labels : Description of activity IDs in y_test and y_train
* features : description(label) of each variables in X_test and X_train

* x : bind of X_train and X_test



## Adding Subject and Activity to the dataSet
Combine test data and train data of subject and activity, then give descriptive lables. Finally, bind with dataSet. At the end of this step, dataSet has 2 additonal columns 'subject' and 'activity' in the left side.
* s : bind of subject_train and subject_test
* y : bind of y_train and y_test



#  Combines data table by columns
 * tidyDataSet : s, y,x