#!/bin/bash

echo $MXS_PATH 
echo $OUTPUT_DIR


#loading the maxwell module
module load maxwell

#final sampling level
FINAL_SL_LEVEL=5
for SL in $( seq 1 $FINAL_SL_LEVEL) 
do
	START=$(date +%s)
	time maxwell -nogui -nowait -verbose:0 -trytoresume -motionblur:off -mxs:"${MXS_PATH}" -res:64x64 -sl:$SL -o:"${OUTPUT_DIR}/${SL}.png" >> "$OUTPUT_DIR/times.txt"
	END=$(date +%s)
  DIFF=$(( $END - $START ))
  echo $DIFF >> "$OUTPUT_DIR/record.txt"
done