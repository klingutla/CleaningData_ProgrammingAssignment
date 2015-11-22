This code book describes how the voluminous data collected from an experiment with a Samsung smartphone is transformed in to a tidy data set along with 
the description of the variables.

Experiment-
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data.

Raw Data-
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency 
domain. 
For each record, the following are included
1.	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2.	Triaxial Angular velocity from the gyroscope. 
3.	A 561-feature vector with time and frequency domain variables. 
4.	Its activity label. 
5.	An identifier of the subject who carried out the experiment.

Data Transformation-
The raw data sets are processed with the script run_analysis.R script to create a tidy data set. Here is the list of steps applied to transform the 
raw data
1.	It first reads all the data files in to data tables 
2.	It binds the data sets for measurements, subjects and activities 
3.	It replaces activity names with the mode descriptive activity labels 
4.	The above three steps are performed on both the training and test data sets
5.	The rows from the test data set is binded below the rows from training data set and a super set is formed 
6.	The column names in the super set is changed to more descriptive names from the supplied features.txt 
7.	All the columns containing mean and std in the names are extracted. It is assumed that all such columns will have the mean and standard deviation measurements. The subject and activity label columns are extracted as well. 
8.	A new tidy data set is obtained from the above formed data set by getting average of each variable grouped by each activity and subject 
9.	Finally, the tidy data set is written to a text file

Description of Variables-
Subject – Identifier of the volunteer this data is collected from. It ranges from 1 to 30.
Activity – Name of the activity which is one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
The rest of the variables are averages of all the Mean and Standard Deviation variables collected

The convention for naming these variables is Type of Measurement-Mean/Std Deviation-Axis of measurement

Type of Measurement: The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean,tBodyGyroJerkMean.

.mean/std: mean or standard deviation of the measurement

.X/Y/Z: one direction of a 3-axial signal