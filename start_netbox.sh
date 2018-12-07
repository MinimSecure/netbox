#!/usr/bin/env bash
set -eo pipefail

sudo docker run --privileged --network unum-demo-net-b-lan --ip 192.168.15.${1:-194} --rm -it netbox /bin/bash
