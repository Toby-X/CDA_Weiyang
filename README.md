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

对于选定为让MSE最小的lambda 1个SE下的LASSO，对于multinomial的进行回归，可以在变量中剩下4个，为uptime, num_charge, av_coin, av_play，可以后续看看效果

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