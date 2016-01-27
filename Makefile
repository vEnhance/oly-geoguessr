all : js/rungame.js diagrams

js/rungame.js : coffee/rungame.coffee
	coffee -c -o js coffee/rungame.coffee;

diagrams : asy-sources/*
	mkdir -p diagrams
	./build-diagrams.py

clean:
	rm -f js/rungame.js
	rm -f diagrams/*
	rm -fd diagrams
