# Kubernetes Redis Cluster

### Create Redis Cluster Configuration

```
cdkubectl create -f namespace.yaml
kubectl create configmap redis-conf --from-file=redis.conf --namespace=test
```

### Create Redis Storage

```
kubectl create -f storage-class.yaml
kubectl create -f redis-pvcs.yaml --namespace=test
```

### Create Redis Services

```
kubectl create -f redis-rs.yaml --namespace=test
```

```
kubectl create -f redis-svc.yaml --namespace=test
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
 `getent hosts redis-1 | awk '{ print $1 }'`:6379 \
 `getent hosts redis-2 | awk '{ print $1 }'`:6379 \
 `getent hosts redis-3 | awk '{ print $1 }'`:6379 \
 `getent hosts redis-4 | awk '{ print $1 }'`:6379 \
 `getent hosts redis-5 | awk '{ print $1 }'`:6379 \
 `getent hosts redis-6 | awk '{ print $1 }'`:6379
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



## Also See

https://github.com/cookeem/kubernetes-redis-cluster