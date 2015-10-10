import re
import os
import shutil

filename = "orthocenter"
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
	print >>w, "write(\"min \" + (string) min(currentpicture, user=true));"
	print >>w, "write(\"max \" + (string) max(currentpicture, user=true));"
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
	elif line.startswith('min '):
		line = line.strip('min ').strip()
		min_list = line.split(",")
	elif line.startswith('max '):
		line = line.strip('max ').strip()
		max_list = line.split(",")	

#writing json file
print pts_coor
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
print >>g, '"filename" : "%s"' %(filename)
print >>g, '}'
