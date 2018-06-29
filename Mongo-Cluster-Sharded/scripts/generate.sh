#!/bin/sh
##
# Script to deploy a Kubernetes project with a StatefulSet running a MongoDB Sharded Cluster, to AWS.
##

NAMESPACE="test"

NEW_PASSWORD="Datamesh2017"


# Assume running on K8S master with Debian

kubectl create namespace ${NAMESPACE}

# Configure host VM using daemonset to add XFS mounting support and disable hugepages
echo "Deploying VM Init Daemon Set"
sed -e 's/_NAMESPACE_/${NAMESPACE}/g' ../resources/hostvm-node-configurer-daemonset.yaml > /tmp/hostvm-node-configurer-daemonset.yaml
kubectl apply -f /tmp/hostvm-node-configurer-daemonset.yaml
rm /tmp/hostvm-node-configurer-daemonset.yaml

# Register AWS GP2 SSD storage class (if not exists)
echo "Creating EBS storage class"
kubectl apply -f ../resources/aws-ssd-storageclass.yaml
sleep 5

# Create keyfile for the MongoDB cluster as a Kubernetes shared secret
TMPFILE=$(mktemp)
/usr/bin/openssl rand -base64 741 > $TMPFILE
kubectl create secret generic shared-bootstrap-data --from-file=internal-auth-mongodb-keyfile=$TMPFILE --namespace=${NAMESPACE}
rm $TMPFILE


# Deploy a MongoDB ConfigDB Service ("Config Server Replica Set") using a StatefulSet
echo "Deploying AWS StatefulSet & Service for MongoDB Config Server Replica Set"
sed -e 's/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-configdb-service.yaml > /tmp/mongodb-configdb-service.yaml
kubectl apply -f /tmp/mongodb-configdb-service.yaml
rm /tmp/mongodb-configdb-service.yaml


# Deploy each MongoDB Shard Service using a StatefulSet
echo "Deploying AWS StatefulSet & Service for each MongoDB Shard Replica Set"
sed -e 's/shardX/shard1/g; s/ShardX/Shard1/g; s/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-maindb-service.yaml > /tmp/mongodb-maindb-service.yaml
kubectl apply -f /tmp/mongodb-maindb-service.yaml
sed -e 's/shardX/shard2/g; s/ShardX/Shard2/g; s/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-maindb-service.yaml > /tmp/mongodb-maindb-service.yaml
kubectl apply -f /tmp/mongodb-maindb-service.yaml
sed -e 's/shardX/shard3/g; s/ShardX/Shard3/g; s/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-maindb-service.yaml > /tmp/mongodb-maindb-service.yaml
kubectl apply -f /tmp/mongodb-maindb-service.yaml
sed -e 's/shardX/shard4/g; s/ShardX/Shard4/g; s/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-maindb-service.yaml > /tmp/mongodb-maindb-service.yaml
kubectl apply -f /tmp/mongodb-maindb-service.yaml
sed -e 's/shardX/shard5/g; s/ShardX/Shard5/g; s/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-maindb-service.yaml > /tmp/mongodb-maindb-service.yaml
kubectl apply -f /tmp/mongodb-maindb-service.yaml
sed -e 's/shardX/shard6/g; s/ShardX/Shard6/g; s/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-maindb-service.yaml > /tmp/mongodb-maindb-service.yaml
kubectl apply -f /tmp/mongodb-maindb-service.yaml
rm /tmp/mongodb-maindb-service.yaml


