#!/bin/bash

helm upgrade -n web blame-the-intern ./web/blame-the-intern/. --install
helm upgrade -n web last-act-of-defiance ./web/last-act-of-defiance/. --install
helm upgrade -n web old-family-recipe ./web/old-family-recipe/. --install
helm upgrade -n web web-ingress ./web/ingress/. --install
