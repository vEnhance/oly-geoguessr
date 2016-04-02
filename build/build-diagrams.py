#!/usr/bin/python2
import sys, os
import re
import glob
import shutil
import json

PREAMBLE = """/* MEOW */
import olympiad;
import cse5;

size(500);
dotfactor *= 2;
defaultpen(fontsize(18pt));

"""

def createDiagram(dir_name, file_name, ext):
	filesrc = "asy-sources/" + dir_name + '/' + file_name + "." + ext
	filepdf = "diagrams/" + file_name + ".pdf"
	filesvg = "diagrams/" + file_name + ".svg"
	filetmp = "/tmp/" + file_name + ".tmp"
	filetmpasy = "/tmp/" + file_name + ".tmpasy"
	filenewasy = "/tmp/" + file_name + ".asy"
	filejson = "diagrams/" + file_name + ".json"

	# If already created and older, skip it
	if os.path.isfile(filejson):
		if os.path.getmtime(filejson) > os.path.getmtime(filesrc) \
				and os.path.getmtime(filejson) > os.path.getmtime(sys.argv[0]):
			return 0

	if ext == "asy":
		fileoldasy = filesrc
	elif ext == "txt":
		# I'm sorry! Evan's dotfiles are on Github, so...
		os.system("cat %s | python2 ~/dotfiles/py-scripts/tsq.py > %s" %(filesrc, filetmpasy))
		fileoldasy = filetmpasy
	else:
		print "WARNING: ignoring unknown %s" %filesrc
		return -1 # I don't know how to deal with this!

	orig_asy_content = ""
	# Reset variables
	source = ""
	text = ""
	pts_list = []
	item_list = []
	with open(fileoldasy, "r") as r:
		pts_list = []
		item_list = []
		for line in r:
			orig_asy_content += line
			line = line.strip()
			if line.startswith('Source:'):
				source = line[7:].strip()
			elif line.startswith('Points:'):
				line = line[7:].strip()
				pts_list = line.split()
			elif line.startswith('Item:'):
				line = line[5:].strip()
				item_list.append(line.split())
			elif line.startswith('Text:'):
				line = line[5:].strip()
				text += line + '<br>'
		text = text.strip()
		text = json.dumps(text)

	with open(filenewasy, 'w') as w:
		print >>w, PREAMBLE
		print >>w, orig_asy_content
		for pt in pts_list:
			print >>w, "write(\"Point: %s,\" + (string) %s);" %(pt, pt)
		print >>w, "write(\"umin \" + (string) min(currentpicture, user=true));" # User coordinates
		print >>w, "write(\"umax \" + (string) max(currentpicture, user=true));"
		print >>w, "write(\"pmin \" + (string) min(currentpicture, user=false));" # PS coordinates
		print >>w, "write(\"pmax \" + (string) max(currentpicture, user=false));"
	command = "asy -f pdf -o %s %s > %s;\nconvert %s %s" \
			%(filepdf, filenewasy, filetmp, filepdf, filesvg)
	print command
	os.system(command)

	#reading tmp file from asymptote
	pts_coor = []
	min_list = []
	max_list = []
	with open(filetmp, "r") as r:
		for line in r:
			if line.startswith('Point: '):
				line = line[7:].strip()
				pts_coor.append(line.split(","))
			elif line.startswith('umin '):
				min_list = line[4:].strip().split(",")
			elif line.startswith('umax '):
				max_list = line[4:].strip().split(",")
			elif line.startswith('pmin '):
				pmin_list = line[4:].strip().split(",")
				pxmin = float(pmin_list[0][1:])
				pymin = float(pmin_list[1][:-1])
			elif line.startswith('pmax '):
				pmax_list = line[4:].strip().split(",")
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
	print >>g, '"height" : "%f",' %(pymax-pymin)
	print >>g, '"text" : %s' %(text) # json dump'ed, no quotes
	print >>g, '}'
	return 1


if __name__ == "__main__":
	diagram_index = {}

	for s in glob.iglob("asy-sources/*/*"):
		junk, dir_name, file_name_full = s.split('/') #e.g. dir_name = 001-Demo, file_name = 1-Thale
		i = file_name_full.rfind('.')
		file_name = file_name_full[:i] # remove .asy extension
		extension = file_name_full[i+1:]
		createDiagram(dir_name, file_name, extension)

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
