#!/bin/bash

# create namespaces
kubectl create namespace ctfd
kubectl create namespace web
kubectl create namespace binary
kubectl create namespace external-dns
kubectl create namespace ingress-nginx
kubectl create namespace osint

# deploy external-dns
kubectl create --filename ./external-dns/externaldns.yaml -n external-dns

# deploy ingress-nginx
./ingress-nginx/deploy.sh

# deploy ctfd
./ctfd/startup.sh

# deploy each category
./binary/startup.sh
./OSINT/startup.sh
./web/startup.sh