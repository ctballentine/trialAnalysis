fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

download.file(fileUrl,"courseProject.zip", "curl")

if (!file.exists("~/mergedDatasets"))
        {dir.create("~/mergedDatasets")}

subTestTemp<-read.table("~/UCI HAR Dataset/test/subject_test.txt")
subTrainTemp<-read.table("~/UCI HAR Dataset/train/subject_train.txt")
subMergeTemp<-rbind(subTrainTemp,subTestTemp)
xTestTemp<-read.table("~/UCI HAR Dataset/test/X_test.txt")
xTrainTemp<-read.table("~/UCI HAR Dataset/train/X_train.txt")
xMergeTemp<-rbind(xTrainTemp,xTestTemp)
yTestTemp<-read.table("~/UCI HAR Dataset/test/y_test.txt")
yTrainTemp<-read.table("~/UCI HAR Dataset/train/y_train.txt")
yMergeTemp<-rbind(yTrainTemp,yTestTemp)
tempDataSet<-cbind(subMergeTemp,yMergeTemp,xMergeTemp)
write.table(tempDataSet,"~/mergedDatasets/dataframe_merge.txt", row.names = FALSE)

key<-c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552)
adjKey<-c(1,2,(key+2))
extractedTempDataSet<-tempDataSet[,adjKey]

activityList<-read.table("~/UCI HAR Dataset/activity_labels.txt")
activityKey<-extractedTempDataSet[,2]
activityLabel<-activityList[activityKey,2]
actLabeledDataSet<-cbind(activityLabel,extractedTempDataSet)
features<-read.table("~/UCI HAR Dataset/features.txt")
featureFrame<-features[key,]
featureCharFrame<- data.frame(lapply(featureFrame, as.character), stringsAsFactors=FALSE)
featureVec<-featureCharFrame[,2]
fullFeatureVec<-c("activity","subjectID","activityID",featureVec)
        
baseFrame<-rbind(fullFeatureVec,actLabeledDataSet)
numericFrame<- data.frame(lapply(baseFrame, as.numeric))

finalFrame <- data.frame(matrix(ncol = 79, nrow = 36))
for (x in 1:30)
{a<-numericFrame[(numericFrame$V1==x),]
 b<-colMeans(a,na.rm=TRUE)
 finalFrame[x,]<-b}

for (x in 1:6)
{a<-numericFrame[(numericFrame$V1.1==x),]
 b<-colMeans(a,na.rm=TRUE)
 finalFrame[(x+30),]<-b}
