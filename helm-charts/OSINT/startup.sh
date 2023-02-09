#!/bin/bash

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

cd ingress-nginx
./deploy.sh
cd ..
helm upgrade -n osint compare-and-contrast ./OSINT/compare-and-contrast/. --install
helm upgrade -n osint where-are-mom-and-pop ./OSINT/where-are-mom-and-pop/. --install
helm upgrade -n osint garbage-collector ./OSINT/garbage-collector/. --install