# Uses rgl version 0.93.996, which may need to be compiled. Plots a hemisphere.

library("rgl", lib.loc="/home/dhunter/R/x86_64-pc-linux-gnu-library/3.1")
rgl.open()
rgl.bg(color="white")
rgl.clipplanes(0,1,0,.0001)
rgl.spheres(0,0,0,1,color="#000067",front="line",back="line",lwd=2,lit=FALSE)
rgl.spheres(0,0,0,1,color="#670000",alpha=0.1)
