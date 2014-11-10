from pymaxwell import *
scene = Cmaxwell(mwcallback);
scene.readMXS('C:\Users\Joshua\Dropbox\shared\StandardMatScene 06-29\stamdardmattest06-29-speedopt.mxs');
it = CmaxwellMaterialIterator();
material = it.first( scene );
while not material.isNull():
	
	material = it.next();