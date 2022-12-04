# CDA Project

R和Python code直接放在主文件夹下即可。

Datasets里面储存处理后的数据，初步处理过的数据储存在了bilibili.csv文件中。

EDA文件夹用来储存EDA放的图片。此后的分析使用bilibili_std即经归一化处理后的数据进行分析

## EDA

### PCA

PCA效果很差，到最后2个PC才能保证99%的方差，到最后4个PC才能保证95%的方差，且通过看系数矩阵无明显的可解释性，后期分析会非常困难。

### LASSO

LASSO无论是对categorical做还是continuous的粉丝数量做，最后得到MSE最小的$\lambda$ 要求的都没有归零项，因此每一项都要放在glm里面进行分析。

本处LASSO已经经过Cross Validation。