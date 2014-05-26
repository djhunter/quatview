#load data and make into rotmatrix
library(orientlib) 
library(pracma) 
load("~/bts/r/quatview/downs_vectorcardiogram.RData")
n <- nrow(downs_vectorcardiogram)
x <- as.matrix(downs_vectorcardiogram[1:n,3:5])
y <- as.matrix(downs_vectorcardiogram[1:n,6:8])
m <- rotvector(cbind(x,y,cross(x,y)))
mo <- as(m, 'rotmatrix')
x <- as.matrix(downs_vectorcardiogram[1:n,12:14])
y <- as.matrix(downs_vectorcardiogram[1:n,15:17])
m2 <- rotvector(cbind(x,y,cross(x,y)))
mo2 <- as(m2, 'rotmatrix')
dvlabels <- downs_vectorcardiogram[,1]
