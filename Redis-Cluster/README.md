# Kubernetes Redis Cluster

### Create Disks

```
aws ec2 --region ap-southeast-1 --availability-zone ap-southeast-1a --volume-type gp2 --size 20
aws ec2 --region ap-southeast-1 --availability-zone ap-southeast-1a --volume-type gp2 --size 20
aws ec2 --region ap-southeast-1 --availability-zone ap-southeast-1a --volume-type gp2 --size 20
aws ec2 --region ap-southeast-1 --availability-zone ap-southeast-1a --volume-type gp2 --size 20
aws ec2 --region ap-southeast-1 --availability-zone ap-southeast-1a --volume-type gp2 --size 20
aws ec2 --region ap-southeast-1 --availability-zone ap-southeast-1a --volume-type gp2 --size 20
```

### Create Redis Cluster Configuration

```
kubectl create configmap redis-conf --from-file=redis.conf
```

### Create Redis Nodes

```
kubectl create -f replicasets
```

### Create Redis Services

```
$ kubectl cluster-info dump  | grep service-cluster-ip-range
                        "--service-cluster-ip-range=10.96.0.0/12",
```

```
kubectl create -f services
```

### Connect Nodes

```
kubectl run -i --tty ubuntu --image=ubuntu:xenial --restart=Never /bin/bash
```

```
apt-get update
apt-get install ruby vim wget redis-tools
gem install redis
wget http://download.redis.io/redis-stable/src/redis-trib.rb
```

```
./redis-trib.rb create --replicas 1 \
  100.64.10.1:6379 \
  100.64.10.2:6379 \
  100.64.10.3:6379 \
  100.64.10.4:6379 \
  100.64.10.5:6379 \
  100.64.10.6:6379
```

### Add a new node

```
gcloud compute disks create --size=10GB 'redis-7'
```

```
kubectl create -f replicaset/redis-7.yaml
```

```
kubectl create -f services/redis-7.yaml
```

```
CLUSTER MEET 10.10.0.7 6379
```
