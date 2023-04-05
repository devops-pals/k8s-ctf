#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/sticky-note/.
helm dep update $ABS_PATH/scattered-letters/.
helm dep update $ABS_PATH/ingress/.


helm upgrade -n networks sticky-note $ABS_PATH/sticky-note/. --install
helm upgrade -n networks scattered-letters $ABS_PATH/scattered-letters/. --install
helm upgrade -n networks networks-ingress $ABS_PATH/ingress/. --install
