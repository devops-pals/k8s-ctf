#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/crack-the-safe/.
helm dep update $ABS_PATH/ingress/.


helm upgrade -n misc crack-the-safe $ABS_PATH/crack-the-safe/. --install
helm upgrade -n misc misc-ingress $ABS_PATH/ingress/. --install
