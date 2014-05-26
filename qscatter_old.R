# Uses rgl version 0.93.996, which may need to be compiled. Plots a hemisphere.

library("rgl", lib.loc="/home/dhunter/R/x86_64-pc-linux-gnu-library/3.1")
library("pracma", lib.loc="/home/dhunter/R/x86_64-pc-linux-gnu-library/3.1")
library("orientlib", lib.loc="/home/dhunter/R/x86_64-pc-linux-gnu-library/3.1")

# Function takes a vector of rowmatrix and makes a spherical scatterplot
qscatter <- function(orients) {
  # open3d(windowRect=c(0,0,500,500),family="bitmap")
  rgl.open()
  rgl.bg(color="white")
  par3d(windowRect=c(0,0,500,500))
  rgl.spheres(0,0,0,1,color="#000067",front="line",back="line",lwd=1,lit=FALSE)
  rgl.spheres(0,0,0,1,color="#000067",alpha=0.05)
#  ax <- c(0,1,1)
#  ay <- c(0,0,0)
#  az <- c(0,0,-0.1)
  ax <- c(0,0,0)
  ay <- c(0,1,1)
  az <- c(0,0,-0.1)
  verts <- rbind(ax,ay,az)
  n <- length(orients)
  for (i in 1:n) {
    tverts <- t(orients[[i]]) %*% verts
    rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("red","orange"),lwd=2,lit=FALSE)
    }  
}
# rgl.clipplanes(0,1,0,.0001)
load("~/bts/r/quatview/downs_vectorcardiogram.RData")
n <- nrow(downs_vectorcardiogram)
x <- as.matrix(downs_vectorcardiogram[1:n,3:5])
y <- as.matrix(downs_vectorcardiogram[1:n,6:8])
m <- rotvector(cbind(x,y,cross(x,y)))
mo <- as(m, 'rotmatrix')
qscatter(mo)