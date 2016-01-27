#!/usr/bin/env bash
# From http://superuser.com/a/970780/440809

function execute() {
	make js/rungame.js
}

execute;

inotifywait --quiet --recursive --monitor --event modify --format "%w%f" coffee/ \
| while read change; do
    execute;
done
