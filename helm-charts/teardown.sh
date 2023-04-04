#!/bin/bash

namespaces=("ctfd" "external-dns" "ingress-nginx" "binary" "osint" "web" "crypto" "story-sites")
resources=("external-dns" "ingress-nginx" "ctfd" "story-sites")
categories=("osint" "web" "binary" "crypto")

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

