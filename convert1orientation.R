# This script makes the first entry of the orientation
# data into a quaternion. Requires pracma, orientlib.
load("~/bts/r/quatview/downs_vectorcardiogram.RData")
x <- as.numeric(downs_vectorcardiogram[1,3:5])
y <- as.numeric(downs_vectorcardiogram[1,6:8])
m <- rotvector(c(x,y,cross(x,y)))
m
boat3d(m)
quaternion(m)
