#!/bin/bash

# The following should NOT be -r
gcloud storage rsync -x ".gitignore|sync.sh|Makefile" . gs://web.evanchen.cc/guessr/

gcloud storage rsync css/ gs://web.evanchen.cc/guessr/css
gcloud storage rsync js/ gs://web.evanchen.cc/guessr/js
gcloud storage rsync diagrams/ gs://web.evanchen.cc/guessr/diagrams
gcloud storage objects update --cache-control="private, max-age=0" "gs://web.evanchen.cc/guessr/**"
