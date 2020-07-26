all : js/rungame.js diagrams

js/rungame.js : coffee/rungame.coffee
	coffee -c -o js coffee/rungame.coffee;

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
