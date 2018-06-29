Running Jenkins master and slaves in a Kubernetes cluster
=========================================================

Kubernetes examples running Jenkins master and slaves

Creating a cluster
==================

Use KOPS


Create Images
=============

go to docker directory, build and run

```
sudo docker login --username=taox@1743367343051440 registry.ap-southeast-1.aliyuncs.com

sudo docker tag [ImageId] registry.ap-southeast-1.aliyuncs.com/datamesh/jenkins-swarm:1.0

sudo docker push registry.ap-southeast-1.aliyuncs.com/datamesh/jenkins-swarm:1.0


sudo docker login --username=taox@1743367343051440 registry.ap-southeast-1.aliyuncs.com

sudo docker tag [ImageId] registry.ap-southeast-1.aliyuncs.com/datamesh/jenkins-swarm-slave:1.0

sudo docker push registry.ap-southeast-1.aliyuncs.com/datamesh/jenkins-swarm-slave:1.0
```

Creating the pods and services
==============================

AWS
-------
This assumes a working kubernetes installation. I generate mine with [kops](https://github.com/kubernetes/kops).
If `kubectl cluster-info` gives you output about the location of the API server, you are likely in pretty good shape.
Next, create the working volume for jenkins:
`aws ec2 create-volume --availability-zone us-east-1a --size 20 --volume-type gp2

You'll get a response back that looks something like this:
```
{
    "AvailabilityZone": "us-east-1a",
    "Encrypted": false,
    "VolumeType": "gp2",
    "VolumeId": "vol-002d2b99000000000", # Write this value down
    "State": "creating",
    "Iops": 100,
    "SnapshotId": "",
    "CreateTime": "2016-12-24T17:39:34.725Z",
    "Size": 20
}
```
Edit `jenkins-master-aws.yml` and put the VolumeID in the volumeID field`.

```
kubectl create ns jenkins
kubectl create secret generic jenkins --from-file=options --namespace=jenkins

kubectl create -f jenkins-master-aws.yml
kubectl get rc --namespace jenkins
kubectl get pods --namespace jenkins
kubectl create -f service-aws.yml
kubectl get services
kubectl describe service jenkins
kubectl create -f jenkins-slaves.yml
kubectl get rc
kubectl get pods
kubectl scale replicationcontrollers --replicas=2 jenkins-slave
kubectl describe services/jenkins
```
These instructions get you a publically accessible Jenkins dashboard at the load balancer specified in `kubectl describe service jenkins`. This is likely not ideal for a production environment for a number of reasons to be explored at some future date.

Rolling update
==============

```
kubectl rolling-update jenkins-slave --update-period=10s -f replication-v2.yml
```

Tearing down
============

```
kubectl stop replicationcontrollers jenkins-slave
kubectl stop replicationcontrollers jenkins
kubectl delete services jenkins
$KUBERNETES_HOME/cluster/kube-down.sh
```

Demo
====

Kubernetes cluster up
[![asciicast](https://asciinema.org/a/18161.png)](https://asciinema.org/a/18161)

Jenkins master and slaves provisioning
[![asciicast](https://asciinema.org/a/18162.png)](https://asciinema.org/a/18162)

Kubernetes cluster teardown
[![asciicast](https://asciinema.org/a/18163.png)](https://asciinema.org/a/18163)

