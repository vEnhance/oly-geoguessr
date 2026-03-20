all : site/js/rungame.js site/diagrams

site/js/rungame.js : coffee/rungame.coffee
	coffee -c -o site/js coffee/rungame.coffee;

site/diagrams : asy/* build-diagrams.py
	mkdir -p site/diagrams
	./build-diagrams.py

clean:
	rm -f site/js/rungame.js
	rm -f site/js/episode-index.js
	rm -f site/diagrams/*
	rm -fd site/diagrams
	rm -f site/js/jquery.min.js
	rm -f site/css/simple-53544.css
