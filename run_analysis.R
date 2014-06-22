## R script for running a data analysis on a specific data set



library('reshape2')

##get wd to write to
wd <- getwd()
wd <- paste(wd,'/tidydata.txt',sep='')
## Read features
features <- read.table('features.txt')[,2]
feats <- grepl("std|mean",features)
activities <- read.table('activity_labels.txt',col.names=c('Code', 'Activity.Name'))

## load data from test
xtest <- read.table("test/X_test.txt",col.names= features)[,feats]
ytest <- read.table("test/y_test.txt",col.names= c('Activity'))
subtest <- read.table("test/subject_test.txt",col.names= c('Subject'))


##load data from train
xtrain <- read.table("train/X_train.txt",col.names= features)[,feats]
ytrain <- read.table("train/y_train.txt",col.names= c('Activity'))
subtrain <- read.table("train/subject_train.txt",col.names= c('Subject'))

## merge test and data sets
xys <- cbind(rbind(ytest,ytrain),rbind(subtest,subtrain),rbind(xtest,xtrain))
xys <- merge(x=xys,y=activities,by.x='Activity',by.y='Code',all=TRUE)[,-1]

## Create tidy dataset
subset <- melt(xys,id.vars=c("Subject",'Activity.Name'))
subset <- dcast(subset,Subject +Activity.Name ~variable,mean)

#write tiny dataset
write.table(subset,wd,sep ='|',row.names=FALSE)
