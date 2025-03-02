#!/usr/bin/python3
import glob
import json
import os

PREAMBLE = """/* MEOW */
import geometry;
void filldraw(picture pic = currentpicture, conic g, pen fillpen=defaultpen, pen drawpen=defaultpen)
    { filldraw(pic, (path) g, fillpen, drawpen); }
void fill(picture pic = currentpicture, conic g, pen p=defaultpen)
    { filldraw(pic, (path) g, p); }
// some geometry
pair foot(pair P, pair A, pair B) { return foot(triangle(A,B,P).VC); }
pair centroid(pair A, pair B, pair C) { return (A+B+C)/3; }
// cse5 abbreviations
path CP(pair P, pair A) { return circle(P, abs(A-P)); }
path CR(pair P, real r) { return circle(P, r); }
pair IP(path p, path q) { return intersectionpoints(p,q)[0]; }
pair OP(path p, path q) { return intersectionpoints(p,q)[1]; }
path Line(pair A, pair B, real a=0.6, real b=a) { return (a*(A-B)+A)--(b*(B-A)+B); }
// cse5 more useful functions
picture CC() {
    picture p=rotate(0)*currentpicture;
    currentpicture.erase();
    return p;
}
pair MP(Label s, pair A, pair B = plain.S, pen p = defaultpen) {
    Label L = s;
    L.s = "$"+s.s+"$";
    label(L, A, B, p);
    return A;
}
pair Drawing(Label s = "", pair A, pair B = plain.S, pen p = defaultpen) {
    dot(MP(s, A, B, p), p);
    return A;
}
path Drawing(path g, pen p = defaultpen, arrowbar ar = None) {
    draw(g, p, ar);
    return g;
}


size(500);
dotfactor *= 2;
defaultpen(fontsize(18pt));

"""

TMP = "/tmp/guessr/"


def createDiagram(dir_name, file_name, ext):
    filesrc = "asy-sources/" + dir_name + "/" + file_name + "." + ext
    filebase = "diagrams/" + file_name
    filetmp = TMP + file_name + ".tmp"
    filetmpasy = TMP + file_name + ".tmpasy"
    filenewasy = TMP + file_name + ".asy"
    filejson = "diagrams/" + file_name + ".json"

    # If already created and older, skip it
    if os.path.isfile(filejson):
        if os.path.getmtime(filejson) > os.path.getmtime(filesrc):
            return 0

    if ext == "asy":
        fileoldasy = filesrc
    elif ext == "tsq":
        # I'm sorry! Evan's dotfiles are on Github, so...
        os.system(
            f"cat {filesrc} | python3 ~/dotfiles/py-scripts/tsq.py > {filetmpasy}"
        )
        fileoldasy = filetmpasy
    elif ext == "tsqx":
        os.system(
            f"cat {filesrc} | python3 ~/dotfiles/py-scripts/tsqx.py > {filetmpasy}"
        )
        fileoldasy = filetmpasy
    else:
        print("WARNING: ignoring unknown %s" % filesrc)
        return -1  # I don't know how to deal with this!

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
            if line.startswith("Source:"):
                source = line[7:].strip()
            elif line.startswith("Points:"):
                line = line[7:].strip()
                pts_list = line.split()
            elif line.startswith("Item:"):
                line = line[5:].strip()
                item_list.append(line.split())
            elif line.startswith("Text:"):
                line = line[5:].strip()
                text += line + "<br>"
        text = text.strip()
        text = json.dumps(text)

    with open(filenewasy, "w") as w:
        print(PREAMBLE, file=w)
        print(orig_asy_content, file=w)
        for pt in pts_list:
            print('write("Point: %s," + (string) %s);' % (pt, pt), file=w)
        print(
            'write("umin " + (string) min(currentpicture, user=true));', file=w
        )  # User coordinates
        print('write("umax " + (string) max(currentpicture, user=true));', file=w)
        print(
            'write("pmin " + (string) min(currentpicture, user=false));', file=w
        )  # PS coordinates
        print('write("pmax " + (string) max(currentpicture, user=false));', file=w)
    command = f"asy -f pdf -o {filebase} {filenewasy} > {filetmp};\nmagick {filebase}.pdf {filebase}.png"
    print(command)
    os.system(command)

    # reading tmp file from asymptote
    pts_coor = []
    min_list = []
    max_list = []

    pxmin: float | None = None
    pymin: float | None = None
    pxmax: float | None = None
    pymax: float | None = None

    with open(filetmp, "r") as r:
        for line in r:
            if line.startswith("Point: "):
                line = line[7:].strip()
                pts_coor.append(line.split(","))
            elif line.startswith("umin "):
                min_list = line[4:].strip().split(",")
            elif line.startswith("umax "):
                max_list = line[4:].strip().split(",")
            elif line.startswith("pmin "):
                pmin_list = line[4:].strip().split(",")
                pxmin = float(pmin_list[0][1:])
                pymin = float(pmin_list[1][:-1])
            elif line.startswith("pmax "):
                pmax_list = line[4:].strip().split(",")
                pxmax = float(pmax_list[0][1:])
                pymax = float(pmax_list[1][:-1])

    # writing json file
    g = open(filejson, "w")
    g.write("{\n")
    g.write('"points" : [\n')
    print(
        ",\n".join(
            ['["%s", %s, %s]' % (pt[0], pt[1][1:], pt[2][:-1]) for pt in pts_coor]
        ),
        file=g,
    )
    print("],", file=g)

    print('"min" : [%s,%s],' % (min_list[0][1:], min_list[1][:-1]), file=g)
    print('"max" : [%s,%s],' % (max_list[0][1:], max_list[1][:-1]), file=g)

    print('"items" : [', file=g)
    print(
        ",\n".join(
            ["[" + ",".join(['"%s"' % p for p in ls]) + "]" for ls in item_list]
        ),
        file=g,
    )
    print("],", file=g)

    assert pxmin is not None
    assert pymin is not None
    assert pxmax is not None
    assert pymax is not None
    print('"source" : "%s",' % (source), file=g)
    print('"filename" : "%s",' % (file_name), file=g)
    print('"width" : "%f",' % (pxmax - pxmin), file=g)
    print('"height" : "%f",' % (pymax - pymin), file=g)
    print('"text" : %s' % (text), file=g)  # json dump'ed, no quotes
    print("}", file=g)
    return 1


if __name__ == "__main__":
    diagram_index = {}
    os.system("mkdir -p " + TMP)

    for s in glob.iglob("asy-sources/*/*"):
        # e.g. dir_name = 001-Demo, file_name = 1-Thale
        junk, dir_name, file_name_full = s.split("/")
        i = file_name_full.rfind(".")
        file_name = file_name_full[:i]  # remove .asy extension
        extension = file_name_full[i + 1 :]
        createDiagram(dir_name, file_name, extension)

        if dir_name not in diagram_index:
            diagram_index[dir_name] = []
        diagram_index[dir_name].append(file_name)

    episodes = []
    for dir_name, filenames in sorted(diagram_index.items()):
        # strip leading number, convert dashes to spaces
        ep_name = dir_name.replace("-", ": ", 1).replace("-", " ")
        episodes.append("'" + ep_name + "': " + str(sorted(filenames)))

    with open("js/episode-index.js", "w") as f:
        print("EPISODES = {", file=f)
        print("\t" + ",\n\t".join(episodes), file=f)
        print("\t};", file=f)
