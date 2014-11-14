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
scene.readMXS('C:\Users\Joshua\Documents\GitHub\MaxwellRenderMaterialTester\MatScene\standardmattest.mxs')
mainobject = scene.getObject('Material (Main)')
ringobject = scene.getObject('Material (Ring)')
material = scene.createMaterial('TestedMaterial', False);
layer = material.addLayer();
bsdf = layer.addBSDF();
i = 1
matPath = 'C:\Program Files\Next Limit\Maxwell 3\materials database\mxm files\fileswall_concrete.mxm'
print(matPath)
#scene.addMaterial(material.read(filename))
print(material.read('C:\Program Files\Next Limit\Maxwell 3\materials database\mxm files\fileswall_concrete.mxm'))		  
#print(CMaxwellMaterial.getMxmInfo(filename))
print(material.getName())
print(material.getAttribute('TestedMaterial'))
print(mainobject.setMaterial(material))
print(ringobject.setMaterial(material))
path = "C:\Users\Joshua\Documents\GitHub\MaxwellRenderMaterialTester\Test\{0}Test.mxs".format(i)
scene.writeMXS(path)
#run_maxwell_render()	