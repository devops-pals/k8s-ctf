#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/compare-and-contrast/.
helm dep update $ABS_PATH/where-are-mom-and-pop/.
helm dep update $ABS_PATH/garbage-collector/.
helm dep update $ABS_PATH/ingress/.

helm upgrade -n osint compare-and-contrast $ABS_PATH/compare-and-contrast/. --install
helm upgrade -n osint where-are-mom-and-pop $ABS_PATH/where-are-mom-and-pop/. --install
helm upgrade -n osint garbage-collector $ABS_PATH/garbage-collector/. --install
helm upgrade -n osint ingress $ABS_PATH/ingress/. --install