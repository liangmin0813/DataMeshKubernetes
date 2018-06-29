#!/bin/bash

tag="${1:=$IMG_TAG}"
version="${2:=$IMG_VERSION}"
registry_endpoint="${REGISTRY_ENDPOINT:=registry.ap-southeast-1.aliyuncs.com}"
registry_username="${REGISTRY_USERNAME:=taox@1743367343051440}"
registry_password="${REGISTRY_PASSWORD:=Datamesh2017}"

# check paratemters
if [ -z ${tag} ]; then
    echo "Error: image tag not set."
    exit 1
fi
if [ -z ${version} ]; then
    echo "Error: image version not set."
    exit 1
fi

SUDO=""

if [ "$EUID" -ne 0 ] 
    then SUDO='sudo'
fi


${SUDO} docker login --username=${registry_username} --password=${registry_password} ${registry_endpoint}
${SUDO} docker tag `${SUDO} docker images ${tag}:${version} | grep "${tag}\s\{1,\}${version}" | tr -s ' ' |cut -d' ' -f3` ${registry_endpoint}/${tag}:${version}
${SUDO} docker push ${registry_endpoint}/${tag}:${version}

