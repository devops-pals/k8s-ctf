#!/bin/bash

helm delete -n story-sites mompop-site
helm delete -n story-sites omni-site
helm delete -n story-sites sites-ingress