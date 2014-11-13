require(dplyr)

## 1. Merges the training and the test sets to create one data set.

features_set        <- read.table("UCI\ HAR\ Dataset/features.txt")
subject_test_set    <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
x_test_set          <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y_test_set          <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
subject_train_set   <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
x_train_set         <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
y_train_set         <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")

test_and_train_set  <- rbind(cbind(subject_test_set, y_test_set, x_test_set), 
                             cbind(subject_train_set, y_train_set, x_train_set))

subject_name              <- "Subject"
activity_name             <- "Activity"
names(test_and_train_set) <- c(subject_name, activity_name, 
                               as.vector(features_set[["V2"]]))

## 2. Extracts only the measurements on the mean and standard deviation for each 
## measurement.

mean_std_set <- 
  test_and_train_set[,grepl(paste(subject_name, activity_name, "mean\\(\\)", 
                                  "std\\(\\)", sep = "|"),
                            names(test_and_train_set))]

## 3. Uses descriptive activity names to name the activities in the data set.

activity_labels_set    <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")

mean_std_set           <- left_join(activity_labels_set, mean_std_set, 
                                    by = c("V1" = activity_name))[, -1]

names(mean_std_set)[1] <- activity_name

## 4. Appropriately labels the data set with descriptive names.

names(mean_std_set) <- 
  gsub('^t', "Time Domain.", names(mean_std_set))
names(mean_std_set) <- 
  gsub('^f', "Frequency Domain.", names(mean_std_set))

names(mean_std_set) <- 
  gsub('BodyAccJerk', "Body linear acceleration.", names(mean_std_set))
names(mean_std_set) <- 
  gsub('BodyGyroJerk', "Body angular velocity.", names(mean_std_set))
names(mean_std_set) <- 
  gsub('GravityAcc', "Gravity acceleration signal.", names(mean_std_set))
names(mean_std_set) <- 
  gsub('BodyAcc', "Body acceleration signal.", names(mean_std_set))
names(mean_std_set) <- 
  gsub('BodyGyro', "Body gyroscope signal.", names(mean_std_set))
names(mean_std_set) <- 
  gsub('BodyBody', "Body", names(mean_std_set))
names(mean_std_set) <- 
  gsub('Mag', "Magnitude.", names(mean_std_set))

names(mean_std_set) <- 
  gsub('\\-mean\\(\\)', "Mean value", names(mean_std_set))
names(mean_std_set) <- 
  gsub('\\-std\\(\\)', "Standard deviation", names(mean_std_set))

names(mean_std_set) <- gsub('\\.\\.', "", names(mean_std_set))
names(mean_std_set) <- make.names(names(mean_std_set))

## 5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.

average_mean_std_set <- 
  mean_std_set %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

write.table(average_mean_std_set, 
            file = "average_mean_std_set.txt", row.names = FALSE)