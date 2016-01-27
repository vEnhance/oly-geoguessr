CANVAS_HEIGHT = 700
CANVAS_WIDTH  = 700
SENSITIVITY = 50
CANVAS = null
CONTEXT = null

GAME_TOTAL_TIME = 1000 * 60 * 15

game = null

# Aux {{{
del = (arr, x) -> # no return value
	arr.splice(arr.indexOf(x), 1) # delete p

pointSort = (arr) ->
	arr.sort((p,q) -> p.i - q.i)

setJSTimeout = (ms, func) -> setTimeout func, ms
setJSInterval = (ms, func) -> setInterval func, ms

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
		@found_tuples = []
		@unfound_str_tuples = [] # will be stringified
		for tuple in json_array["tuples"]
			sortedPointTuple = pointSort( (@points[name] for name in tuple) )
			nameTuple = (p.toString() for p in sortedPointTuple)
			@tuples.push(sortedPointTuple)
			@unfound_str_tuples.push(JSON.stringify(nameTuple))
			# Note different data type from @tuples
		@source = json_array["source"]
		@filename = json_array["filename"]
		@mistakes = 0
		@found = 0
		@max_found = @tuples.length
		@complete = false
		@active_points = []
		@score = 0
	gradeTuple: (arr) ->
		if not @game.isAlive()
			return false # wef the game ended
		stringifiedActive = JSON.stringify(
			(p.toString() for p in pointSort(arr)) )
		if stringifiedActive in @unfound_str_tuples
			# @active_points = [] # needs to run after UI
			@found += 1
			@found_tuples.push(arr)
			del(@unfound_str_tuples, stringifiedActive)
			return true
		else
			@mistakes += 1
			return false
	allFound: () ->
		@found == @max_found
	computeScore: () ->
		switch
			when @complete and @mistakes <= 2 then 7
			when @complete and @mistakes <= 5 then 6
			when @complete and @mistakes >  5 then 5
			when @found >= @max_found   then 4
			when @found >= @max_found/2 then 2
			when @found >= @max_found/3 then 1
			else 0
	getScore: () ->
		@score
	gradeDone: () ->
		if @complete or not @game.isAlive()
			return # What's going on
		if @allFound()
			@complete = true
			@score = @computeScore()
			@game.onDiagramComplete()
		else
			@mistakes += 1
	gradePartial: () ->
		@score = @computeScore()

class Game
	constructor: (@diagram_names) ->
		@length = @diagram_names.length
		@i = 0 # player's current progress
		@score = 0
		@completed = 0
		@diagrams = (null for [1..@length])
		@preloadDiagrams()
		@alive = true
		@total_time = GAME_TOTAL_TIME
	preloadDiagrams: () ->
		for name, i in @diagram_names
			ajaxPreloadDiagram name, @, i

	currDiagram: () ->
		if @i >= @length
			null
		@diagrams[@i]
	setDiagram: (i) ->
		@i = i
		triggerUISetDiagram()
	prevDiagram: () ->
		if @i != 0
			@setDiagram(@i-1)
	nextDiagram: () ->
		if @i != @length - 1
			@setDiagram(@i+1)

	startGame: () ->
		@start_time = performance.now()
		triggerUIStartGame()
		@setDiagram(0)
		@timeout_object = setJSInterval 1000, $.proxy(@checkTime, @) # JS :(
	endGame: () ->
		@end_time = performance.now()
		clearTimeout @timeout_object
		@alive = false
		# Give partial credit
		for diagram in @diagrams
			if not diagram.complete
				diagram.gradePartial()
				@score += diagram.getScore()
		triggerUIEndGame()
	isAlive: () ->
		@alive
	checkTime: () ->
		if performance.now() > @total_time + @start_time
			@endGame()
	getTimeLeft: () ->
		if @alive
			Math.max(0, @total_time - (performance.now() - @start_time))
		else
			Math.max(0, @total_time - (@end_time - @start_time))
	allDone: () ->
		@completed == @length
	getScore: () ->
		@score

	onDiagramComplete: () ->
		@completed += 1
		@score += @currDiagram().getScore()
		if @allDone()
			@endGame()

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
			diagram.game = game
	).error( # chain
		(jqXhr, textStatus, error) ->
			alert textStatus + " : " + error
	)


loadDiagramIntoUI = (diagram) ->
	clearAll()
	updateSidebarHard()
	$("#head_title").html(diagram.source)
	CANVAS.css "background", "url(" + toImg(diagram.filename) + ") no-repeat"

# }}}
# UI Triggers {{{
# Signals sent by model to UI, otherwise meow
triggerUISetDiagram = () ->
	loadDiagramIntoUI(game.currDiagram())

triggerUIStartGame = () ->
	CANVAS = $("<canvas></canvas>")
	CANVAS.attr "height", CANVAS_HEIGHT
	CANVAS.attr "width",  CANVAS_WIDTH
	CANVAS.click onDiagramClick
	CONTEXT = CANVAS.get(0).getContext("2d")

	$("#site").empty()
	$("#site").append(CANVAS)
	$("#check_button").click onCheckButtonClick
	$("#clear_button").click onClearButtonClick
	$("#done_button").click onDoneButtonClick
	$("#prev_button").click onPrevButtonClick
	$("#next_button").click onNextButtonClick
	updateTimeLeftForever()

triggerUIEndGame = () ->
	if !game.allDone() # user ran out of time
		slowWarningAlert("Game Over!",
			"Your game has ended.<br>" +
			"Your score was <strong>" + game.getScore() +
			" points</strong>." +
			"<br><br>Thanks for playing! Answers will now be displayed.")
	updateSidebarHard()

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
	setJSTimeout time, () -> $(elm).removeClass(cls)

