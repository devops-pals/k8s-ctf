#!/bin/bash

helm delete -n binary biometric-heap
helm delete -n binary intact
helm delete -n binary secure-ls
helm delete -n binary stacks-of-flags
helm delete -n binary binary-ingress