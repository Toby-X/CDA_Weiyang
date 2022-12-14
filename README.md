# CDA Project

R和Python code直接放在主文件夹下即可。

Datasets里面储存处理后的数据，初步处理过的数据储存在了bilibili.csv文件中。

EDA文件夹用来储存EDA放的图片。此后的分析使用bilibili_std即经归一化处理后的数据进行分析

## EDA

### PCA

PCA效果很差，到最后2个PC才能保证99%的方差，到最后4个PC才能保证95%的方差，且通过看系数矩阵无明显的可解释性，后期分析会非常困难。

### LASSO

本处LASSO已经经过Cross Validation。

使用Multicategory的粉丝数作为因变量，在mse最小的条件下，可以把弹幕(av_danmu)变量删掉；在mse小于1标准差范围内，可以把弹幕(av_danmu)，点赞数(av_like)，评论数(av_comment)三个变量给丢掉。在做分析时可以三种模型(什么都不丢，丢一个，丢三个)都看看结果，根据AIC和Lack of fit的结果来选定最终的模型

使用连续的粉丝数作为因变量，在mse最小的条件下可以丢掉性别(gender)和视频数(num_videos)两个变量；在小于1标准差范围内效果很烂。但是感觉这样解释性不好，但是也可以放进模型里都看看效果如何。

## 各个变量名的解释
uptime: 最近更新时间，为日期-2017年的结果(按天数记)，在后续已归一化。

gender: 性别，1为女性，0为男性

num_fans: number of fans，粉丝数，单位为个

fans_cat: fans category，粉丝数的分类，0为很少，1为较少，2为较多，3为很多

num_videos: number of videos，视频数的多少，单位为个

num_charge: number of charges, 充电数的多少，单位为个

av_coin: average number of coins，最近8个视频的平均投币量，单位为个

av_danmu: average number of danmu, 最近8个视频的平均弹幕数量，单位为个

av_star: average number of stars, 最近8个视频的平均收藏量，单位为个

av_like: average number of likes, 最近8个视频的平均点赞数，单位为个

av_play: average number of plays, 最近8个视频的平均播放数，单位为次

av_comment: average number of comments, 最近8个视频的平均评论数，单位为个

av_share: average number of shares, 最近8个视频的平均分享数，单位为个