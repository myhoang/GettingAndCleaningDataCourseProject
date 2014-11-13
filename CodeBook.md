# Code Book for "Getting and Cleaning Data" Course Project

## A. Raw data description

Raw data collection can be found here : <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

Full description of these raw datas can be found in __README.txt__ file.
A full description is also available at the site where the data was obtained :
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

## B. Data transformation description

The raw data sets are processed with __run_analysis.R__ script to create a tidy data set.
The processing follow these 5 steps :

1. Merge of the training and the test sets to create one data set.
2. Extraction of mean and standard deviation variables.
3. Use of descriptive activity names to name the activities in the data set.
4. Appropriate labeling of the data set with descriptive variable names. 
5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.

Here are detailed descriptions of these steps.

### 1. Merge of the training and test sets

Single data set (**test_and_train_set**) is obtained by merging :

* Test and training datas : __X_train.txt__, __X_test.txt__
* Subject IDs : __subject_train.txt__, __subject_test.txt__
* Activity IDs : __y_train.txt__, __y_test.txt__

Datas are labeled with the names assigned in __features.txt__.

### 2. Extraction of mean and standard deviation variables

From the merged data set above, is extracted data set (**mean_std_set**) with only the
variables with labels that contain **mean()** ("Mean value"), and variables with labels that contain **std()** ("Standard deviation").

### 3. Use of descriptive activity names

A new column is added to **mean_std_set** with the activity description found in __activity_labels.txt__.

### 4. Appropriate labeling

Labels given from the original collectors were changed in **mean_std_set** :

1. To obtain valid R names without parentheses, dashes and commas.
2. To obtain more descriptive labels, as described in __features_info.txt__.

