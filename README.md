## Script

The data is located in several files. All these files should be in the working directory for the script to work

* Measurements are in "X_test.txt" and "X_train.txt"
* Activities are in "y_text.txt" and "y_train.txt"
* Subjects are in "subject_train.txt" and "subject_test.txt"

As test and train contain the same fields, the script uses *rbind* to create one data set combining test and training data for the three (measurements, activities and subjects)

There are additional pieces of information:

* Names of each field of the measurements in "features.txt"
* Names of the types of activities in "activity_labels.txt" 

The script uses the features information to locate and extract the means and standard deviation fields of the measurements, and later on to label the fields of the measurements.

The script uses the activity labels to provide a description to the data activities IDs with *merge* 

The names of the activities and the users IDs are used to assign users and activity descriptions to each observation set with *cbind*

The script uses the added "activity" and "subject" fields to group the information by activity and subject, using the mean. The *aggregate* function is used fot this.

Finally the new clean data set is stored in a "run_analysis.txt" file with *write.table*