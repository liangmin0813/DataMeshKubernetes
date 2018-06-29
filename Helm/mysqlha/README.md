# MySQL - Single Master, Multiple Slaves

## Introduction

This chart bootstraps a single master and multiple slave MySQL deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. Largely inspired by this [tutorial](https://kubernetes.io/docs/tutorials/stateful-application/run-replicated-stateful-application/), further work was made to 'production-ize' the example.

## Prerequisites

- Kubernetes 1.4+ with Beta APIs enabled

- PV provisioner support in the underlying infrastructure

- Have Helm installed:

  > ```
  > # for v2.7.0
  > wget https://s3-ap-northeast-1.amazonaws.com/datamesh.jp/helm-v2.7.0-linux-amd64.tar.gz
  > tar xvf helm-v2.7.0-linux-amd64.tar.gz
  > sudo cp linux-amd64/helm /usr/local/bin/
  > # init and install template plugin
  > helm init
  > helm plugin install https://github.com/technosophos/helm-template
  > ```

## Pre-Check

```
helm template -f values.yaml .
```

## Installing the Chart

To install the chart with the release name `mysqltest` into namespace ```test```: (go into the mysqlha directory)

```bash
$ helm install --namespace test --name mysqltest ./
```

The command deploys MySQL cluster on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> ```
> NOTES:
> The MySQL cluster is comprised of 3 MySQL pods: 1 master and 2 slaves. Each instance is accessible within the cluster through:
>
>     <pod-name>.test-mysqlha
>
> `test-mysqlha-0.test-mysqlha` is designated as the master and where all writes should be executed against. Read queries can be executed against the `test-mysqlha-readonly` service which distributes connections across all MySQL pods.
>
> To connect to your database:
>
> 1. Obtain the root password: 
>
>     kubectl get secret --namespace test test-mysqlha -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo
>
> 2. Run a pod to use as a client:
>
>     kubectl run mysql-client --image=mysql:5.7.20 -it --rm --restart=Never -- /bin/sh
>
> 2. Open a connection to one of the MySQL pods
>
>     mysql -h test-mysqlha-0.test-mysqlha -p
> ```

## Check

```
kubectl describe pod test-mysqlha-0 --namespace test

kubectl get pvc --namespace test
```

## Test Database

```
CREATE DATABASE test;
CREATE TABLE test.messages (message VARCHAR(250));
INSERT INTO test.messages VALUES ('hello');

SELECT * FROM test.messages;

// see for more testing
https://v1-7.docs.kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/
```



## Uninstall

To uninstall/delete the `test ` deployment:

```bash
$ helm delete test
```

## Configuration

The following tables lists the configurable parameters of the MySQL chart and their default values.

| Parameter                  | Description                         | Default                                  |
| -------------------------- | ----------------------------------- | ---------------------------------------- |
| `mysqlImage`               | `mysql` image and tag.              | `mysql:5.7.13`                           |
| `xtraBackupImage`          | `xtrabackup` image and tag.         | `registry.ap-southeast-1.aliyuncs.com/datamesh/xtrabackup:1.0` |
| `replicaCount`             | Number of MySQL replicas            | 3                                        |
| `mysqlRootPassword`        | Password for the `root` user.       | Randomly generated                       |
| `mysqlUser`                | Username of new user to create.     | `nil`                                    |
| `mysqlPassword`            | Password for the new user.          | Randomly generated                       |
| `mysqlReplicationUser`     | Username for replication user       | `repl`                                   |
| `mysqlReplicationPassword` | Password for replication user.      | Randomly generated                       |
| `mysqlDatabase`            | Name of the new Database to create  | `nil`                                    |
| `persistence.enabled`      | Create a volume to store data       | true                                     |
| `persistence.size`         | Size of persistent volume claim     | 10Gi                                     |
| `persistence.storageClass` | Type of persistent volume claim     | `nil`                                    |
| `persistence.accessMode`   | ReadWriteOnce or ReadOnly           | ReadWriteOnce                            |
| `resources`                | CPU/Memory resource requests/limits | Memory: `128Mi`, CPU: `100m`             |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

## Persistence

The [MySQL](https://hub.docker.com/_/mysql/) image stores the MySQL data and configurations at the `/var/lib/mysql` path of the container.

By default persistence is enabled, and a PersistentVolumeClaim is created and mounted in that directory. As a result, a persistent volume will need to be defined:

```
# https://kubernetes.io/docs/user-guide/persistent-volumes/#azure-disk
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: fast
provisioner: kubernetes.io/azure-disk
parameters:
  skuName: Premium_LRS
  location: westus
```

In order to disable this functionality you can change the values.yaml to disable persistence and use an emptyDir instead.



## Accessing logs from Init Containers

Pass the Init Container name along with the Pod name to access its logs.

```
kubectl logs <pod-name> -c <init-container-2>

```

Init Containers that run a shell script print commands as they’re executed. For example, you can do this in Bash by running `set -x` at the beginning of the script