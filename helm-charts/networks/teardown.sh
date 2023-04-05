#!/bin/bash

helm delete -n networks sticky-note
helm delete -n networks scattered-letters
helm delete -n networks networks-ingress