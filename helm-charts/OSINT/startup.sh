#!/bin/bash

cd ingress-nginx
./deploy.sh
cd ..
helm upgrade -n osint compare-and-contrast ./OSINT/compare-and-contrast/. --install
helm upgrade -n osint where-are-mom-and-pop ./OSINT/where-are-mom-and-pop/. --install
helm upgrade -n osint garbage-collector ./OSINT/garbage-collector/. --install