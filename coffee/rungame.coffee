CANVAS_HEIGHT = 700
CANVAS_WIDTH  = 700
SENSITIVITY = 50
CANVAS = null
CONTEXT = null

game = null

# Aux {{{
del = (arr, x) -> # no return value
	arr.splice(arr.indexOf(x), 1) # delete p

pointSort = (arr) ->
	arr.sort((p,q) -> p.i - q.i)


# }}}

# Model Objects {{{
class Point
	constructor: (@name, @x, @y, @i) ->
		# no need to do anything, lol!
		# The @i gives a unique ordering to each tuple
	toString: () ->
		@name
		
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
		i = 0
		for point_array in json_array["points"]
			pu = point_array[1]
			pv = point_array[2]
			px = width * (pu-umin)/(umax-umin)
			py = height * (vmax-pv)/(vmax-vmin)
			p = new Point(point_array[0], px, py, i)
			@points[point_array[0]] = p
			@flat_points.push(p)
			i += 1
		@tuples = []
		@unfound_tuples = [] # will be stringified
		for tuple in json_array["tuples"]
			sortedPointTuple = pointSort( (@points[name] for name in tuple) )
			nameTuple = (p.toString() for p in sortedPointTuple)
			@tuples.push(sortedPointTuple)
			@unfound_tuples.push(JSON.stringify(nameTuple))
			# Note different data type from @tuples
		@source = json_array["source"]
		@filename = json_array["filename"]
		@mistakes = 0
		@found = 0
		@max_found = @tuples.length
		@complete = false
		@active_points = []
	gradeTuple: (arr) ->
		stringifiedActive = JSON.stringify(
			(p.toString() for p in pointSort(arr)) )
		if stringifiedActive in @unfound_tuples
			# @active_points = [] # needs to run after UI
			@found += 1
			del(@unfound_tuples, stringifiedActive)
			return true
		else
			@mistakes += 1
			return false
	markComplete: () ->
		@complete = true
	allFound: () ->
		@found == @max_found
	assignScore: () ->
		if @allFound()
			if @mistakes <= 1
				7
			else if @mistakes <= 3
				6
			else
				5
		else
			if @found >= @max_found/2
				2
			else if @found >= @max_found/3
				1
			else
				0

class Game
	constructor: (@diagram_names) ->
		@length = @diagram_names.length
		@i = 0 # player's current progress
		@score = 0
		@diagrams = (null for [1..@length])
		@preloadDiagrams()
		@alive = true
	preloadDiagrams: () ->
		for name, i in @diagram_names
			ajaxPreloadDiagram name, @, i
	currDiagram: () ->
		if @i >= @length
			null
		@diagrams[@i]
	setDiagram: (i) ->
		@i = i
		loadDiagram(@diagrams[i])
	startGame: () ->
		@setDiagram(0)
	endGame: () ->
		@alive = false
		alert("You win, lol")
	processCorrectDone: () ->
		@currDiagram().complete = true
		if (@i + 1 < @length)
			@setDiagram(@i+1)
		else
			@endGame()
	processIncorrectDone: () ->
		@currDiagram().mistakes += 1



dist = (p, q) ->
	Math.pow(Math.pow(p.x-q.x, 2) + Math.pow(p.y-q.y, 2), 0.5)

toImg = (filename) ->
	"diagrams/" + filename + ".png"
toJSON = (filename) ->
	"diagrams/" + filename + ".json"

ajaxPreloadDiagram = (filename, game, i) ->
	$.getJSON(toJSON(filename),
		(data, status, xhr) ->
			diagram = new Diagram(data)
			game.diagrams[i] = diagram
	).error( # chain
		(jqXhr, textStatus, error) ->
			alert textStatus + " : " + error
	)

loadDiagram = (diagram) ->
	console.log("Loading")
	console.log(diagram)
	clearAll()
	updateSidebar()
	$("#head_title").html(diagram.source)
	CANVAS.css "background", "url(" + toImg(diagram.filename) + ") no-repeat"

# }}}
# Canvas art and Button UI {{{
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

# jQuery abstractions
enableButtonIf = (selector, bool) ->
	$(selector).prop('disabled', !bool)

