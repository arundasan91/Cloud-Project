#!/usr/bin/env Rscript

#include gdata library
library(gdata)
#read the main dataset
dataset <- read.csv("all_clean.csv", header=FALSE)
#update headers
colnames(dataset) <- c("ID","Univ_Name","Major","Degree","Season","Decision","UG_GPA","GRE_Verbal","GRE_Quant","GRE_Writing","Is_new_GRE","GRE_Subject","Status")
#create the new subset
d_subset = dataset[,c(1,2,3,4,5,6,10,11,12,13,14,15,16)]
#write the subset to a csv
write.csv(d_subset, file="datasetreduced.csv" )
#change back to original directory
