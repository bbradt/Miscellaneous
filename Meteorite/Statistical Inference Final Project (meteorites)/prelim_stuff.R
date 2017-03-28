setwd("C:/Users/Brad/Desktop/INFER")
source("meteor_helper.R")
library(sound)
library(stringr)
raw_dataset <- read.csv('meteor.csv',header=TRUE)
raw_dataset <- data.frame(raw_dataset)

colnames(raw_dataset)[1] <- 'name'
colnames(raw_dataset)[5] <- 'mass'

limited_dataset <- raw_dataset[,c('name','recclass','mass','year','reclat','reclong')]
# the year should just be one number
