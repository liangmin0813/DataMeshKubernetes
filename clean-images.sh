#!/bin/bash

sudo docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)
