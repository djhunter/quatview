# generates 100 random points on the three sphere
library(pracma)
library(orientlib)

s3pts <- cbind(rnorm(100),rnorm(100),rnorm(100),rnorm(100))
s3pts <- t(apply(s3pts,1,function(x) x/(sqrt(dot(x,x)))))
rquats <- quaternion(s3pts)
rorients <- as(rquats, 'rotmatrix')
