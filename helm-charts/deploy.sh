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
cd ./ingress-nginx
./deploy.sh
cd ..

categories=("ctfd" "binary" "OSINT" "web")

for name in ${categories[@]}; do 
    cd ./$name
    ./startup.sh
    cd ..
done

