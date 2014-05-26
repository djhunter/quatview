# the quaternion constructor (and class) does this:
# The rows of m are 4 element unit vectors interpreted as follows: 
# the first 3 (x,y,z) define the axis
# of rotation, and the last element gives the 
# cosine of half the angle of rotation in a counter-clockwise
# direction when looking down the axis towards the origin.

# cos(t/2) + xsin(t/2)i + ysin(t/2)j + zsin(t/2)k 
#    = quaternion(-xsin(t/2),-ysin(t/2),-zsin(t/2),t)

# wxyztoquat  <- function(TODO)
# quattowxyz  <- function(TODO)
eru <- quaternion(c(0,0,-sin(piin8),cos(pi/8)))
meru <- as(eru,'rotmatrix')
