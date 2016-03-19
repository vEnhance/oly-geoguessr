all : js/rungame.js diagrams js/jquery.min.js

js/rungame.js : coffee/rungame.coffee
	coffee -c -o js coffee/rungame.coffee;

js/jquery.min.js : 
	wget https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js -O js/jquery.min.js

diagrams : asy-sources/*
	mkdir -p diagrams
	./build/build-diagrams.py

clean:
	rm -f js/rungame.js
	rm -f js/episode-index.js
	rm -f diagrams/*
	rm -fd diagrams
	rm -f js/jquery.min.js
