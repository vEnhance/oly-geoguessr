#!/bin/bash

# The following should NOT be -r
gsutil -m rsync -x ".gitignore|sync.sh|Makefile" . gs://web.evanchen.cc/guessr/

gsutil -m rsync css/ gs://web.evanchen.cc/guessr/css
gsutil -m rsync js/ gs://web.evanchen.cc/guessr/js
gsutil -m rsync diagrams/ gs://web.evanchen.cc/guessr/diagrams
gsutil -m setmeta -R -h 'Cache-Control:private, max-age=0, no-transform' gs://web.evanchen.cc/guessr/*
