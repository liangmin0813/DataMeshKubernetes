# MongoDB Sharded Cluster Deployment Demo for Kubernetes on GKE

An example project demonstrating the deployment of a MongoDB Sharded Cluster via Kubernetes on the Google Container Platform (GKE), using Kubernetes' feature StatefulSet. Contains example Kubernetes YAML resource files (in the 'resource' folder) and associated Kubernetes based Bash scripts (in the 'scripts' folder) to configure the environment and deploy a MongoDB Replica Set.

For further background information on what these scripts and resource files do, see section 2 of this document and also see the series of related blog posts written by this project's author:

* [Deploying a MongoDB Replica Set as a GKE Kubernetes StatefulSet](http://pauldone.blogspot.co.uk/2017/06/deploying-mongodb-on-kubernetes-gke25.html)
* [Configuring Some Key Production Settings for MongoDB on GKE Kubernetes](http://pauldone.blogspot.co.uk/2017/06/mongodb-kubernetes-production-settings.html)
* [Using the Enterprise Version of MongoDB on GKE Kubernetes](http://pauldone.blogspot.co.uk/2017/06/enterprise-mongodb-on-kubernetes.html)
* [Deploying a MongoDB Sharded Cluster using Kubernetes StatefulSets on GKE](http://pauldone.blogspot.co.uk/2017/07/sharded-mongodb-kubernetes.html)


## 1 How To Run

### 1.1 Prerequisites

Ensure the following dependencies are already fulfilled on your host Linux/Windows/Mac Workstation/Laptop:

1. An account has been registered with the Google Compute Platform (GCP). You can sign up to a [free trial](https://cloud.google.com/free/) for GCP. Note: The free trial places some restrictions on account resource quotas, in particular restricting storage to a maximum of 100GB.
2. GCP’s client command line tool [gcloud](https://cloud.google.com/sdk/docs/quickstarts) has been installed on your local workstation. 
3. Your local workstation has been initialised to: (1) use your GCP account, (2) install the Kubernetes command tool (“kubectl”), (3) configure authentication credentials, and (4) set the default GCP zone to be deployed to:

    ```
    $ gcloud init
    $ gcloud components install kubectl
    $ gcloud auth application-default login
    $ gcloud config set compute/zone europe-west1-b
    ```

**Note:** To specify an alternative zone to deploy to, in the above command, you can first view the list of available zones by running the command: `$ gcloud compute zones list`

### 1.2 Deployment

Using a command-line terminal/shell, execute the following (first change the password variable in the script "generate.sh", if appropriate):

    $ cd scripts
    $ ./generate.sh
    
This takes a few minutes to complete. Once completed, you should have a MongoDB Sharded Cluster initialised, secured and running in some Kubernetes StatefulSets/Deployments. The executed bash script will have created the following resources:

* 1x Config Server Replica Set containing 3x replicas (deployment type: "StatefulSet")
* 3x Shards with each Shard being a Replica Set containing 3x replicas (deployment type: "StatefulSet")
* 2x Mongos Routers (deployment type: "Deployment")

You can view the list of Pods that contain these MongoDB resources, by running the following:

    $ kubectl get pods
    
You can also view the the state of the deployed environment via the [Google Cloud Platform Console](https://console.cloud.google.com) (look at both the “Container Engine” and the “Compute Engine” sections of the Console).

### 1.3 Test Sharding Your Own Collection

To test that the sharded cluster is working properly, connect to the container running the first "mongos" router, then use the Mongo Shell to authenticate, enable sharding on a specific collection, add some test data to this collection and then view the status of the Sharded cluster and collection:

    $ kubectl exec -it $(kubectl get pod -l "tier=routers" -o jsonpath='{.items[0].metadata.name}') -c mongos-container bash
    $ mongo
    > db.getSiblingDB('admin').auth("main_admin", "abc123");
    > sh.enableSharding("test");
    > sh.shardCollection("test.testcoll", {"myfield": 1});
    > use test;
    > db.testcoll.insert({"myfield": "a", "otherfield": "b"});
    > db.testcoll.find();
    > sh.status();

### 1.4 Undeploying & Cleaning Down the Kubernetes Environment

**Important:** This step is required to ensure you aren't continuously charged by Google Cloud for an environment you no longer need.

Run the following script to undeploy the MongoDB Services & StatefulSets/Deployments plus related Kubernetes resources, followed by the removal of the GCE disks before finally deleting the GKE Kubernetes cluster.

    $ ./teardown.sh
    
It is also worth checking in the [Google Cloud Platform Console](https://console.cloud.google.com), to ensure all resources have been removed correctly.


## 2 Factors Addressed By This Project

* Deployment of a MongoDB on GKE's Kubernetes platform
* Use of Kubernetes StatefulSets and PersistentVolumeClaims to ensure data is not lost when containers are recycled
* Proper configuration of a MongoDB Sharded Cluster for Scalability with each Shard being a Replica Set for full resiliency
* Securing MongoDB by default for new deployments
* Leveraging XFS filesystem for data file storage to improve performance
* Disabling Transparent Huge Pages to improve performance
* Disabling NUMA to improve performance
* Controlling CPU & RAM Resource Allocation
* Correctly configuring WiredTiger Cache Size in containers
* Controlling Anti-Affinity for Mongod Replicas to avoid a Single Point of Failure

