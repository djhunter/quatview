# Uses rgl version 0.93.996, which may need to be compiled.

library(rgl)
library(pracma)
library(orientlib)

# Function takes a vector of rowmatrix and makes a spherical scatterplot
qscatter <- function(orients, labels = NULL, frames = TRUE, wrenches = FALSE, showsphere = FALSE) {
  # open3d(windowRect=c(0,0,500,500),family="bitmap")
  # rgl.open()
  # rgl.bg(color="white")
  # par3d(windowRect=c(0,0,500,500))
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
    averts <- rbind(ax,ay,az)
    bverts <- rbind(bx,by,bz)
    cverts <- rbind(cx,cy,cz)
    n <- length(orients)
    for (i in 1:n) {
      tverts <- t(orients[[i]]) %*% averts
      rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("red"),lwd=1,lit=FALSE)
      if (!is.null(labels)) {
        text3d(tverts[1,2],tverts[2,2],tverts[3,2],labels[i])
      }
      tverts <- t(orients[[i]]) %*% bverts
      rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("green"),lwd=1,lit=FALSE)
      if (!is.null(labels)) {
        text3d(tverts[1,2],tverts[2,2],tverts[3,2],labels[i])
      }
      tverts <- t(orients[[i]]) %*% cverts
      rgl.linestrips(tverts[1,],tverts[2,],tverts[3,],color=c("blue"),lwd=1,lit=FALSE)
      if (!is.null(labels)) {
        text3d(tverts[1,2],tverts[2,2],tverts[3,2],labels[i])
      }
    }
    ax <- c(0,1.2)
    by <- c(0,1.2)
    cz <- c(0,1.2)
    averts <- rbind(ax,ay,az)
    bverts <- rbind(bx,by,bz)
    cverts <- rbind(cx,cy,cz)
    mvert <- t(mean(orients)[[1]]) %*% averts
    rgl.linestrips(mvert[1,],mvert[2,],mvert[3,],color=c("#800000"),lwd=4,lit=FALSE)
    mvert <- t(mean(orients)[[1]]) %*% bverts
    rgl.linestrips(mvert[1,],mvert[2,],mvert[3,],color=c("#008000"),lwd=4,lit=FALSE)
    mvert <- t(mean(orients)[[1]]) %*% cverts
    rgl.linestrips(mvert[1,],mvert[2,],mvert[3,],color=c("#000080"),lwd=4,lit=FALSE)
    
  }
  
  if (wrenches) {
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
}

### Sample usage:
# load("~/bts/r/quatview/downs_vectorcardiogram.RData")
# n <- nrow(downs_vectorcardiogram)
# x <- as.matrix(downs_vectorcardiogram[1:n,3:5])
# y <- as.matrix(downs_vectorcardiogram[1:n,6:8])
# m <- rotvector(cbind(x,y,cross(x,y)))
# mo <- as(m, 'rotmatrix')
# qscatter(mo)