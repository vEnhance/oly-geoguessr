#!/usr/bin/env bash
# From http://superuser.com/a/970780/440809

function execute() {
	echo "coffee -c -o js coffee/rungame.coffee";
	coffee -c -o js coffee/rungame.coffee;
}

execute;

inotifywait --quiet --recursive --monitor --event modify --format "%w%f" coffee/ \
| while read change; do
    execute;
done
