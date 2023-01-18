#!/bin/bash

helm upgrade -n binary biometric-heap ./biometric-heap/. --install
helm upgrade -n binary intact ./intact/. --install
helm upgrade -n binary secure-ls ./secure-ls/. --install
helm upgrade -n binary stacks-of-flags ./stacks-of-flags/. --install
helm upgrade -n binary binary-ingress ./ingress/. --install