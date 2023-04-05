#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/safe-js/.
# helm dep update $ABS_PATH/nitwit-financial-techniques/.
helm dep update $ABS_PATH/ingress/.


helm upgrade -n rev safe-js $ABS_PATH/safe-js/. --install
# helm upgrade -n rev nitwit-financial-techniques $ABS_PATH/nitwit-financial-techniques/. --install
helm upgrade -n rev rev-ingress $ABS_PATH/ingress/. --install
