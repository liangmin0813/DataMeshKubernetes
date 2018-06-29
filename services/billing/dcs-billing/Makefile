.PHONY: dockerimg pushimg cleanall cleanimg cleanrepo precheck
SHELL := /bin/bash

# default defs
# if you are building the production version, set BRANCH to your git tag and VERSION also to tag
BRANCH = test
TAG = datamesh/dcs-billing-service
VERSION = test

# internal vars
git_repo = datamesh-oss
git_user = liangminDataMesh
git_pass = datamesh2017
project_name = dcs-billing
target_file = dcs-billing
current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
registry_username = taox@1743367343051440
registry_password = Datamesh2017
registry_endpoint = registry.ap-southeast-1.aliyuncs.com

# return 0 for need to pull, otherwise no need to pull
.ONESHELL:
precheck : 
	@if [ -d ${project_name} ] ; then \
		cd ${project_name} && [ $$(git rev-parse HEAD) = $$(git ls-remote $$(git rev-parse --abbrev-ref @{u} | sed 's/\// /g') | cut -f1) ] && echo "already-up-to-date" || echo "need-to-pull" ; \
	else \
		echo "need-to-pull" ;\
	fi;

.ONESHELL:
dockerimg : 
	@echo ${current_dir}
	@echo "pulling code..."
	if [ -d ${project_name} ] ; then \
		cd ${project_name} && git checkout . && git pull && cd ..; \
	else \
		git clone --depth=1 --branch=${BRANCH} https://${git_user}:${git_pass}@github.com/${git_repo}/${project_name}.git; \
	fi; \
	
	@echo "mvn..."
	cd ${project_name}
	mvn clean && mvn install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true
	@echo "now build the docker image..."
	cd ${current_dir} && sudo docker build -t $(TAG):$(VERSION) .

.ONESHELL:
pushimg :
	@sudo docker login --username=${registry_username} --password=${registry_password} ${registry_endpoint}
	@sudo docker tag `docker images $(TAG):$(VERSION) | grep "$(TAG)\s\{1,\}$(VERSION)" | tr -s ' ' |cut -d' ' -f3` ${registry_endpoint}/${TAG}:$(VERSION)
	sudo docker push ${registry_endpoint}/${TAG}:$(VERSION)

cleanall : cleanimg cleanrepo
	@echo "done"

cleanimg :
	sudo docker rmi $(TAG):$(VERSION)

cleanrepo :
	cd ${current_dir} && if [ $$? -ne 0 ] ; then exit 1 ; fi && rm -f ${target_file} && rm -fr template && rm -fr ${project_name}
