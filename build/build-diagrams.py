#!/usr/bin/python2
import re
import os
import glob
import shutil

def createDiagram(dir_name, file_name):
	fileasy = "asy-sources/" + dir_name + '/' + file_name + ".asy"
	filepng = "diagrams/" + file_name + ".png"
	filetxt = "/tmp/" + file_name + ".txt"
	filenewasy = "/tmp/" + file_name + ".asy"
	filejson = "diagrams/" + file_name + ".json"

	with open(fileasy, 'r') as r:
		pts_list = []
		item_list = []
		shutil.copyfile(fileasy, filenewasy);
		for line in r:
			line = line.strip()
			if line.startswith('Source:'):
				source = line[7:].strip()
				print source
			elif line.startswith('Points:'):
				line = line[7:].strip()
				pts_list = line.split()
			elif line.startswith('Item:'):
				line = line[5:].strip()
				item_list.append(line.split())

	with open(filenewasy, 'a') as w:
		for pt in pts_list:
			print >>w, "write(\"Point: %s,\" + (string) %s);" %(pt, pt)
		print >>w, "write(\"umin \" + (string) min(currentpicture, user=true));" # User coordinates
		print >>w, "write(\"umax \" + (string) max(currentpicture, user=true));"
		print >>w, "write(\"pmin \" + (string) min(currentpicture, user=false));" # PS coordinates
		print >>w, "write(\"pmax \" + (string) max(currentpicture, user=false));"
	command_asy = "asy -f png -o %s %s > %s" %(filepng, filenewasy, filetxt)
	print command_asy
	os.system(command_asy)

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

	print >>g, '"items" : ['
	print >>g, ',\n'.join([ '['+','.join(['"%s"' %p for p in ls])+']' for ls in item_list ])
	print >>g, '],'

	print >>g, '"source" : "%s",' %(source)
	print >>g, '"filename" : "%s",' %(file_name)
	print >>g, '"width" : "%f",' %(pxmax-pxmin)
	print >>g, '"height" : "%f"' %(pymax-pymin)
	print >>g, '}'


if __name__ == "__main__":
	diagram_index = {}

	for s in glob.iglob("asy-sources/*/*.asy"):
		junk, dir_name, file_name = s.split('/') #e.g. dir_name = 001-Demo, file_name = 1-Thale
		file_name = file_name[:-4] # remove .asy extension
		createDiagram(dir_name, file_name)

		if not diagram_index.has_key(dir_name):
			diagram_index[dir_name] = []
		diagram_index[dir_name].append(file_name)

	episodes = []
	for dir_name, filenames in sorted(diagram_index.iteritems()):
		# strip leading number, convert dashes to spaces
		ep_name = dir_name.replace("-",": ",1).replace("-", " ")
		episodes.append("'"+ep_name+"': " + str(sorted(filenames)))
	
	with open("js/episode-index.js", "w") as f:
		print >>f, "EPISODES = {"
		print >>f, '\t' + ',\n\t'.join(episodes)
		print >>f, "\t};"
