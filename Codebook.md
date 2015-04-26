# Codebook

Variables used:

## To get the activity data

* trainData: gets the data in X_train.txt (training data)
* testData: gets the data in X_test.txt (test data)
* mergedData: row bind trainData and below testData (merges training and test data in one set)

## To select the mean and standard deviations of measurements

* features: gets the data in features.txt which contains meaningful names for the fields of mergedData
* imeans: gets the positions in features that contain the string “-mean()” which are the fields that contain the mean of each measurement
* istds: gets the positions in features that contain the string “-stds()” which are the fields that contain the standard deviation of each measurement
* i: vector of positions of mergedData that contain means and standard deviations of each measurement. imeans and istds are used to obtain the i vector 
* mergedDataMeansStds: means and standard deviations of measurements of mergedData. Uses i on mergedData

## To include information on subject and activities in the data set

* trainActivity: gets the activity codes in y_train.txt (training activities codes)
* testActivity: gets the activity codes in y_test.txt (test activities codes)
* mergedActivity: row bind trainActivity and testActivity (merges training and test activities codes in one set) and an additional id with the row number

* trainSubject: gets the subject code in subject_train.txt (training subjects codes)
* testSubject: gets the subject code in subject_test.txt (test subjects codes)
* mergedSubject: row bind trainSubject and testSubject (merges training and test subject codes in one set)

* activity: gets the activity labels for the activity codes
* labelActivity: includes activity description on mergedActivity (all the activity codes and their descriptions)

* extendedDataSet: incorporates subject codes and activity descriptions to mergedDataMeansStds

fields of extendedDataSet are named with “Subject”, “Activity” and the corresponding means and standard deviations descriptions in the features lists.

## To obtain the clean data set

* TidyAvg: groups data by activity and subject, using the means for every field

fields are named with “Activity”, “Subject” and the corresponding descriptions in the feature list and then exported to the output file run_analysis.txt (excluding row names)


Units:
Measurement units are the same as the ones indicated in the original documentation
