# Code book for this project

About R script:

   1. Reading all necessary files:
      1.1 Reading train variables
      1.2 Reading test variables
      1.3 Reading subject_test
      1.4 Reading feature
      1.5 Reading activity_labels
      1.6 Change names of columns
      1.7 Merge test and train data
      
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
      2.1 I apply grep function to extract User,condition,mean,std
      
   3. Uses descriptive activity names to name the activities in the data set.
   
   4. Appropriately labels the data set with descriptive variable names.

   5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      5.1 I processed data with aggregate function, and obtained tidy data \n
      5.2 I save my tidy data in .txt file
