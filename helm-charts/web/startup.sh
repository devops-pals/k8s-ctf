#!/bin/bash

helm upgrade -n web blame-the-intern ./blame-the-intern/. --install
helm upgrade -n web last-act-of-defiance ./last-act-of-defiance/. --install
helm upgrade -n web old-family-recipe ./old-family-recipe/. --install
helm upgrade -n web web-ingress ./ingress/. --install
