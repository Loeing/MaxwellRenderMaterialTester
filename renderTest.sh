#mxs path
TEST_NUMBER = $1
MXS_PATH = '${HOME}/Documents/maxwellRender/mxs/${TEST_NUMBER}test.mxs'
RENDER_TIMES_FILENAME = '${TEST_NUMBER}render_times.txt'

START_TIME_DATE_FORMAT = '%n start time=%T'
END_TIME_DATE_FORMAT = '%n end time=%T'



#going to the directory of maxwell.
cd $HOME/Documents/maxwellRender/mxs/

vi $RENDER_TIMES_FILENAME <<EndOfCommands
i
^[
ZZ
EndOfCommands

#loading the maxwell module
module load maxwell

#sampling level variable
SL_LEVELS=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
#final sampling level

for SL in SL_LEVELS
do
	echo 'SL ${SL}' >> $RENDER_TIMES_FILENAME
	echo date --date=$START_TIME_DATE_FORMAT >> $RENDER_TIMES_FILENAME
	DIRECTORY=dirs
	maxwell -mxs:'${MXS_PATH}' -res:64x64 -sl:$SL_LEVEL -o:'${DIRECTORY}/img${TEST_NUMBER}_${SL}.png'
	echo date --date=$END_TIME_DATE_FORMAT >> $RENDER_TIMES_FILENAME
done

