#!/bin/bash

make

# The following should NOT be -r
gcloud storage rsync -x ".gitignore|sync.sh|Makefile" site/ gs://web.evanchen.cc/guessr/

gcloud storage rsync site/css/ gs://web.evanchen.cc/guessr/css
gcloud storage rsync site/js/ gs://web.evanchen.cc/guessr/js
gcloud storage rsync site/diagrams/ gs://web.evanchen.cc/guessr/diagrams
gcloud storage objects update --cache-control="private, max-age=0" "gs://web.evanchen.cc/guessr/**"
