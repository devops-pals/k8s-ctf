#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/mompop-site/.
helm dep update $ABS_PATH/omni-site/.
helm dep update $ABS_PATH/ingress/.


helm upgrade -n story-sites mompop-site $ABS_PATH/mompop-site/. --install
helm upgrade -n story-sites omni-site $ABS_PATH/omni-site/. --install
helm upgrade -n story-sites sites-ingress $ABS_PATH/ingress/. --install
