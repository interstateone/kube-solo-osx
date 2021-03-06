#!/bin/bash

#  halt.command
# stop VM via ssh

#
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${DIR}"/functions.sh

# get App's Resources folder
res_folder=$(cat ~/kube-solo/.env/resouces_path)

# get VM IP
#vm_ip=$( ~/kube-solo/mac2ip.sh $(cat ~/kube-solo/.env/mac_address))
vm_ip=$(cat ~/kube-solo/.env/ip_address)

# send halt to VM
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=5 core@$vm_ip sudo halt

# just in case run
clean_up_after_vm
