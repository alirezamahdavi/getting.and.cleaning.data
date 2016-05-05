The repository contains the following elements:

tidy_data_set.txt: the final desired context.

codeBook.md : describing all the variables and the steps taken

run_analysis.R : all the scripts used to porcess data  

README.md

Original data set name : Human Activity Recognition Using Smartphones Data Set 

Original data set repo : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

following high level steps were taken to achieve the tidey data sets: 

	. Two data sets were merged (training and test sets)
	. Only Standard deviation and mean measuements were taken
	. Descriptive names were given to extracted variables
	. a new data set created with the average of each variable for each activity
 
