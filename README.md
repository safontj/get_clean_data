## Script

The data is located in several files. All these files should be in hte working directory for the script to work

* Measurements are in "X_test.txt" and "X_train.txt"
* Activities are in "y_text.txt" and "y_train.txt"
* Subjects are in "subject_train.txt" and "subject_test.txt"

The script uses *rbind* to create one data set comining test and train data for the three

There are additional pieces of information:

* Names of each field of the measurements in "features.txt"
* Names of the types of activities in "activity_labels.txt" 

The script uses this information to locate and extract the means and standard deviations fields of the measurements, and assign users and activities to each observation with *cbind*

The names ot the features are also used to label the data of the combined measures

The script uses the added activity and subject fields to to group the information by activity and subject, using the mean. The *aggregate* function is used fot this.

Finally the new clean data set is stored in a "run_analysis.txt" file with write.table