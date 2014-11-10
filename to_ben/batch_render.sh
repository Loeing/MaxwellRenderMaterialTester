#!/bin/bash

# the maxwell scenes(.mxs files) are under the folder MXS_DIR  and named with the form of "MXS_DIR/FRAME_ID.mxs" (1.mxs, 2.mxs)
MXS_DIR=$1 
MAX_FRAME_ID=29
for frameId in $( seq 0 $MAX_FRAME_ID) # iterate all frame id 
do 
	name="FRAME${frameId}"
    pzMxs="${MXS_DIR}/FRAME${frameId}.mxs"
    # submit job 
    # suggestion: man qsub or google qsub to undestanding the meaning of flags like -l/-v  
    qsub -N "${name}"  -l walltime=23:00:00 -l nodes=1:ppn=1 -v MXS_PATH=$pzMxs ./render_one_file.sh
done