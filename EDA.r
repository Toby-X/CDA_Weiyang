#-*- coding: utf-8 -*-
library(GGally)
library(tidyverse)

data = read.csv("./Datasets/bilibili.csv",header=T)
colnames(data)[1] = "idx"

## Create Scatter Plot Matrix
ggpairs(data[,c(3:10,13)])#use av_coin av_like作为代表画spm
corr = cor(data[,-1:-2])
heatmap(corr,Colv = NA,Rowv=NA,scale = "column")
