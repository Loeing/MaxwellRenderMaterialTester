from pymaxwell import *
from datetime import datetime
import os

def run_maxwell_render():
	parameters = []
	
	parameters.append('-mxs:' + destpath)
	parameters.append('-res:300x200')
	parameters.append('-time:10')
	parameters.append('-sl:{0}'.format(sl))
	
	runMaxwell(parameters)
	return 1

scenePath = 'C:\Users\Joshua\Documents\MatScene\standardmattest.mxs'
matPath = 'C:\Program Files\Next Limit\Maxwell 3\materials database\mxm files\\'
scene = Cmaxwell(mwcallback)
scene.readMXS(scenePath)
mainobject = scene.getObject('Material (Main)')
ringobject = scene.getObject('Material (Ring)')
i = 1
slList =  [6,8,10,12,14,16,18,20,22,24,26,28,30]
f = open('workfile', 'w')
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
		print(ringobject.setMaterial(material))
		for sl in slList:
			destPath = "C:\Users\Joshua\Documents\MatScene\{0}{1}Test.mxs".format(filename,sl)
 			scene.writeMXS(destPath)
			begin = datetime.now()
			run_maxwell_render()
			time = datetime.now() - begin
			#f.print("Material:{0}{}")
		i += 1
f.close()