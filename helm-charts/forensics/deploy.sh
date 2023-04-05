#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/out-of-mind/.

helm upgrade -n forensics out-of-mind $ABS_PATH/out-of-mind/. --install