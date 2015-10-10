CANVAS_HEIGHT = 700
CANVAS_WIDTH  = 700
CURRENT_DIAGRAM = null

class Point
	constructor: (@name, @x, @y) ->
		# no need to do anything, lol!

class Diagram
	constructor: (json_array) ->
		@points = {}
		for point_array in json_array["points"]
			@points[point_array[0]] = new Point(point_array[0], point_array[1], point_array[2])
		@min = new Point(json_array["min"][0], json_array["min"][1], json_array["min"][2])
		@max = new Point(json_array["max"][0], json_array["max"][1], json_array["max"][2])
		@tuples = json_array["tuples"]
		@source = json_array["source"]
		@filename = json_array["filename"]

toImg = (filename) ->
	"diagrams/" + filename + ".png"
toJSON = (filename) ->
	"diagrams/" + filename + ".json"

loadDiagram = (filename) ->
	$("#puru").css "background", "url(" + toImg(filename) + ") no-repeat"
	$.getJSON(toJSON(filename), (data, status, xhr) ->
		console.log "Success"
		console.log data
		CURRENT_DIAGRAM = new Diagram(data)
		console.log CURRENT_DIAGRAM)
	.error( # chain
		(jqXhr, textStatus, error) ->
			alert textStatus + " : " + error
	)

	console.log toJSON(filename)

$ ->
	canvas_elm = $("<canvas></canvas>")
	canvas_elm.attr "height", CANVAS_HEIGHT
	canvas_elm.attr "width",  CANVAS_WIDTH
	canvas_elm.attr "id", "puru"
	canvas_elm.css "background-repeat", "no-repeat"
	canvas = canvas_elm.get(0).getContext("2d")

	canvas_elm.appendTo($("#canvas_site"))

	canvas_elm.click (e) ->
		console.log (e.pageX - this.offsetLeft) + " " + (e.pageY - this.offsetTop)

	loadDiagram "orthocenter"
