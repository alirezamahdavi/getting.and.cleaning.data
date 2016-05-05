#############################################################################################################################################################################################################################
#############################################################################################################################################################################################################################
#############################################################################################################################################################################################################################
#############################################################################################################################################################################################################################
	The followings are exert from the original data set

	it can be found here:

	Original data set name : Human Activity Recognition Using Smartphones Data Set 

	Original data set repo : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	==================================================================

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

	For each record it is provided:
	======================================

	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.

	The dataset includes the following files:
	=========================================

	- 'README.txt'

	- 'features_info.txt': Shows information about the variables used on the feature vector.

	- 'features.txt': List of all features.

	- 'activity_labels.txt': Links the class labels with their activity name.

	- 'train/X_train.txt': Training set.

	- 'train/y_train.txt': Training labels.

	- 'test/X_test.txt': Test set.

	- 'test/y_test.txt': Test labels.

	The following files are available for the train and test data. Their descriptions are equivalent. 

	- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

	- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

	- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

	- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

	Notes: 
	======
	- Features are normalized and bounded within [-1,1].
	- Each feature vector is a row on the text file.

	For more information about this dataset contact: activityrecognition@smartlab.ws

	License:
	========
	Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

	[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

	This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

	Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

#############################################################################################################################################################################################################################
#############################################################################################################################################################################################################################
#############################################################################################################################################################################################################################
#############################################################################################################################################################################################################################
Please load the library(plyr) and library(reshape2) and library(tidyr) before executing the script

Following steps were taken to drive the tidy data sets:

1. X_test contains all the tests measurements and y_test contains its activity types. They were loaded as (X_test and y_test). Same procedure was performed for training data (X_train and y_train)

2. Info regarding subjected individuals for both test and training were loaded (subject_test.txt and subject_train.txt) and column names were "named" properly ("subject")

3. all measured features were loaded into "feature" data frame and feature names were extracted as character vector. This character vector then applied gainst variable names for both X_train and X_test data sets. 

4. activity types loaded into "activity_labels" data frame. subsequently this data frames was processed to make it easier to be "joined" with y_train and y_test data sets (lines 37 to 44 of the script)

5. since only mean and SD were desired variable to be exerted from original data set, a procedure designed to extract those by looking at the presence of SD or Mean in the variable name (line 24 of the script)

6. lines 53 and 54 of the script contain the procedure to extract only SD and Mean from all the measured data

7. lines 56 and 59 of the script append the activity name to the rest of desired data set

8. lines 62 and 63 append the subject data to the rest of data set

9. in line 66 test and train data were merged by rbind function

10. lines 69 to 72 were used to clean up the varaible names and delet the "activity Label" column 

11. At line 75 function gather was deplyed to turn the data set to a long format instead of original wide format

12 line 77 using dcast function to turn the data to long format based on desired variables : subject and activity.type


