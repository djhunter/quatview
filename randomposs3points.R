# generates 100 random points on the three sphere (positive?)
library("pracma")
library("orientlib")

# ps3pts <- cbind(abs(rnorm(100)),abs(rnorm(100)),abs(rnorm(100)),abs(rnorm(100)))
ps3pts <- cbind(rnorm(100),rnorm(100),rnorm(100),rnorm(100))
ps3pts <- t(apply(ps3pts,1,function(x) x/(sqrt(dot(x,x)))))
prquats <- quaternion(ps3pts)
prorients <- as(prquats, 'rotmatrix')
