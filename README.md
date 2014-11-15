# Getting and Cleaning Data Course Project

README file for the ["Getting and Cleaning Data" course on Coursera](https://www.coursera.org/course/getdata).

## Description of files in this repository

* __CodeBook.md__: informations about raw data set, tidy data set, and data transformation made in the script __run_analysis.R__.
* __README.md__: this file.
* __run_analysis.R__: R script used to transform raw data set in a tidy one.

## Usage of __run_analysis.R__

1. Clone this repository : `git clone https://github.com/myhoang/GettingAndCleaningDataCourseProject.git`.
2. Download the raw data collection [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
3. Unzip raw data and copy the directory `UCI HAR Dataset` to the cloned repository root directory.
4. Open a R console.
5. Set the working directory to the repository root using **setwd()** : for exemple `setwd("~/your/directory/GettingAndCleaningDataCourseProject/")`.
5. Install the **dplyr** package if necessary : `install.packages("dplyr")`.
6. Run the __run_analysis.R__ : `source(file = "run_analysis.R")`.

In the repository root directory you find the file `average_mean_std_set.txt` with the tidy data set.

