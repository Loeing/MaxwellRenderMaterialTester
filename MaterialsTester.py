from pymaxwell import *
import os

def run_maxwell_render():
	parameters = []
	
	parameters.append('-mxs:C:\Users\Joshua\workspace\MaxwellScenes\Test.mxs')
	parameters.append('-res:300x200')
	parameters.append('-time:10')
	parameters.append('-sl:5')
	
	runMaxwell(parameters)
	return 1


scene = Cmaxwell(mwcallback)
scene.readMXS('C:\Users\Joshua\Documents\MatScene\standardmattest.mxs')
mainobject = scene.getObject('Material (Main)')
ringobject = scene.getObject('Material (Ring)')
i = 1
matPath = 'C:\Program Files\Next Limit\Maxwell 3\materials database\mxm files\\'
for filename in os.listdir('C:\Program Files\Next Limit\Maxwell 3\materials database\mxm files'):
	print(matPath + filename)
	#scene.addMaterial(material.read(filename))
	material = scene.createMaterial("TestedMaterial", True)
	layer = material.addLayer()
	bsdf = layer.addBSDF()
	print(material.read(matPath + filename))	  
	#print(CMaxwellMaterial.getMxmInfo(filename))
	print(material.getName())
	print(mainobject.setMaterial(material))
	print(ringobject.setMaterial(material))
	path = "C:\Users\Joshua\Documents\GitHub\MaxwellRenderMaterialTester\Test\{0}Test.mxs".format(i)
 	scene.writeMXS(path)
	i += 1
	#run_maxwell_render()
	






