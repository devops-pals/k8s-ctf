#!/bin/bash

helm upgrade -n binary biometric-heap ./binary/biometric-heap/. --install
helm upgrade -n binary intact ./binary/intact/. --install
helm upgrade -n binary secure-ls ./binary/secure-ls/. --install
helm upgrade -n binary stacks-of-flags ./binary/stacks-of-flags/. --install
