# generates 100 random points on the three sphere (positive?)
library("pracma", lib.loc="/home/dhunter/R/x86_64-pc-linux-gnu-library/3.1")
library("orientlib", lib.loc="/home/dhunter/R/x86_64-pc-linux-gnu-library/3.1")

ps3pts <- cbind(abs(rnorm(100)),abs(rnorm(100)),abs(rnorm(200)),abs(rnorm(100)))
ps3pts <- t(apply(ps3pts,1,function(x) x/(sqrt(dot(x,x)))))
prquats <- quaternion(ps3pts)
prorients <- as(prquats, 'rotmatrix')
