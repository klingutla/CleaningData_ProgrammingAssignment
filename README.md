# CleaningData_ProgrammingAssignment
The attached R script assumes that all the text files containing the data are present in the working folder. The high level flow
of steps is as below.

1) It first reads all the data files in to data tables
2) It binds the data sets for measurements, subjects and activities
3) It replaces activity names with the mode descriptive activity labels
4) The above three steps are performed on both the training and test data sets
5) The rows from the test data set is binded below the rows from training data set and a super set is formed
6) The column names in the super set is changed to more descriptive names from the supplied features.txt
7) All the columns containing mean and std in the names are extracted. It is assumed that all such columns will have the mean and
standard deviation measurements. The subject and activity label columns are extracted as well.
8) A new tidy data set is obtained from the above formed data set by getting average of each variable 
grouped by each activity and subject
9) Finally, the tidy data set is written to a text file

The script can be run by selecting all the instructions together in RStudio and clicking on the Run icon. It can also be run
one instruction at a time but in the same order as specified in the file.
