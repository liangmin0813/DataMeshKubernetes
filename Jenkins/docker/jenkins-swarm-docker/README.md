docker-jenkins-swarm
====================

Docker image for Jenkins, with swarm plugin installed.
Based on the [official image](https://registry.hub.docker.com/r/jenkins/jenkins/).

Can be used with Docker slaves from datamesh/jenkins-swarm-slave

# Running

    docker run --name jenkins -p 8080:8080 -p 50000:50000 -v /var/jenkins_home datamesh/jenkins-swarm

# Building

    docker build -t datamesh/jenkins-swarm .
