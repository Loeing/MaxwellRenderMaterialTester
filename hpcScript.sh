cd $HOME/Documents/maxwellRender/mxs/

NUMBER_OF_TESTS = $1

counter = 1

while [ $counter -lt $NUMBER_OF_TESTS ]
do
	/.renderTest $counter
	counter = `expr $counter + 1`
done