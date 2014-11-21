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
	 maxwell -nogui -nowait -trytoresume -mxs:"${MXS_PATH}" -res:128x128 -sl:$SL -o:"${OUTPUT_DIR}/${SL}.png"
	END=$(date +%s)
  DIFF=$(( $END - $START ))
  echo $SL:$DIFF >> "$OUTPUT_DIR/record.txt"
done
