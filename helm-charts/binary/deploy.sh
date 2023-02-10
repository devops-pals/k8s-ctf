#!/bin/bash

ABS_PATH="$( dirname -- "$( readlink -f -- "$0"; )"; )"

helm dep update $ABS_PATH/biometric-heap/.
helm dep update $ABS_PATH/intact/.
helm dep update $ABS_PATH/secure-ls/.
helm dep update $ABS_PATH/stacks-of-flags/.

helm upgrade -n binary biometric-heap $ABS_PATH/biometric-heap/. --install
helm upgrade -n binary intact $ABS_PATH/intact/. --install
helm upgrade -n binary secure-ls $ABS_PATH/secure-ls/. --install
helm upgrade -n binary stacks-of-flags $ABS_PATH/stacks-of-flags/. --install
