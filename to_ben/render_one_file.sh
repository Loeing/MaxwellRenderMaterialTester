#!/bin/bash


module load maxwell

# see: http://support.nextlimit.com/display/mxdocsv3/Command+Line
maxwell -nogui -nowait -verbose:4 -sl:18 -trytoresume -motionblur:off -mxs:$MXS_PATH

