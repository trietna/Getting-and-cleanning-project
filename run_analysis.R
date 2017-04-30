library(reshape)

# Load the training data
data_train <- read.table("UCI HAR Dataset/train/X_train.txt")
act_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train<-cbind(sub_train,act_train,data_train)

# Load the test data
data_test <- read.table("UCI HAR Dataset/test/X_test.txt")
act_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test<-cbind(sub_test,act_test,data_test)

# Load features
features<-read.table("UCI HAR Dataset/features.txt")
fea_names<-as.character(features[,2])

# Merges the training and the test sets to create one data set.
data<-rbind(train,test)
colnames(data)<-c("Subjects","Activities",fea_names)

# Extracts only the measurements on the mean and standard deviation for each measurement.
fea_list<-grep('mean|std',fea_names)
fea_want<-fea_names[fea_list]

# The extracted data
data<-data[,c(1,2,fea_list+2)]
colnames(data)[c(3:81)]<-fea_want

# Uses descriptive activity names to name the activities in the data set
act_label<-read.table("UCI HAR Dataset/activity_labels.txt")
act_label[,2]<-as.character(act_label[,2])
data2<-merge(data,act_label,by.x=colnames(data)[2],by.y =colnames(act_label)[1])
data<-data2[,c(2,82,3:81)]
colnames(data)[2]<-"Activities"

# Appropriately labels the data set with descriptive variable names.
fea_want<-gsub("-mean","Mean",fea_want)
fea_want<-gsub("-std","Std",fea_want)
fea_want<-gsub("[-()]","",fea_want)
colnames(data)[3:81]<-fea_want

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melted_data <- melt(data, id = c("Subjects", "Activities"))
tidy_data <- cast(melted_data, Subjects + Activities ~ variable, mean)
write.table(tidy_data, "tidy.txt", row.names = FALSE, quote = FALSE)