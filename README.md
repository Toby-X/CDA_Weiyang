# CDA Project

在repo中，

lsa_clust.Rmd为进行爬虫部分的代码；

DataCleaning.ipynb为进行数据清洗部分的代码；

EDA.r为进行探索性数据分析部分的代码文件；

ContingencyTables.r为进行列联表分析部分的代码；

CDAregression.Rmd为进行逻辑回归分析部分的代码。

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