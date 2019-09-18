# two nodes k8s cluster in vagrant

To create two nodes cluster - master and worker - run the following:

```
pushd master_node/
vagrant up
JOIN_MASTER_NODE_CMD=$(vagrant ssh -c 'sudo kubeadm token create --print-join-command' | perl -ne 's/\W+$//;print')
popd

pushd worker_node/
vagrant up
vagrant ssh -c "sudo $JOIN_MASTER_NODE_CMD"
popd
```
