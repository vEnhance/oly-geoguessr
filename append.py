import re
import os
import shutil

filename = "orthocenter"
fileasy = filename + ".asy"
filenewasy = filename + "_temp.asy"
filejson = filename + ".json"
with open(fileasy, 'r') as r:
	pts_list = []
	tuple_list = []
	shutil.copyfile(fileasy, filenewasy);
	for line in r:
		if line.startswith('Source:'):
			source = line.strip('Source: ')
		elif line.startswith('Points:'):
			line = line.strip('Points: ')
			pts_list = line.split()
		elif line.startswith('Tuple:'):
			line = line.strip('Tuple: ').strip()
			tuple_list.append(line.split())

with open(filenewasy, 'a') as w:
	print >>w, "file fout = output(%s);" %(filename + ".txt")
	for pt in pts_list:
		print >>w, "write(fout, 'Point: %s ' + (string) %s);" %pt
	print >>w, "write(fout, 'min ' + (string) min(currentpicture, user=true));"
	print >>w, "write(fout, 'max ' + (string) max(currentpicture, user=true));"
	os.system("asy -f png %s -o %s.png" %(filenewasy, filename))

#reading txt file from asymptote
pts_coor = []
min_list = []
max_list = []
r = open(filename + ".txt")
for line in r:
	if line.startswith('Point: '):
		line = line.strip('Point: ')
		pts_coor.append(line.split(","))
	elif line.startswith('min '):
		line = line.strip('min ')
		min_list = line.split(",")
	elif line.startswith('max '):
		line = line.strip('max ')
		max_list = line.split(",")	

#writing json file
g = open(filejson, 'a')
g.write('{\n')
g.write('\t"points" : {\n')
print >>g, ',\n'.join([ '["%s", %s, %s]' %(pt[0], pt[1][1:], pt[2][:-1]) for pt in pts_coor ])
print >>g, '},'

print >>g, '"min" : [%s,%s],' %(min_list[0][1:], min_list[1][:-1])
print >>g, '"max" : [%s,%s],' %(max_list[0][1:], max_list[1][:-1])

print >>g, '"tuples" : ['
print >>g, ',\n'.join([ '['+','.join(ls)+']' for ls in tuple_list ])
print >>g, '],'

print >>g, '"source" : "%s"' %(source)
print >>g, '"filename" : "%s"' %(filename)
print >>g, '}'
