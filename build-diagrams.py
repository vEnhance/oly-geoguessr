import re
import os
import shutil

def createDiagram(filename):
	fileasy = "asy-sources/" + filename + ".asy"
	filepng = "diagrams/" + filename + ".png"
	filetxt = "/tmp/" + filename + ".txt"
	filenewasy = "/tmp/" + filename + "_temp.asy"
	filejson = "diagrams/" + filename + ".json"

	with open(fileasy, 'r') as r:
		pts_list = []
		tuple_list = []
		shutil.copyfile(fileasy, filenewasy);
		for line in r:
			line = line.strip()
			if line.startswith('Source:'):
				source = line.strip('Source: ')
			elif line.startswith('Points:'):
				line = line.strip('Points: ')
				pts_list = line.split()
			elif line.startswith('Tuple:'):
				line = line.strip('Tuple: ').strip()
				tuple_list.append(line.split())

	with open(filenewasy, 'a') as w:
		for pt in pts_list:
			print >>w, "write(\"Point: %s,\" + (string) %s);" %(pt, pt)
		print >>w, "write(\"umin \" + (string) min(currentpicture, user=true));" # User coordinates
		print >>w, "write(\"umax \" + (string) max(currentpicture, user=true));"
		print >>w, "write(\"pmin \" + (string) min(currentpicture, user=false));" # PS coordinates
		print >>w, "write(\"pmax \" + (string) max(currentpicture, user=false));"
	command = "asy -f png -o %s %s > %s" %(filepng, filenewasy, filetxt)
	print command
	os.system(command)

	#reading txt file from asymptote
	pts_coor = []
	min_list = []
	max_list = []
	r = open(filetxt, "r")
	for line in r:
		if line.startswith('Point: '):
			line = line.strip('Point: ').strip()
			pts_coor.append(line.split(","))
		elif line.startswith('umin '):
			min_list = line.strip('umin ').strip().split(",")
		elif line.startswith('umax '):
			max_list = line.strip('umax ').strip().split(",")
		elif line.startswith('pmin '):
			pmin_list = line.strip('pmin ').strip().split(",")
			pxmin = float(pmin_list[0][1:])
			pymin = float(pmin_list[1][:-1])
		elif line.startswith('pmax '):
			pmax_list = line.strip('pmax ').strip().split(",")
			pxmax = float(pmax_list[0][1:])
			pymax = float(pmax_list[1][:-1])

	#writing json file
	g = open(filejson, 'w')
	g.write('{\n')
	g.write('"points" : [\n')
	print >>g, ',\n'.join([ '["%s", %s, %s]' %(pt[0], pt[1][1:], pt[2][:-1]) for pt in pts_coor ])
	print >>g, '],'

	print >>g, '"min" : [%s,%s],' %(min_list[0][1:], min_list[1][:-1])
	print >>g, '"max" : [%s,%s],' %(max_list[0][1:], max_list[1][:-1])

	print >>g, '"tuples" : ['
	print >>g, ',\n'.join([ '['+','.join(['"%s"' %p for p in ls])+']' for ls in tuple_list ])
	print >>g, '],'

	print >>g, '"source" : "%s",' %(source)
	print >>g, '"filename" : "%s",' %(filename)
	print >>g, '"width" : "%f",' %(pxmax-pxmin)
	print >>g, '"height" : "%f"' %(pymax-pymin)
	print >>g, '}'


if __name__ == "__main__":
	createDiagram("demo1")
	createDiagram("demo2")
	createDiagram("orthocenter")