# Initialise the Config Server Replica Set and each Shard Replica Set
echo "Sleeping for 90 seconds to allow all the Stateful Sets' Pods to come up"
sleep 90
echo "Configuring Config Server Replica Set"
kubectl --namespace ${NAMESPACE} exec mongod-configdb-0 -c mongod-configdb-container -- mongo --eval 'rs.initiate({_id: "ConfigDBRepSet", version: 1, members: [ {_id: 0, host: "mongod-configdb-0.mongodb-configdb-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-configdb-1.mongodb-configdb-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-configdb-2.mongodb-configdb-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
echo "Configuring each Shard Replica Set"
kubectl --namespace ${NAMESPACE} exec mongod-shard1-0 -c mongod-shard1-container -- mongo --eval 'rs.initiate({_id: "Shard1RepSet", version: 1, members: [ {_id: 0, host: "mongod-shard1-0.mongodb-shard1-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-shard1-1.mongodb-shard1-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-shard1-2.mongodb-shard1-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
kubectl --namespace ${NAMESPACE} exec mongod-shard2-0 -c mongod-shard2-container -- mongo --eval 'rs.initiate({_id: "Shard2RepSet", version: 1, members: [ {_id: 0, host: "mongod-shard2-0.mongodb-shard2-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-shard2-1.mongodb-shard2-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-shard2-2.mongodb-shard2-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
kubectl --namespace ${NAMESPACE} exec mongod-shard3-0 -c mongod-shard3-container -- mongo --eval 'rs.initiate({_id: "Shard3RepSet", version: 1, members: [ {_id: 0, host: "mongod-shard3-0.mongodb-shard3-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-shard3-1.mongodb-shard3-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-shard3-2.mongodb-shard3-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
kubectl --namespace ${NAMESPACE} exec mongod-shard4-0 -c mongod-shard4-container -- mongo --eval 'rs.initiate({_id: "Shard4RepSet", version: 1, members: [ {_id: 0, host: "mongod-shard4-0.mongodb-shard4-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-shard4-1.mongodb-shard4-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-shard4-2.mongodb-shard4-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
kubectl --namespace ${NAMESPACE} exec mongod-shard5-0 -c mongod-shard5-container -- mongo --eval 'rs.initiate({_id: "Shard5RepSet", version: 1, members: [ {_id: 0, host: "mongod-shard5-0.mongodb-shard5-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-shard5-1.mongodb-shard5-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-shard5-2.mongodb-shard5-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
kubectl --namespace ${NAMESPACE} exec mongod-shard6-0 -c mongod-shard6-container -- mongo --eval 'rs.initiate({_id: "Shard6RepSet", version: 1, members: [ {_id: 0, host: "mongod-shard6-0.mongodb-shard6-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 1, host: "mongod-shard6-1.mongodb-shard6-service.${NAMESPACE}.svc.cluster.local:27017"}, {_id: 2, host: "mongod-shard6-2.mongodb-shard6-service.${NAMESPACE}.svc.cluster.local:27017"} ]});'
echo "Waiting for all the replica sets to initialize..."
sleep 15


# Deploy some Mongos Routers using a Deployment
echo "Deploying AWS Deployment & Service for some Mongos Routers"
sed -e 's/_NAMESPACE_/${NAMESPACE}/g' ../resources/mongodb-mongos-deployment.yaml > /tmp/mongodb-mongos-deployment.yaml
kubectl apply -f /tmp/mongodb-mongos-deployment.yaml
rm /tmp/mongodb-mongos-deployment.yaml

# Add Shards to the Configdb
echo "Sleeping for 20 seconds to allow all the Mongos routers to come up"
sleep 20
echo "Configuring ConfigDB to be aware of the 6 Shards"
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE}-l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'sh.addShard("Shard1RepSet/mongod-shard1-0.mongodb-shard1-service.${NAMESPACE}.svc.cluster.local:27017");'
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE}-l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'sh.addShard("Shard2RepSet/mongod-shard2-0.mongodb-shard2-service.${NAMESPACE}.svc.cluster.local:27017");'
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE}-l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'sh.addShard("Shard3RepSet/mongod-shard3-0.mongodb-shard3-service.${NAMESPACE}.svc.cluster.local:27017");'
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE}-l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'sh.addShard("Shard4RepSet/mongod-shard4-0.mongodb-shard4-service.${NAMESPACE}.svc.cluster.local:27017");'
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE}-l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'sh.addShard("Shard5RepSet/mongod-shard5-0.mongodb-shard5-service.${NAMESPACE}.svc.cluster.local:27017");'
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE}-l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'sh.addShard("Shard6RepSet/mongod-shard6-0.mongodb-shard6-service.${NAMESPACE}.svc.cluster.local:27017");'

# Create the Admin User (this will automatically disable the localhost exception)
echo "Creating user: 'main_admin'"
kubectl --namespace ${NAMESPACE} exec $(kubectl get pod --namespace ${NAMESPACE} -l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container -- mongo --eval 'db.getSiblingDB("admin").createUser({user:"main_admin",pwd:"'"${NEW_PASSWORD}"'",roles:[{role:"root",db:"admin"}]});'


# Print Summary State of Deployment
echo
kubectl get persistentvolumes --namespace ${NAMESPACE}
kubectl get all --namespace ${NAMESPACE}
echo

