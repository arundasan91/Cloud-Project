#!/usr/bin/env Rscript

#include gdata library
library(gdata)
#read dataset
dataset <- read.csv("data100.csv")
#read the number of rows
num.row = nrow(dataset)
#set a seed
set.seed(124)
#make sample values
GRE.awa = c(2,2.5,3,3.5,4,4.5,5,5.5)

#I'm working on correcting this one. Everything else works fine
#dataset$Is_new_GRE <- ifelse(dataset$Is_new_GRE == "TRUE", dataset$Is_new_GRE, "FALSE")

set.seed(100)
dataset$GRE_Verbal <- ifelse(is.na(dataset$GRE_Verbal), floor(runif(35, min=140, max=170)), dataset$GRE_Verbal)
set.seed(9)
dataset$GRE_Quant <- ifelse(is.na(dataset$GRE_Quant), floor(runif(35, min=140, max=170)), dataset$GRE_Quant)
set.seed(251)
dataset$GRE_Writing <- ifelse(is.na(dataset$GRE_Writing), GRE.awa[floor(runif(8, min=2.5, max=8))], dataset$GRE_Writing)
write.csv(dataset, file="test100.csv")
