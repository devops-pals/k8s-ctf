#!/bin/bash

# biometric-heap
docker build -t us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/biometric-heap:1.0 ../../../magpiectf-2022-challenges/binary-exploitation/biometric-heap/source/
docker push us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/biometric-heap:1.0

# intact
docker build -t us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/intact:1.0 ../../../magpiectf-2022-challenges/binary-exploitation/intact/source/
docker push us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/intact:1.0

# secure-ls
docker build -t us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/secure-ls:1.0 ../../../magpiectf-2022-challenges/binary-exploitation/Secure-ls/source/
docker push us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/secure-ls:1.0

#stacks-of-flags
docker build -t us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/stacks-of-flags:1.0 ../../../magpiectf-2022-challenges/binary-exploitation/Stacks-Of-Flags/source/
docker push us-central1-docker.pkg.dev/k8s-ctf-345001/docker-repo/stacks-of-flags:1.0