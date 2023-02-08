#!/bin/bash

cd ingress-nginx
./delete.sh
cd ..
helm delete -n osint compare-and-contrast
helm delete -n osint garbage-collector
helm delete -n osint where-are-mom-and-pop
