#This script converts the first five orientations from 
#the vectorcardiogram data and displays them.  Uses pracma and orientlib

load("~/bts/r/quatview/downs_vectorcardiogram.RData")
x <- as.matrix(downs_vectorcardiogram[1:5,3:5])
y <- as.matrix(downs_vectorcardiogram[1:5,6:8])
m <- rotvector(cbind(x,y,cross(x,y)))
boat3d(m)
quaternion(m)