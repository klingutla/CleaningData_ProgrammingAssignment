##Read features and activityLabels from data set in to tables
featuresTable <- read.table("features.txt")
activityLabelsTable <- read.table("activity_labels.txt")

##Reading Train Dataset
xtrainTable <- read.table("X_train.txt")
ytrainTable <- read.table("y_train.txt")
subjecttrainTable <- read.table("subject_train.txt")

##Replace numbers with activity labels in ytrainTable 
ytrainTable$V1[ytrainTable$V1 == 1] <- "WALKING"
ytrainTable$V1[ytrainTable$V1 == 2] <- "WALKING_UPSTAIRS"
ytrainTable$V1[ytrainTable$V1 == 3] <- "WALKING_DOWNSTAIRS"
ytrainTable$V1[ytrainTable$V1 == 4] <- "SITTING"
ytrainTable$V1[ytrainTable$V1 == 5] <- "STANDING"
ytrainTable$V1[ytrainTable$V1 == 6] <- "LAYING"

##Consolidate training data set. It will have all the measurements, subjects and activity labels from the training data set
consolidatedTrainTable <- cbind.data.frame(xtrainTable, subjecttrainTable,ytrainTable)



##Reading Test Dataset
xtestTable <- read.table("X_test.txt")
ytestTable <- read.table("y_test.txt")
subjecttestTable <- read.table("subject_test.txt")

##Replace numbers with activity labels in ytestTable 
ytestTable$V1[ytestTable$V1 == 1] <- "WALKING"
ytestTable$V1[ytestTable$V1 == 2] <- "WALKING_UPSTAIRS"
ytestTable$V1[ytestTable$V1 == 3] <- "WALKING_DOWNSTAIRS"
ytestTable$V1[ytestTable$V1 == 4] <- "SITTING"
ytestTable$V1[ytestTable$V1 == 5] <- "STANDING"
ytestTable$V1[ytestTable$V1 == 6] <- "LAYING"

##Consolidate test data set. It will have all the measurements, subjects and activity labels from the test data set
consolidatedTestTable <- cbind.data.frame(xtestTable, subjecttestTable,ytestTable)

##Merge two datasets, add test dataset to the bottom of train dataset. The resulting dataset has all the observations from train and test data sets
consolidatedDataSet <- rbind(consolidatedTrainTable, consolidatedTestTable)

##Add column names for columns 1-561 from features.txt. Set the names of the last two columns as well
colnames(consolidatedDataSet) <- featuresTable$V2
colnames(consolidatedDataSet)[562] <- "Subject"
colnames(consolidatedDataSet)[563] <- "Activity"

##Extract columns "Subject", "Activity" and all columns with mean and std in the column names
meanAndStdDataSet <- consolidatedDataSet[,c("Subject", "Activity", colnames(consolidatedDataSet)[grep("mean()",colnames(consolidatedDataSet))],colnames(consolidatedDataSet)[grep("std()",colnames(consolidatedDataSet))])]

##Calculate the average of each variable grouped by Subject and Activity
outputDataSet <- meanAndStdDataSet %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

##Write the tidy data set to a text file
write.table(outputDataSet, "tidyDataSet.txt", sep="\t", row.names = FALSE)