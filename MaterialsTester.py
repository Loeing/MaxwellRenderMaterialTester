from pymaxwell import *

def run_maxwell_render():
	parameters = []
	
	parameters.append('-mxs:C:\Users\Joshua\Documents\GitHub\MaxwellRenderMaterialTester\MatScene\standardmattest.mxs')
	parameters.append('-res:300x200')
	parameters.append('-time:10')
	parameters.append('-sl:5')
	
	runMaxwell(parameters)
	return 1

scene = Cmaxwell(mwcallback)
scene.readMXS('C:\Users\Joshua\Documents\GitHub\MaxwellRenderMaterialTester\MatScene\standardmattest.mxs')
it = CmaxwellMaterialIterator()
material = it.first( scene )
run_maxwell_render()
while not material.isNull():
	run_maxwell_render()
	material = it.next()






