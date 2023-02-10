#!/bin/bash

namespaces=("external-dns" "ingress-nginx" "binary" "osint" "web" "crypto")
resources=("external-dns" "ingress-nginx")
categories=("osint" "web")


# create namespaces
for name in ${namespaces[@]}; do
    kubectl create namespace $name
done

# deploy resources
for name in ${resources[@]}; do 
    ./$name/deploy.sh
done

# deploy challenges
for name in ${categories[@]}; do
    ./$name/deploy.sh
done
