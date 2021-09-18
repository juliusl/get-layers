#!/bin/sh 

if [ ! -f "./install-oras.sh" ]; then
    curl https://raw.githubusercontent.com/juliusl/azorasrc/main/scripts/get-oras.sh | sh; 
fi

. './install-oras.sh'

registry=

echo "What registry are you logging into?" 
read -r registry;

oras login "$registry"