# High-level things
markAllActive = (c = "blue") ->
	clearAll()
	ap = game.currDiagram().active_points
	for p in ap
		fillCircle(p, color=c, r=5)
		drawCircle(p, color=c, r=30)
	writeSpanActivePoints(ap)
updateActivePoints = () ->
	writeSpanActivePoints(game.currDiagram().active_points)

enableButtons = () ->
	diagram = game.currDiagram()
	ap = diagram.active_points
	enableButtonIf("#check_button", ap.length > 0 and
		!diagram.complete and game.isAlive())
	enableButtonIf("#clear_button", ap.length > 0)
	enableButtonIf("#done_button", (ap.length == 0) and
		(game.currDiagram().found != 0) and !diagram.complete and
		game.isAlive())
	enableButtonIf("#next_button", game.i != game.length-1)
	enableButtonIf("#prev_button", game.i != 0)

# }}}
# UI Updater {{{
updateMistakes = () ->
	$("#mistakes").html(game.currDiagram().mistakes)
updateProgressBullets = () ->
	$("#progress").empty()
	for diagram,i in game.diagrams
		li = $("<li>")
		s = "Diagram " + (i+1) + "\t"
		if diagram.complete
			li.html(s + "[" + diagram.getScore() + "]")
			li.addClass("score_complete")
		else if not game.isAlive()
			li.html(s + "[" + diagram.getScore() + "]")
			li.addClass("score_failed")
		else
			li.html(s + "[?]")
			li.addClass("score_unknown")
		if i == game.i
			li.addClass("current")
		$("#progress").append(li)
updateFoundTuples = () ->
	$("#found").empty()
	for tuple in game.currDiagram().found_tuples
		writeSpanAppendFoundTuple(tuple)
updateScores = () ->
	diagram = game.currDiagram()
	$("#score").html(game.getScore())
	$("#curr_score_box").empty()
	elm = $("<span></span>")
	if diagram.complete
		elm.html("[" + diagram.getScore() + "]")
		elm.addClass("score_complete")
	else if not game.isAlive()
		elm.html("[" + diagram.getScore() + "]")
		elm.addClass("score_failed")
	else
		elm.html("[?]")
		elm.addClass("score_unknown")
	$("#curr_score_box").append(elm)

updateSidebarSoft = (c = "blue") ->
	# Updates for clicking on points
	markAllActive(c)
	updateActivePoints()
	updateMistakes()
	enableButtons()
	updateTimeLeftOnce()
	
updateSidebarHard = (c = "blue") ->
	# Updates for clicking prev, next, or correct done
	updateProgressBullets()
	updateScores()
	updateFoundTuples()
	updateSidebarSoft(c)

getTimeString = (t) ->
	secs_left = Math.round(t / 1000)
	mins = Math.floor(secs_left / 60)
	secs = secs_left % 60
	s = "" + mins + ":"
	s += "0" if secs < 10
	s += secs

updateTimeLeftForever = () ->
	updateTimeLeftOnce()
	if game.isAlive()
		setJSTimeout 1000, updateTimeLeftForever
updateTimeLeftOnce = () ->
	$("#time").html(getTimeString(game.getTimeLeft()))

# }}}
# Alerts {{{
fastSuccessAlert = (title, text, time=3000) ->
	if time < game.getTimeLeft()
		swal({
			title: title,
			text: text,
			type: "success",
			html: true,
			timer: time,
			showConfirmButton: false,
			allowOutsideClick: true,
		})
	else
		swal({
			title: title,
			text: text,
			type: "success",
			html: true,
			showConfirmButton: false,
			allowOutsideClick: true,
		})

slowSuccessAlert = (title, text) ->
	swal({
		title: title,
		text: text,
		type: "success",
		html: true,
		allowOutsideClick: false,
	})

slowWarningAlert = (title, text) ->
	swal({
		title: title,
		text: text,
		type: "warning",
		html: true,
		allowOutsideClick: false,
	})

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
		enableButtons()

onCheckButtonClick = (e) ->
	diagram = game.currDiagram()
	clone = diagram.active_points.slice(0) # I hate JS
	if diagram.gradeTuple(clone)
		# Highlight green momentarily
		markAllActive("green")
		tempAddClass "#check_button", "button_green"
		writeSpanAppendFoundTuple(diagram.active_points)
		diagram.active_points = []
		setTimeout updateSidebarSoft, 400
	else
		tempAddClass "#check_button", "button_red"
		updateSidebarSoft("red")

onClearButtonClick = (e) ->
	diagram = game.currDiagram()
	diagram.active_points = []
	updateSidebarSoft()

onDoneButtonClick = (e) ->
	diagram = game.currDiagram()
	diagram.gradeDone()
	if diagram.complete
		tempAddClass "#done_button", "button_green"
		if game.allDone()
			slowSuccessAlert("You win!", "You earned " +
				game.currDiagram().getScore() +
				" points for this last diagram.<br>" +
				"Your total score was <strong>" +
				game.getScore() + " points</strong>." +
				"Thanks for playing!")
		else
			fastSuccessAlert("Diagram complete!",
				"You earned <strong>" +
				game.currDiagram().getScore() +
				" points</strong> for this diagram.")
		updateSidebarHard()
	else
		tempAddClass "#done_button", "button_red"
		updateSidebarSoft()

onPrevButtonClick = (e) ->
	game.prevDiagram()
	updateSidebarHard()

onNextButtonClick = (e) ->
	game.nextDiagram()
	updateSidebarHard()

# }}}

# Main function {{{
$ ->
	game = new Game(["demo1", "demo2"])
	$("[type=button]").prop("disabled", true)
	$("#start_game").prop("disabled", false)

	$("#start_game").click ->
		game.startGame()

# }}}
# vim: fdm=marker
