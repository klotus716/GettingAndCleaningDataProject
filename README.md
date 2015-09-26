## Getting and Cleaning Data Project

The goal of this project is to create an R script that prepares data collected from the "Human Activity Recognition Using Smartphones Dataset" Version 1.0, by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto into a tidy data set that can be used for later analysis. 

A brief description of the original data set can be found in the "Codebook.md" file in this repository.



## How This Script Works

The run_analysis.R script can run as long as a copy of the Human Activity Recognition Dataset is already loaded and unzipped in the user's home directory. The dplyr package is requred. 

Listed below are the basic steps the script performs with some notes on how they are implemented.

1. Merges the training and the test sets to create one data set.
	* The training and test sets are reconstructed from their respective (X, Y, and subject) text files, and then merged together to form the complete data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
	* These measurements are interpreted as corresponding to "mean()" and "std()" variables, as defined in the codebook.
3. Uses descriptive activity names to name the activities in the data set.
	* The names in activity_labels file are taken as descriptive, replacing the activity number with plain words.
4. Appropriately labels the data set with descriptive variable names.
	* The names from the features file are taken as short forms of descriptive names for variables, replacing generic column numbers without taking up too much space. Their long forms are explained in the codebook.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	* The output is a single data set in wide format which meets the tidy data standards (one variable per column, one observation per row, one kind of observation per table) and provides understandable column headings. This is saved as a table in a file "tidy_HAR_data.txt" in the user's home directory.


Further description of the observations and variables in the tidy HAR data set can be found in the "Codebook.md" file in this repository.


## Acknowledgments

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
