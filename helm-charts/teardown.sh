#!/bin/bash

namespaces=("ctfd" "external-dns" "ingress-nginx" "binary" "osint" "web" "crypto" "story-sites" "rev" "misc" "networks")
resources=("external-dns" "ingress-nginx" "ctfd" "story-sites")
categories=("osint" "web" "binary" "crypto" "rev" "forensics" "misc" "networks")

# run teardown scripts for challenges
for name in ${categories[@]}; do
    ./$name/teardown.sh
done

# run teardown scripts for resources
for name in ${resources[@]}; do 
    ./$name/teardown.sh
done

# sleep to let the services uninstall
sleep 2m

# delete namespaces
for name in ${namespaces[@]}; do
    kubectl delete namespace $name
done

