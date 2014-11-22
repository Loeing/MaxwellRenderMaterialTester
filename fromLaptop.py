from pymaxwell import *
from datetime import datetime
import os

def run_maxwell_render():
 	parameters = []
 	parameters.append('-mxs:' + destpath)
 	parameters.append('-res:300x200')
 	parameters.append('-time:10')
 	parameters.append('-sl:5')
	runMaxwell(parameters)
 	return 1
scenePath = 'C:\Users\Joshua\Documents\std_test_scene\demo.mxs'
matPath = 'C:\Program Files\Next Limit\Maxwell 3\materials database\mxm files\\'
scene = Cmaxwell(mwcallback)
scene.readMXS(scenePath)
mainobject = scene.getObject('object')
#ringobject = scene.getObject('Material (Ring)')
i = 1
for filename in os.listdir(matPath):
 	print(matPath + filename)
 	material = scene.createMaterial("TestedMaterial", True)
 	layer = material.addLayer()
 	bsdf = layer.addBSDF()
	ok = material.read(matPath + filename)
	print(ok)
	if ok == 1:
		print(material.getName())
		print(mainobject.setMaterial(material))
		#print(ringobject.setMaterial(material))
		destPath = "C:\Users\Joshua\Dropbox\Scenes\{0}SimpleTest.mxs".format(i)
 		scene.writeMXS(destPath)
		i += 1
