#!/bin/bash

echo $MXS_PATH    # the mxs file
echo $OUTPUT_DIR  # the output directory


#loading the maxwell module
module load maxwell

#final sampling level
FINAL_SL_LEVEL=30

#iterate each sample level
for SL in $( seq 2 2 $FINAL_SL_LEVEL) 
do
  #record start time
  START=$(date +%s) 
  
  #use maxwell render to render mxs 
  maxwell -nogui -nowait -trytoresume -mxs:"${MXS_PATH}" -res:256x256 -sl:$SL -mxi:"${OUTPUT_DIR}/default.mxi" -output:"${OUTPUT_DIR}/default.png" -dep:"/usr/local/maxwell-3.0/materials database/textures"
  
  #save current render result
  cp "${OUTPUT_DIR}/default.png" "${OUTPUT_DIR}/${SL}.png"
  
  # record stop time
  END=$(date +%s) 
  
  # compute render time 
  DIFF=$(( $END - $START ))
  
  # save the render time out 
  echo $SL:$DIFF >> "$OUTPUT_DIR/record.txt"
  
done
