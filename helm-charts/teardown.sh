#!/bin/bash

namespaces=("external-dns" "ingress-nginx" "ctfd" "binary" "osint" "web" "crypto")
resources=("external-dns" "ingress-nginx" "ctfd")
categories=("binary" "osint" "web" "crypto")

# run teardown scripts for challenges
for name in ${categories[@]}; do
    ./$name/teardown.sh
done

# run teardown scripts for resources
for name in ${resources[@]}; do 
    ./$name/teardown.sh
done

# delete namespaces
for name in ${namespaces[@]}; do
    kubectl delete namespace $name
done

