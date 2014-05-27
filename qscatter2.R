# Uses rgl version 0.93.996, which may need to be compiled.
# This version uses onion quaternions instead of orientlib

library(rgl)
library(pracma)
library(onion)

# Function takes a vector of onion::quaternion and makes a spherical scatterplot
qscatter <- function(quats, labels = NULL, frames = TRUE, showsphere = FALSE) {
  open3d()
  if (showsphere) {
    rgl.spheres(0,0,0,1,color="#000067",front="line",back="line",lwd=1,lit=FALSE) # doesn't work with writeWebGL
    rgl.spheres(0,0,0,1,color="#000067",alpha=0.05)
  }
  if (frames) {
    ax <- c(0,1)
    ay <- c(0,0)
    az <- c(0,0)
    bx <- c(0,0)
    by <- c(0,1)
    bz <- c(0,0)
    cx <- c(0,0)
    cy <- c(0,0)
    cz <- c(0,1)
    averts <- cbind(ax,ay,az)
    bverts <- cbind(bx,by,bz)
    cverts <- cbind(cx,cy,cz)
    n <- length(quats)
    for (i in 1:n) {
      tverts <- t(rotate(averts,quats[i]))
      rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("red"),lwd=1,lit=FALSE)
      if (!is.null(labels)) {
        text3d(tverts[1,2],tverts[2,2],tverts[3,2],labels[i])
      }
      tverts <- t(rotate(bverts,quats[i]))
      rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("green"),lwd=1,lit=FALSE)
      if (!is.null(labels)) {
        text3d(tverts[1,2],tverts[2,2],tverts[3,2],labels[i])
      }
      tverts <- t(rotate(cverts,quats[i]))
      rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("blue"),lwd=1,lit=FALSE)
      if (!is.null(labels)) {
        text3d(tverts[1,2],tverts[2,2],tverts[3,2],labels[i])
      }
    }
  }
}

# Sample usage:

# q1 <- onion::quaternion(Re=1)
# q3 <- rquat(1,rand="unif")
# qlerp <- seq(q1,q3,len=100,slerp=FALSE)
# qscatter(qlerp,showsphere=TRUE)

