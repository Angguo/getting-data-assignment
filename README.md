# getting-data-assignment
The goal of this script is to generate a tidy dataset with the average of each variable for each activity and each subject.

line 1: dplyr package is loaded for later use.

line 2~ 9: read data files and data label files into global enviroment. xtrain and ytrain contain the training dataset and corresponding activity, respectively. xtest and ytest contain the test dataset and corresponding activity.

line 11~16: Then descriptive variable labels were extracted from data label files. And use these variable labels to name the columns (variables) of each datasets. 

line 17~27: After that, xtrain, ytrain, and corresponding experimental subject labels were combined into one training dataset. Similarly, same operations were applied to generate a test dataset. Then the training dataset and test dataset were merged into one tidy dataset. 

line 29~32: Then the string pattern matching was applied to the variable names and extract only the measurements on the mean and standard deviation for each measurement. 

line 35: Then the dplyr operations were applied to group the merged dataset based on 2-item combinations of factors in "activity" and "subject". And summarise_each() was used to apply mean() function to every variables (Grouping variables are always excluded) of every groups. This generated the desired tidy dataset with the average of each variable for each activity and each subject. 

line 37: Finally, export the dataframe into a ASCII file: averagetidyfile.csv.
