#[1]Merges the training and the test sets to create one data set.

require(plyr)

#Read the features and the activity labels
features <- read.table("features.txt")
features <- features[,2]
labels <- read.table("activity_labels.txt")
names(labels) <- c("activity", "activityName")
#Read the test sets
x_test <- read.table("test/X_test.txt")
names(x_test) <- features
y_test <- read.table("test/Y_test.txt", col.names="activity")
sub_test <- read.table("test/subject_test.txt", col.names="id")

#Read the train sets
x_train <- read.table("train/X_train.txt")
names(x_train) <- features
y_train <- read.table("train/Y_train.txt", col.names="activity")
sub_train <- read.table("train/subject_train.txt", col.names="id")

#Merge the data sets
test_set <- cbind(sub_test, x_test, y_test)
train_set <- cbind(sub_train, x_train, y_train)
set <- rbind(train_set, test_set)
set <- arrange(set, id)

#[2] Extracts only the measurements on the mean and standard deviation for each measurement.
set <- set[,grep("mean|std|activity|id", names(set))]

#[3] Uses descriptive activity names to name the activities in the data set.
set <- join(set, labels)

#[4] Appropriately labels the data set with descriptive variable names.
#I've done it!

#[5] Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.
new_set <- ddply(set, .( activityName, id), function(x) colMeans(x[, 2:80]))
write.table(new_set, "new_set.txt", row.names=F)
