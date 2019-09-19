#!/bin/bash

pushd master_node/
vagrant up
JOIN_MASTER_NODE_CMD=$(vagrant ssh --no-tty -c 'sudo kubeadm token create --print-join-command')
popd

pushd worker_node/
vagrant up
vagrant ssh -c "sudo $JOIN_MASTER_NODE_CMD"
popd
