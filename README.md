trialAnalysis
=============

alters data frame for coursera class project in R

VARIABLES
fileUrl--the web adress from which to download data

subTestTemp--temporary storage for test subject data

subTrainTemp--temporary storage for train subject data

subMergeTemp--temporary storage for merged subject data

xTestTemp--temporary storage for test X data (feature results)

xTrainTemp--temporary storage for train X data (feature results)

xMergeTemp--temporary storage for merged X data (feature results)

yTestTemp--temporary storage for test Y data (activity markers)

yTrainTemp--temporary storage for train Y data (activity markers)

yMergeTemp--temporary storage for merged Y data (activity markers)

tempDataSet--a combination of all subject, feature and activity datas

key--a vecotr representing indicies the specific mean and std. deviation features                                         to be extracted

adjKey--adjustment to key to include subject and activity markers

extractedTempDataSet--dataset extracted according to adjusted key

activityList--storage of text representing the activity markers

activityKey--frame of activity markers coinciding with indicies of the variable "key"

activityLabel--a single vector from within the activityKey dataframe

actLabeledDataSet--dataset including activity labels

features--text representing feature variable names

featureFrame--frame of feature labels coinciding with the indicies of the variable "key"

featureCharFrame--utility variable to store factor frame as character frame

featureVec<-pulls a single vector from the FeatureCharFrame

fullFeatureVec--adds additional labels to "featureVec"

baseFrame--data frame of all labels and data

numericFrame--numeric version of "baseFrame"

finalFrame--rempty data frame that is filled via for loop that makes computations from "numericFrame"



HOW IT WORKS
this scripts first merges the training and test data for subjects, features and activites

Secondly it extracts certain data that coincides with means and standarad deviation according to a key stored in a numeric vector

Then it adds txt labels

It combines all of the labels and extracted data into a character dataframe and converts that into a seperate numeric dataframe

It then, via a for loop, calculates the average of all 76 extracted data points according to the subjects(1-30) and the activities (31-36)
