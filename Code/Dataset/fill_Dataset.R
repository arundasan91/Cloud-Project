#!/usr/bin/env Rscript

#include gdata library
library(gdata)
#read dataset
dataset <- read.csv("data100.csv")
#read the number of rows
num.row = nrow(dataset)
#set a seed
set.seed(125)
#make sample values
GRE.awa = c(2,2.5,3,3.5,4,4.5,5,5.5)

#typeof(dataset$Is_new_GRE)
#Type will be "integer"
dataset$Is_new_GRE <- as.character(dataset$Is_new_GRE)
#typeof(dataset$Is_new_GRE)
#Type will be "character"

#UPDATE THE DATASET

#Set the seed to different values to generate different series of random numbers
set.seed(100)
#Save to a field in GRE_Verbal column, a value between 140 and 170, if any that field is having the value 'NA' (is.na), else ignore.
dataset$GRE_Verbal <- ifelse(is.na(dataset$GRE_Verbal), floor(runif(35, min=140, max=170)), dataset$GRE_Verbal)
set.seed(9)
#Save to a field in GRE_Quant column, a value between 140 and 170, if any that field is having the value 'NA' (is.na), else ignore.
dataset$GRE_Quant <- ifelse(is.na(dataset$GRE_Quant), floor(runif(35, min=140, max=170)), dataset$GRE_Quant)
set.seed(251)
#Save to a field in GRE_Writing column, a value between 2.5 and 6, if any that field is having the value 'NA' (is.na), else ignore.
dataset$GRE_Writing <- ifelse(is.na(dataset$GRE_Writing), GRE.awa[floor(runif(8, min=3, max=6))], dataset$GRE_Writing)
#Update the GPA
dataset$UG_GPA <- ifelse(is.na(dataset$UG_GPA), trunc(runif(10, min=3, max=4)), dataset$UG_GPA)
#Update the Is_new_GRE field
dataset[,"Is_new_GRE"] <- ifelse(dataset$GRE_Verbal > 170, "FALSE", "TRUE")
#Create sumGRE column
dataset$sumGRE <- as.integer(dataset$GRE_Verbal)+as.integer(dataset$GRE_Quant)+as.integer(dataset$GRE_Writing)
#Add the new University Names
univName <- readLines("univName2.txt")
dataset$School_Name <- unlist(univName)
#Write the dataset into a csv file.
write.csv(dataset, file="finaldataset.csv",row.names = FALSE)
#Write the file as test100.csv
write.csv(dataset[1:100,], file="test100.csv",row.names = FALSE)
