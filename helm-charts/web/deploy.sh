#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/blame-the-intern/.
helm dep update $ABS_PATH/last-act-of-defiance/.
helm dep update $ABS_PATH/old-family-recipe/.

helm upgrade -n web blame-the-intern $ABS_PATH/blame-the-intern/. --install
helm upgrade -n web last-act-of-defiance $ABS_PATH/last-act-of-defiance/. --install
helm upgrade -n web old-family-recipe $ABS_PATH/old-family-recipe/. --install
helm upgrade -n web web-ingress $ABS_PATH/ingress/. --install



