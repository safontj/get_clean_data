run_analysis <- function(){
        
        ## read training and test data
        ## no headers and white space as separator
        
        trainData <- read.table("X_train.txt")
        testData <- read.table("X_test.txt")
        
        
## 1) Merges the training and the test sets to create one data set
        
        
        ## merge data adding rows
        ## both files have same type of observations and number of variables
        
        mergedData <- rbind(trainData, testData)
        
## 2) Extracts only the measurements on the mean and standard deviation for each measurement
        
        ## get the variable names of each observation
        
        features <- read.table("features.txt")
        
        ## get the columns of means and standard deviations
        ## use \\ to recognize "(" and ")" in the string
        
        imeans <- grep("-mean\\(\\)",features[,2])
        istds <- grep("-stds()", features[,2])
        i <- sort(c(imeans, istds))
        
        mergedDataMeansStds <- mergedData[,i]
        
        
        
        ## activities
        trainActivity <- read.table("y_train.txt")
        testActivity <- read.table("y_test.txt")
        mergedActivity <- rbind(trainActivity, testActivity)
        
        ## subjects
        
        trainSubject <- read.table("subject_train.txt")
        testSubject <- read.table("subject_test.txt")
        mergedSubject <- rbind(trainSubject, testSubject)
        
        ## name activities in the data set
       
## 3) Uses descriptive activity names to name the activities in the data set
        activity <- read.table("activity_labels.txt")
        labelActivity<- merge(mergedActivity,activity)
        
        ## include subject and name of the activity in the data set
        extendedDataSet <- cbind(mergedSubject,labelActivity[,2],mergedDataMeansStds)
        
## 4) Appropriately labels the data set with descriptive variable names
        
        ## label the variables with meaningful names taken from features list
        
        colnames(extendedDataSet) <- c("Subject", "Activity", as.character(features[i,2]))
        
## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
        
        ## average of variables, grouped by activity and subject
        TidyAvg <- aggregate(extendedDataSet[,3:ncol(extendedDataSet)], by=list(extendedDataSet$Activity, extendedDataSet$Subject), mean)
        colnames(TidyAvg) <- c("Activity", "Subject", as.character(features[i,2]))
        
        write.table(TidyAvg,"run_analysis.txt", row.names= FALSE)
        
        
        
}