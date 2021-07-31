library(dtplyr)

########################

X_train<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\train\\X_train.txt")
y_train<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\train\\y_train.txt")
subject_train<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\train\\subject_train.txt")

X_test<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\test\\X_test.txt")
y_test<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\test\\y_test.txt")
subject_test<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\test\\subject_test.txt")

features<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\features.txt")

activity_labels<-read.table("C:\\Education\\R_programming\\UCI HAR Dataset\\activity_labels.txt")

colnames(X_train)<-features[,2]
colnames(y_train)<-"condition"
colnames(subject_train)<-"User"

colnames(activity_labels)<-c("condition","Nameofcondition")

colnames(X_test)<-features[,2]
colnames(y_test)<-"condition"
colnames(subject_test)<-"User"


union_train<-cbind(subject_train,y_train,X_train)
union_test<-cbind(subject_test,y_test,X_test)
union<-rbind(union_train,union_test)

#########################

extract_columns<-union[,grep("User|condition|mean|std",colnames(union))]

#########################

add_activity<-merge(extract_columns,activity_labels,by.x="condition",all=TRUE)

#########################

agg<-aggregate(x=add_activity,by=list(add_activity[,2],add_activity[,82]),FUN=mean)
agg<-rename(agg,Activity=Group.2,Subject=Group.1)
agg<-agg[order(agg$Subject,agg$Activity),]
agg<-select(agg,-Nameofcondition,-User,-condition)

#########################

write.table(agg, file = "tidydataset.txt",row.name=FALSE)
