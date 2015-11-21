library(dplyr)
xtrain<-read.table("UCI HAR Dataset\\train\\X_train.txt") ##read xtrain into dataframe
xtest<-read.table("UCI HAR Dataset\\test\\X_test.txt")
ytrain<-read.table("UCI HAR Dataset\\train\\y_train.txt")
ytest<-read.table("UCI HAR Dataset\\test\\y_test.txt")
activitylabels<-read.table("UCI HAR Dataset\\activity_labels.txt")
subjecttrain<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
subjecttext<-read.table("UCI HAR Dataset\\test\\subject_test.txt")
featurelabels<-read.table("UCI HAR Dataset\\features.txt")

colnames(xtrain)<-featurelabels[,2]
colnames(xtest)<-featurelabels[,2]
colnames(ytrain)<-"activity"
colnames(ytest)<-"activity"
colnames(subjecttrain)<-"subject"
colnames(subjecttext)<-"subject"
traintidy<-cbind(xtrain,ytrain)
testidy<-cbind(xtest,ytest)
traintidy<-cbind(traintidy,subjecttrain)
testidy<-cbind(testidy,subjecttext)

traintidy$use<-"train"
testidy$use<-"test"

allin<-rbind(traintidy,testidy)

allin$activity<-activitylabels[,2][match(allin$activity,activitylabels[,1])]

desiredmean<-grep("mean()",featurelabels[,2],fixed=TRUE,value=TRUE)
desiredstd<-grep("std()",featurelabels[,2],fixed=TRUE,value=TRUE)

finaltidy<-allin[,c(desiredmean,desiredstd,"activity","use","subject")]


avetidy<-finaltidy %>% select(-use) %>% group_by(activity,subject) %>% summarise_each(funs(mean))

write.table(avetidy, file="averagetidyfile.csv",row.name=FALSE, sep=",")
