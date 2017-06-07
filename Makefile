all : js/rungame.js diagrams js/jquery.min.js css/simple-53544.css

js/rungame.js : coffee/rungame.coffee
	coffee -c -o js coffee/rungame.coffee;

css/simple-53544.css :
	wget http://web.evanchen.cc/css/simple-53544.css -O css/simple-53544.css

js/jquery.min.js : 
	wget https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js -O js/jquery.min.js

diagrams : asy-sources/* build/build-diagrams.py
	mkdir -p diagrams
	./build/build-diagrams.py

clean:
	rm -f js/rungame.js
	rm -f js/episode-index.js
	rm -f diagrams/*
	rm -fd diagrams
	rm -f js/jquery.min.js
	rm -f css/simple-53544.css