See [Format of output data](#c-format-of-output-data) for details.

### 5. Create a tidy data set

From the **mean_std_set** is created a final tidy data set (**average_mean_std_set**) where numeric variables are averaged for each activity and each subject.

## C. Format of output data

Output data is a data frame (**average_mean_std_set**) with 180 observations on 66 variables (68 with "Subject" and "Activity") corresponding to raw variables with labels that contain **mean()** ("Mean value"), and variables with labels that contain **std()** ("Standard deviation").

This table show the raw name (described in __features_info.txt__) and tidy name (after processing step 4) of extracted variables.

<table border=1>
<tr> <th>  </th> <th> Raw Names </th> <th> Tidy Names </th>  </tr>
  <tr> <td align="right"> 1 </td> <td> Activity </td> <td> Activity </td> </tr>
  <tr> <td align="right"> 2 </td> <td> Subject </td> <td> Subject </td> </tr>
  <tr> <td align="right"> 3 </td> <td> tBodyAcc-mean()-X </td> <td> Time.Domain.Body.acceleration.signal.Mean.value.X </td> </tr>
  <tr> <td align="right"> 4 </td> <td> tBodyAcc-mean()-Y </td> <td> Time.Domain.Body.acceleration.signal.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 5 </td> <td> tBodyAcc-mean()-Z </td> <td> Time.Domain.Body.acceleration.signal.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 6 </td> <td> tBodyAcc-std()-X </td> <td> Time.Domain.Body.acceleration.signal.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 7 </td> <td> tBodyAcc-std()-Y </td> <td> Time.Domain.Body.acceleration.signal.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 8 </td> <td> tBodyAcc-std()-Z </td> <td> Time.Domain.Body.acceleration.signal.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 9 </td> <td> tGravityAcc-mean()-X </td> <td> Time.Domain.Gravity.acceleration.signal.Mean.value.X </td> </tr>
  <tr> <td align="right"> 10 </td> <td> tGravityAcc-mean()-Y </td> <td> Time.Domain.Gravity.acceleration.signal.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 11 </td> <td> tGravityAcc-mean()-Z </td> <td> Time.Domain.Gravity.acceleration.signal.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 12 </td> <td> tGravityAcc-std()-X </td> <td> Time.Domain.Gravity.acceleration.signal.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 13 </td> <td> tGravityAcc-std()-Y </td> <td> Time.Domain.Gravity.acceleration.signal.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 14 </td> <td> tGravityAcc-std()-Z </td> <td> Time.Domain.Gravity.acceleration.signal.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 15 </td> <td> tBodyAccJerk-mean()-X </td> <td> Time.Domain.Body.linear.acceleration.Mean.value.X </td> </tr>
  <tr> <td align="right"> 16 </td> <td> tBodyAccJerk-mean()-Y </td> <td> Time.Domain.Body.linear.acceleration.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 17 </td> <td> tBodyAccJerk-mean()-Z </td> <td> Time.Domain.Body.linear.acceleration.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 18 </td> <td> tBodyAccJerk-std()-X </td> <td> Time.Domain.Body.linear.acceleration.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 19 </td> <td> tBodyAccJerk-std()-Y </td> <td> Time.Domain.Body.linear.acceleration.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 20 </td> <td> tBodyAccJerk-std()-Z </td> <td> Time.Domain.Body.linear.acceleration.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 21 </td> <td> tBodyGyro-mean()-X </td> <td> Time.Domain.Body.gyroscope.signal.Mean.value.X </td> </tr>
  <tr> <td align="right"> 22 </td> <td> tBodyGyro-mean()-Y </td> <td> Time.Domain.Body.gyroscope.signal.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 23 </td> <td> tBodyGyro-mean()-Z </td> <td> Time.Domain.Body.gyroscope.signal.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 24 </td> <td> tBodyGyro-std()-X </td> <td> Time.Domain.Body.gyroscope.signal.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 25 </td> <td> tBodyGyro-std()-Y </td> <td> Time.Domain.Body.gyroscope.signal.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 26 </td> <td> tBodyGyro-std()-Z </td> <td> Time.Domain.Body.gyroscope.signal.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 27 </td> <td> tBodyGyroJerk-mean()-X </td> <td> Time.Domain.Body.angular.velocity.Mean.value.X </td> </tr>
  <tr> <td align="right"> 28 </td> <td> tBodyGyroJerk-mean()-Y </td> <td> Time.Domain.Body.angular.velocity.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 29 </td> <td> tBodyGyroJerk-mean()-Z </td> <td> Time.Domain.Body.angular.velocity.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 30 </td> <td> tBodyGyroJerk-std()-X </td> <td> Time.Domain.Body.angular.velocity.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 31 </td> <td> tBodyGyroJerk-std()-Y </td> <td> Time.Domain.Body.angular.velocity.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 32 </td> <td> tBodyGyroJerk-std()-Z </td> <td> Time.Domain.Body.angular.velocity.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 33 </td> <td> tBodyAccMag-mean() </td> <td> Time.Domain.Body.acceleration.signal.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 34 </td> <td> tBodyAccMag-std() </td> <td> Time.Domain.Body.acceleration.signal.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 35 </td> <td> tGravityAccMag-mean() </td> <td> Time.Domain.Gravity.acceleration.signal.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 36 </td> <td> tGravityAccMag-std() </td> <td> Time.Domain.Gravity.acceleration.signal.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 37 </td> <td> tBodyAccJerkMag-mean() </td> <td> Time.Domain.Body.linear.acceleration.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 38 </td> <td> tBodyAccJerkMag-std() </td> <td> Time.Domain.Body.linear.acceleration.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 39 </td> <td> tBodyGyroMag-mean() </td> <td> Time.Domain.Body.gyroscope.signal.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 40 </td> <td> tBodyGyroMag-std() </td> <td> Time.Domain.Body.gyroscope.signal.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 41 </td> <td> tBodyGyroJerkMag-mean() </td> <td> Time.Domain.Body.angular.velocity.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 42 </td> <td> tBodyGyroJerkMag-std() </td> <td> Time.Domain.Body.angular.velocity.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 43 </td> <td> fBodyAcc-mean()-X </td> <td> Frequency.Domain.Body.acceleration.signal.Mean.value.X </td> </tr>
  <tr> <td align="right"> 44 </td> <td> fBodyAcc-mean()-Y </td> <td> Frequency.Domain.Body.acceleration.signal.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 45 </td> <td> fBodyAcc-mean()-Z </td> <td> Frequency.Domain.Body.acceleration.signal.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 46 </td> <td> fBodyAcc-std()-X </td> <td> Frequency.Domain.Body.acceleration.signal.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 47 </td> <td> fBodyAcc-std()-Y </td> <td> Frequency.Domain.Body.acceleration.signal.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 48 </td> <td> fBodyAcc-std()-Z </td> <td> Frequency.Domain.Body.acceleration.signal.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 49 </td> <td> fBodyAccJerk-mean()-X </td> <td> Frequency.Domain.Body.linear.acceleration.Mean.value.X </td> </tr>
  <tr> <td align="right"> 50 </td> <td> fBodyAccJerk-mean()-Y </td> <td> Frequency.Domain.Body.linear.acceleration.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 51 </td> <td> fBodyAccJerk-mean()-Z </td> <td> Frequency.Domain.Body.linear.acceleration.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 52 </td> <td> fBodyAccJerk-std()-X </td> <td> Frequency.Domain.Body.linear.acceleration.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 53 </td> <td> fBodyAccJerk-std()-Y </td> <td> Frequency.Domain.Body.linear.acceleration.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 54 </td> <td> fBodyAccJerk-std()-Z </td> <td> Frequency.Domain.Body.linear.acceleration.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 55 </td> <td> fBodyGyro-mean()-X </td> <td> Frequency.Domain.Body.gyroscope.signal.Mean.value.X </td> </tr>
  <tr> <td align="right"> 56 </td> <td> fBodyGyro-mean()-Y </td> <td> Frequency.Domain.Body.gyroscope.signal.Mean.value.Y </td> </tr>
  <tr> <td align="right"> 57 </td> <td> fBodyGyro-mean()-Z </td> <td> Frequency.Domain.Body.gyroscope.signal.Mean.value.Z </td> </tr>
  <tr> <td align="right"> 58 </td> <td> fBodyGyro-std()-X </td> <td> Frequency.Domain.Body.gyroscope.signal.Standard.deviation.X </td> </tr>
  <tr> <td align="right"> 59 </td> <td> fBodyGyro-std()-Y </td> <td> Frequency.Domain.Body.gyroscope.signal.Standard.deviation.Y </td> </tr>
  <tr> <td align="right"> 60 </td> <td> fBodyGyro-std()-Z </td> <td> Frequency.Domain.Body.gyroscope.signal.Standard.deviation.Z </td> </tr>
  <tr> <td align="right"> 61 </td> <td> fBodyAccMag-mean() </td> <td> Frequency.Domain.Body.acceleration.signal.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 62 </td> <td> fBodyAccMag-std() </td> <td> Frequency.Domain.Body.acceleration.signal.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 63 </td> <td> fBodyBodyAccJerkMag-mean() </td> <td> Frequency.Domain.Body.linear.acceleration.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 64 </td> <td> fBodyBodyAccJerkMag-std() </td> <td> Frequency.Domain.Body.linear.acceleration.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 65 </td> <td> fBodyBodyGyroMag-mean() </td> <td> Frequency.Domain.Body.gyroscope.signal.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 66 </td> <td> fBodyBodyGyroMag-std() </td> <td> Frequency.Domain.Body.gyroscope.signal.Magnitude.Standard.deviation </td> </tr>
  <tr> <td align="right"> 67 </td> <td> fBodyBodyGyroJerkMag-mean() </td> <td> Frequency.Domain.Body.angular.velocity.Magnitude.Mean.value </td> </tr>
  <tr> <td align="right"> 68 </td> <td> fBodyBodyGyroJerkMag-std() </td> <td> Frequency.Domain.Body.angular.velocity.Magnitude.Standard.deviation </td> </tr>
   </table>

