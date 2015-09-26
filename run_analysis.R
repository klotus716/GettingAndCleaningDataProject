## The run_analysis script creates a tidy data set that can be used for future analysis of 
## the mean and standard deviation measurements in the UCI_HAR_Dataset.

# Requires the dplyr package
library(dplyr)
  
# STEP 1
  
# Read in files related to test data set
test_data <- read.table("./UCI HAR Dataset/test/x_test.txt")
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "V562")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "V563")
  
#Merge test data files to form test set
test_set <- cbind(test_data, test_activities, test_subjects)
  
# Read in files related to training data set
train_data <- read.table("./UCI HAR Dataset/train/x_train.txt")
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "V562")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "V563")
  
# Merge training data files to form training set
train_set <- cbind(train_data, train_activities, train_subjects)

# Merge test and training sets into single data set
merged_set <- rbind(train_set, test_set)


# STEP 2

# Read in features file
features <- read.table("./UCI HAR Dataset/features.txt")

# Keep only the mean and standard deviation features for each measurement
mean_std_features <- filter(features, (grepl("mean()|std()", features$V2) & !grepl("meanFreq()", features$V2)))
mean_std_set <- select(merged_set, num_range("V", c(mean_std_features$V1, 562, 563)))


# STEP 3

# Read in the activity_labels file associating activity IDs with descriptive names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Set the activity column class to factor and use descriptive names as levels
mean_std_set$V562 <- as.factor(mean_std_set$V562)
levels(mean_std_set$V562) <- activity_labels$V2


# STEP 4

# Apply descriptive names to variables
colnames(mean_std_set) <- c(levels(droplevels(mean_std_features)$V2), "activity", "subject_id")


# Step 5

# Create second tidy data set with average of each variable for each activity and subject
grouped_set <- group_by(mean_std_set, activity, subject_id)
average_set <- summarise_each(grouped_set, funs(mean))
  
# Output the second tidy data set to the current home directory
write.table(average_set, file = "./tidy_HAR_data.txt", row.names = FALSE)
 

