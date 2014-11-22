#!/bin/bash

# usage:
# ./render_all_files.sh mxs_dir numb_test root_output_dir
# 
# This script assume all maxwell studio files are under mxs_dir and named in form of nTest.mxs(n=0, 1, ..., numb_test)
# It iterates all test file under mxs_dir, and output results to root_output_dir
# 
MXS_DIR=$1 
NUMB_TEST=$2
ROOT_OUTPUT_DIR=$3

rm -r "$ROOT_OUTPUT_DIR"
mkdir "$ROOT_OUTPUT_DIR"
module load maxwell

for TEST_ID in $( seq 1 $NUMB_TEST) # iterate all mxs files
do 
  name="$TEST_ID"
  CURRENT_MXS_PATH="${MXS_DIR}/${TEST_ID}Test.mxs"
  CURRENT_OUTPUT_DIR="$ROOT_OUTPUT_DIR/${TEST_ID}Test"

  mkdir "$CURRENT_OUTPUT_DIR"

  echo "CURRENT_MXS_PATH    : ${CURRENT_MXS_PATH}"
  echo "CURRENT_OUTPUT_DIR  : ${CURRENT_OUTPUT_DIR}"

  qsub -N "${name}"  -l walltime=23:00:00 -l nodes=1:ppn=1 -v MXS_PATH=$CURRENT_MXS_PATH,OUTPUT_DIR=$CURRENT_OUTPUT_DIR ./record_render_time.sh
done
