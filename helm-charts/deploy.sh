#!/bin/bash

namespaces=("ctfd" "external-dns" "ingress-nginx" "binary" "osint" "web" "crypto" "story-sites" "rev" "misc" "networks")
resources=("external-dns" "ingress-nginx" "ctfd" "story-sites")
categories=("osint" "web" "binary" "crypto" "rev" "forensics" "misc" "networks")


echo "*****DEPLOYING NAMESPACES******"
# create namespaces
for name in ${namespaces[@]}; do
    kubectl create namespace $name
done

echo "\n\n\n"
echo "*****DEPLOYING RESOURCES*****"
# deploy resources
for name in ${resources[@]}; do
    echo "******deploying $name" 
    ./$name/deploy.sh
    echo ""
    sleep 15 # to make sure we don't bottleneck the CPU
done

echo "\n\n\n"
echo "*****DEPLOYING CHALLENGES*****"
# deploy challenges
for name in ${categories[@]}; do
    echo "******deploying $name" 
    ./$name/deploy.sh
    echo ""
    sleep 30 # to make sure we don't bottleneck the CPU
done
