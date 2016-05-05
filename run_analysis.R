##test data and its activity type
X_test <- read.table(file = "X_test.txt", header = FALSE)
y_test <- read.table(file = "y_test.txt")
########################################################################
##reading subjects files
Subjects.test <- read.table(file = "subject_test.txt")
Subjects.train <- read.table(file = "subject_train.txt")
###########################################################################
##Renaming the column for subject file for both test and train
names(Subjects.test) <- "Subject"
names(Subjects.train) <- "Subject"
###########################################################################
## training data and its activity type
X_train <- read.table(file = "X_train.txt", header = FALSE)
y_train <- read.table(file = "y_train.txt")
########################################################################
##to be used as column names
features <- read.table(file = "features.txt")
########################################################################
##labes for activity type
activity_labels <- read.table(file = "activity_labels.txt")
########################################################################
## creating an argument to facilitate extracting desired columns from both data frames
Desired.features <- grep("mean\\(|std\\(", features$V2)
############################################################################################
########BEGIN THE CLEANSING PROCESS#####################
#######EXRTACT feature names from the features.text arg2
exracted_names_from_feature.txt <- as.character(features$V2)
#################################################################
##assigning the extraccted names as column names to X_test file
names(X_test) <- exracted_names_from_feature.txt
##########################################
##assigning the extraccted names as column names to X_train file
names(X_train) <- exracted_names_from_feature.txt
##################################################
##turning a factor data frame into pure data frame with two columns
activity_labels <- data.frame(lapply(activity_labels, as.character), stringsAsFactors = FALSE)
activity_labels$V1 <- as.integer(activity_labels$V1)
###########################################################################
## merging activity labels and y_test data frames 
Merged.actLab.y_test <- join(y_test, activity_labels, by = "V1" )
#####################################################################################
##merging activity labels and y_train data frames
Merged.actLab.y_train <- join(y_train, activity_labels, by = "V1" )
####################################################################################
##renameing the Merged.actLab.y_test columns
names(Merged.actLab.y_test) <- c("Activity.label", "Activity.type")
########################################################################################
##renameing the Merged.actLab.y_train columns
names(Merged.actLab.y_train) <- c("Activity.label", "Activity.type")
#####################################################################################
##Trim X_train and X_test to only columns containing mean and std values
X_test <- X_test[, Desired.features]
X_train <- X_train[, Desired.features]
##Binding Merged.actLab.y_train and X_train 
X_train <- cbind(X_train, Merged.actLab.y_train)
########################################################################################
##Binding Merged.actLab.y_test and X_test
X_test <- cbind(X_test, Merged.actLab.y_test)
#########################################################################################
##Binding X_test and Subject.test
X_test <- cbind(X_test, Subjects.test)
X_train <- cbind(X_train, Subjects.train)
###############################################################################################
##putting two data frames together by the means of rbind
Combined.set <- rbind(X_test, X_train)
##################################################################################
##Renamin variable names
names(Combined.set) <- gsub("\\()","",names(Combined.set))
names(Combined.set) <- gsub("-","\\.",names(Combined.set))
names(Combined.set) <- tolower(names(Combined.set))
Combined.set <- Combined.set[c(-67)]
###############################################################################
##wide to long
Long.data.set <- gather(Combined.set, "measured.factor", "measured.value", tbodyacc.mean.x:fbodybodygyrojerkmag.std)
###########################################################################
tidy.data.set <- dcast(Long.data.set, subject + activity.type ~ measured.factor, mean )
#################################################################################
write.table(tidy.data.set, "tidy.data.txt")