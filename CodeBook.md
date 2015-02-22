# Introduction

The script 'run_analysis.R' performs the 5 steps described in the course project's definition.

* First it reads the files needed for the analysis. Then create two data sets, one for the train and one for the test, giving the correct name to each variable. Finally, using the 'rbind()' function creates an unique and big data set.
* Second, only those columns with the mean and standard deviation measures are taken from the whole dataset. This using the 'grep()' function that matches certain words with the names of the columns.
* Third uses descriptive activity names to name the activities in the data set, using the join function
* Finally, it creates a new data set and a text file with the average of each variable for each activity and each subject.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `sub_train` and `sub_test` contain the data from the downloaded files. `features` and `labels` contain the names of the variable and the activities performed
* `test_set`, `train_set`  merge the previous datasets. This two data sets are then combined in the `set` data set
* Finally, `new_set` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
