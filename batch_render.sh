#!/bin/bash

MXS_DIR=$1 
NUMB_TEST=$2
ROOT_OUTPUT_DIR=$3

rm -r "$ROOT_OUTPUT_DIR"
mkdir "$ROOT_OUTPUT_DIR"

for TEST_ID in $( seq 0 $NUMB_TEST) # iterate all frame id 
do 
  name="$TEST_ID"
  CURRENT_MXS_PATH="${MXS_DIR}/TEST${TEST_ID}.mxs"
  CURRENT_OUTPUT_DIR="$ROOT_OUTPUT_DIR/TEST${TEST_ID}"
  mkdir "$CURRENT_OUTPUT_DIR"
  qsub -N "${name}"  -l walltime=23:00:00 -l nodes=1:ppn=1 -v MXS_PATH=$CURRENT_MXS_PATH OUTPUT_DIR=$CURRENT_OUTPUT_DIR ./render_one_file.sh
done