writeSpanActivePoints = (x) ->
	$("#active_points").html(x.join(" "))
writeSpanAppendFoundTuple = (x) ->
	$("#found").append($("<li>" + x.join(" ") + "</li>"))

tempAddClass = (elm, cls, time=1000) ->
	$(elm).addClass(cls)
	removeCallback = () -> $(elm).removeClass(cls)
	setTimeout removeCallback, time


# High-level things
markAllActive = (c = "blue") ->
	clearAll()
	ap = game.currDiagram().active_points

	# Mark all selected points
	for p in ap
		fillCircle(p, color=c, r=5)
		drawCircle(p, color=c, r=30)
	writeSpanActivePoints(ap)

	# Decide whether "Check", Done button enabled
	enableButtonIf("#check_button", ap.length > 0)
	enableButtonIf("#clear_button", ap.length > 0)
	enableButtonIf("#done_button", (ap.length == 0) &&
		(game.currDiagram().found != 0))
	enableButtonIf("#stop_button", (ap.length == 0))

updateSidebar = (c = "blue") ->
	if not game.alive
		return
	diagram = game.currDiagram()
	markAllActive(c)
	writeSpanActivePoints(game.currDiagram().active_points)
	$("#mistakes").html(game.currDiagram().mistakes)
	$("#progress").html((game.i+1) + " / "  +game.length)

sidebarClearForNextDiagram = () ->
	$("#active_points").empty()
	$("#found").empty()

startGameUI = () ->
	CANVAS = $("<canvas></canvas>")
	CANVAS.attr "height", CANVAS_HEIGHT
	CANVAS.attr "width",  CANVAS_WIDTH
	CANVAS.click onDiagramClick

	CONTEXT = CANVAS.get(0).getContext("2d")

	console.log("Starting game")
	$("#site").empty()
	$("#site").append(CANVAS)
	$("#check_button").click onCheckButtonClick
	$("#clear_button").click onClearButtonClick
	$("#done_button").click onDoneButtonClick
	$("#stop_button").click onStopButtonClick

# }}}
# Click handler {{{
toggle = (p) ->
	diagram = game.currDiagram()
	if not (p in diagram.active_points)
		diagram.active_points.push(p)
	else
		del(diagram.active_points, p)
	markAllActive()

onDiagramClick = (e) ->
	diagram = game.currDiagram()
	o = new Point("", e.pageX-this.offsetLeft, e.pageY-this.offsetTop)
		# where user clicked
	# Grab the closest point to the click
	diagram.flat_points.sort( (p,q) -> dist(o,p)-dist(o,q) )
	p = diagram.flat_points[0]
	if dist(o,p) < SENSITIVITY
		toggle p

onCheckButtonClick = (e) ->
	diagram = game.currDiagram()
	clone = diagram.active_points.slice(0) # I hate JS
	if diagram.gradeTuple(clone)
		# Highlight green momentarily
		markAllActive("green")
		tempAddClass "#check_button", "button_green"
		writeSpanAppendFoundTuple(diagram.active_points)
		diagram.active_points = []
		setTimeout updateSidebar, 400
	else
		tempAddClass "#check_button", "button_red"
		updateSidebar("red")

onClearButtonClick = (e) ->
	diagram = game.currDiagram()
	diagram.active_points = []
	updateSidebar()

onDoneButtonClick = (e) ->
	diagram = game.currDiagram()
	if diagram.allFound()
		tempAddClass "#done_button", "button_green"
		game.processCorrectDone()
		if game.alive # still alive ~
			sidebarClearForNextDiagram()
			updateSidebar()
	else
		tempAddClass "#done_button", "button_red"
		game.processIncorrectDone()
		updateSidebar()

onStopButtonClick = (e) ->
	if (confirm("Are you sure you want to give up?"))
		game.startNextDiagram()

# }}}

# Main function {{{
$ ->
	game = new Game(["demo1"])
	console.log(game)
	$("[type=button]").prop("disabled", true)
	$("#start_game").prop("disabled", false)

	$("#start_game").click ->
		startGameUI()
		game.startGame()

# }}}
# vim: fdm=marker
