## Merge the 'train' and 'test' datasets, to create one data set:
#################################################################
  
# Read 'train' datasets (x, y, subject)
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# Read 'test' datasets (x, y, subject)
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Combine train (x, y, subject) & test (x, y, subject) -- by rows

  x <- rbind(x_train, x_test)
  y <- rbind(y_train, y_test)
  s <- rbind(subject_train, subject_test)

### Extract only measurements on the Mean and Standard Deviation (STDEV) for each measurement:
##############################################################################################

# Read 'features' labels
  features <- read.table("UCI HAR Dataset/features.txt")

# Create 'friendly names' to features column
  names(features) <- c('feat_id', 'feat_name')

## Search for matches to argument mean or STDEV 
## within each element of character vector 
  index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
  x <- x[, index_features] 

# Replace all matches of a string features 
  names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))

## Label data set with descriptive activity names
#################################################

# Read 'activity' labels
  activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Create 'friendly names' to activities column
  names(activities) <- c('act_id', 'act_name')
  y[, 1] = activities[y[, 1], 2]

  names(y) <- "Activity"
  names(s) <- "Subject"

# Combine data tables by columns
  tidyDataSet <- cbind(s, y, x)

## Create independent 'tidy data set' with the 
## average (AVG) of each variable -- for each activity / subject
################################################################

  p <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
  tidyDataAVGSet <- aggregate(p,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)
  
# 'activity' and 'subject name' of columns 
  names(tidyDataAVGSet)[1] <- "Subject"
  names(tidyDataAVGSet)[2] <- "Activity"

## Export the tidyData set as TXT
#################################
  write.table(tidyDataAVGSet, "averages_data1.txt",row.names=TRUE,sep='\t')
  write.table(tidyDataAVGSet, "averages_data2.txt", row.name=FALSE)
