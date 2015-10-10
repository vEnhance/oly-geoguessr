CANVAS_HEIGHT = 700
CANVAS_WIDTH  = 700
SENSITIVITY = 30
CANVAS = null
CONTEXT = null

diagram = null
active = []

# Geometry {{{
class Point
	constructor: (@name, @x, @y) ->
		# no need to do anything, lol!
class Diagram
	constructor: (json_array) ->
		umin = json_array["min"][0]
		umax = json_array["max"][0]
		vmin = json_array["min"][1]
		vmax = json_array["max"][1]
		width = json_array["width"]
		height = json_array["height"]
		@points = {}
		@flat_points = []
		for point_array in json_array["points"]
			pu = point_array[1]
			pv = point_array[2]
			px = width * (pu-umin)/(umax-umin)
			py = height * (vmax-pv)/(vmax-vmin)
			p = new Point(point_array[0], px, py)
			@points[point_array[0]] = p
			@flat_points.push(p)
		@tuples = json_array["tuples"]
		@source = json_array["source"]
		@filename = json_array["filename"]

dist = (p, q) ->
	Math.pow(Math.pow(p.x-q.x, 2) + Math.pow(p.y-q.y, 2), 0.5)

toImg = (filename) ->
	"diagrams/" + filename + ".png"
toJSON = (filename) ->
	"diagrams/" + filename + ".json"

loadDiagram = (filename) ->
	CANVAS.css "background", "url(" + toImg(filename) + ") no-repeat"
	$.getJSON(toJSON(filename), (data, status, xhr) -> diagram = new Diagram(data))
	.error( # chain
		(jqXhr, textStatus, error) ->
			alert textStatus + " : " + error
	)
# }}}
# Canvas art {{{
# Low-level things
drawCircle = (p, color = "blue", r = 10) ->
	CONTEXT.beginPath()
	CONTEXT.arc p.x, p.y, r, 0, 2 * Math.PI
	CONTEXT.strokeStyle = color
	CONTEXT.stroke()
fillCircle = (p, color = "blue", r = 10) ->
	CONTEXT.beginPath()
	CONTEXT.arc p.x, p.y, r, 0, 2 * Math.PI
	CONTEXT.fillStyle = color
	CONTEXT.fill()
clearAll = () ->
	CONTEXT.clearRect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT)
# High-level things
markAllActive = () ->
	clearAll()
	for p in active
		fillCircle(p, color="blue", r=3)
		drawCircle(p, color="blue", r=20)
# }}}
# Click and game handler {{{
toggle = (p) ->
	if not (p in active)
		active.push(p)
	else
		active.splice(active.indexOf(p), 1)
	markAllActive()
onClick = (e) ->
	o = new Point("", e.pageX-this.offsetLeft, e.pageY-this.offsetTop) # where user clicked
	# Now, check, to see if any point is close enough, if so circle it
	diagram.flat_points.sort( (p,q) -> dist(o,p)-dist(o,q) )
	p = diagram.flat_points[0]
	if dist(o,p) < SENSITIVITY
		toggle p
# }}}

# Main function {{{
$ ->
	CANVAS = $("<CANVAS></CANVAS>")
	CANVAS.attr "height", CANVAS_HEIGHT
	CANVAS.attr "width",  CANVAS_WIDTH
	CANVAS.attr "id", "puru"
	CANVAS.css "background-repeat", "no-repeat"
	CONTEXT = CANVAS.get(0).getContext("2d")

	CANVAS.appendTo($("#canvas_site"))

	CANVAS.click onClick

	loadDiagram "orthocenter"
# }}}

# vim: fdm=marker
