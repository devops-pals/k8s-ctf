#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm upgrade -n external-dns external-dns $ABS_PATH/. --install