#-*- coding: utf-8 -*-
library(GGally)
library(tidyverse)

setwd("E:/Programmes/Python/CDA_Weiyang/")
data = read.csv("./Datasets/bilibili.csv",header=T)
colnames(data)[1] = "idx"
data$gender = factor(data$gender)
data$fans_cat = factor(data$fans_cat)
data$id = factor(data$id)

## standardized so that every value is in (0,1)
column_max = apply(data[,c(3:4,6,8:16)],2,max)
column_min = apply(data[,c(3:4,6,8:16)],2,min)
data_std = t((t(data[,c(3:4,6,8:16)])-column_min)/(column_max-column_min))
data[,c(3:4,6,8:16)] = data_std
write.csv(data,"./Datasets/std_bilibili.csv")

## Create Scatter Plot Matrix
data$gender = as.numeric(data$gender)-1
ggpairs(data[,c(3:6,8:10,13)])#use av_coin av_like作为代表画spm
corr = cor(data[,c(-1,-2,-5,-7)])
heatmap(corr,Colv = NA,Rowv=NA,scale = "column")
data$gender = factor(data$gender)

## boxplot for each categories
ggplot(data=data)+
  geom_boxplot(aes(x = gender,y=num_charge,fill=gender))+
  labs(title = "Number of charges for each gender")+
  scale_fill_hue(labels = c("male","female"))

ggplot(data=data)+
  geom_boxplot(aes(x = gender,y=av_like,fill=gender))+
  labs(title = "Average number of likes for each gender")+
  scale_fill_hue(labels = c("male","female"))

ggplot(data=data)+
  geom_boxplot(aes(x = fans_cat,y=av_like,fill=fans_cat))+
  labs(title = "Average number of likes for different levels of number of fans")+
  scale_fill_hue(labels = c("Very Few","Few","Many","Great Many"))+
  labs(fill="Number of Fans")+
  ylab("average likes")+
  xlab("different number of fans")

ggplot(data=data)+
  geom_boxplot(aes(x = fans_cat,y=av_coin,fill=fans_cat))+
  labs(title = "Average number of coins for different levels of number of fans")+
  scale_fill_hue(labels = c("Very Few","Few","Many","Great Many"))+
  labs(fill="Number of Fans")+
  ylab("average coins")+
  xlab("different number of fans")

ggplot(data=data)+
  geom_boxplot(aes(x = fans_cat,y=num_charge,fill=fans_cat))+
  labs(title = "Number of charges for different levels of number of fans")+
  scale_fill_hue(labels = c("Very Few","Few","Many","Great Many"))+
  labs(fill="Number of Fans")+
  ylab("number of charges")+
  xlab("different number of fans")

## PCA
## From below, drop the ifans variable
data.pca = prcomp(data[,c(3,8:16)])
ggplot()+
  geom_point(aes(x=1:length(data.pca$sdev),y=data.pca$sdev))+
  geom_line(aes(x=1:length(data.pca$sdev),y=data.pca$sdev),lty="longdash")+
  labs(title="Elbow Plot")+
  xlab("PCs")+
  ylab("sdev")
data.pca$rotation
## 解释性非常差，很难解读
data.pca$sdev^2/sum(data.pca$sdev^2)

## ELASTICNET
library(glmnet)
Design = as.matrix(data[,c(3,8:16)])

## Using Multicategorical glm
cvfit1 = cv.glmnet(Design,as.integer(data$fans_cat))
plot(cvfit1)
s1 = cvfit1$lambda.min
s2 = cvfit1$lambda.1se
lasso1.coef = coef(cvfit1$glmnet.fit,s=s1,exact = F)
lasso1.coef2 = coef(cvfit1$glmnet.fit,s=s2,exact = F)
lasso1.coef
lasso1.coef2

## Using Continuous data(number of fans)
cvfit2 = cv.glmnet(Design,data$num_fans)
plot(cvfit2)
s11 = cvfit2$lambda.min
s21 = cvfit2$lambda.1se
lasso2.coef1 = coef(cvfit2$glmnet.fit,s=s11,exact = F)
lasso2.coef2 = coef(cvfit2$glmnet.fit,s=s21,exact = F)
lasso2.coef1
lasso2.coef2

## From the result above, seemingly have to use all the variables extracted