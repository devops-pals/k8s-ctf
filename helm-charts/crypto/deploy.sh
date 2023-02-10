#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/diversionary-havoc/.
helm dep update $ABS_PATH/one-true-encryption/.

helm upgrade -n crypto diverisonary-havoc $ABS_PATH/diversionary-havoc/. --install
helm upgrade -n crypto one-true-encryption $ABS_PATH/one-true-encryption/. --install
