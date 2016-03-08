#!/usr/bin/env Rscript

#include gdata library
library(gdata)
#read the main dataset
dataset <- read.csv("all_clean.csv", header=FALSE)
#create the new subset
d_subset = dataset[,c(1,2,3,4,5,6,10,11,12,13,14,16)]
#update header
colnames(d_subset) <- c("ID","Univ_Name","Major","Degree","Season","Decision","UG_GPA","GRE_Verbal","GRE_Quant","GRE_Writing","Is_new_GRE","Status")
#write the subset to a csv
write.csv(d_subset, file="datareduced.csv",row.names = FALSE)
#write the first 100 entries into data100.csv for testing purposes
data100 <- d_subset[1:100,]
write.csv(data100,file="data100.csv",row.names = FALSE)
