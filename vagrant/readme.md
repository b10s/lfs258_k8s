# two nodes k8s cluster in vagrant

To create two nodes cluster - master and worker - run the following:

```
pushd master_node/
vagrant up
JOIN_MASTER_NODE_CMD=$(vagrant ssh --no-tty -c 'sudo kubeadm token create --print-join-command')
popd
pushd worker_node/
vagrant up
vagrant ssh -c "sudo $JOIN_MASTER_NODE_CMD"
popd
```

## WARNING: you can not exec into pod unless do the following fix

add the following line into /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

```
Environment="KUBELET_EXTRA_ARGS=--node-ip=10.0.0.11"
```

then:
```
$ systemctl daemon-reload
$ systemctl restart kubelet
```
