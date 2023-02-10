#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm upgrade -n ctfd ctfd $ABS_PATH/. --install