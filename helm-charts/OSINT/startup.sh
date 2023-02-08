#!/bin/bash

cd ingress-nginx
./deploy.sh
cd ..
helm upgrade -n osint compare-and-contrast ./compare-and-contrast/. --install
helm upgrade -n osint where-are-mom-and-pop ./where-are-mom-and-pop/. --install
helm upgrade -n osint garbage-collector ./garbage-collector/. --install