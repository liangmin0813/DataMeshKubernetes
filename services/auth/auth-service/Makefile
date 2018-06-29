.PHONY: dockerimg pushimg cleanall cleanimg cleanrepo
SHELL := /bin/bash

# default defs
# if you are building the production version, set BRANCH to your git tag and VERSION also to tag
BRANCH = test
TAG = datamesh/dcs-auth-service
VERSION = test

# internal vars
git_repo = datamesh-oss
git_user = liangminDataMesh
git_pass = datamesh2017
project_name = MeshExpert
target_file = auth-service
main_path = src/datamesh.com/me-cloud/auth/main
current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.ONESHELL:
dockerimg :
	@chmod +x ../../fetch-git-branch.sh; \
	export GIT_REPO=${git_repo} && export GIT_USER=${git_user} && export GIT_PASS=${git_pass} && \
	../../fetch-git-branch.sh "${current_dir}" "${project_name}" "${BRANCH}" ; \
	if [ $$? -ne 0 ] ; then exit 1 ; fi;
	@echo "now compile with golang..."
	cd ${current_dir}/${project_name} && export GOPATH=`pwd` && cd ${main_path} && go build -o ${target_file} *.go && if [ $$? -ne 0 ] ; then exit 1 ; fi && cp ${target_file} ${current_dir}/
	@echo "now build the docker image..."
	cd ${current_dir} && if [ "$$EUID" -ne 0 ] ; then SUDO='sudo'; fi; $${SUDO} docker build -t $(TAG):$(VERSION) .

.ONESHELL:
pushimg :
	@cd ${current_dir}; \
	chmod +x ../../../push-registry.sh && ../../../push-registry.sh "${TAG}" "${VERSION}"

cleanall : cleanimg cleanrepo
	@echo "done"

cleanimg :
	sudo docker rmi $(TAG):$(VERSION)

cleanrepo :
	cd ${current_dir} && if [ $$? -ne 0 ] ; then exit 1 ; fi && rm -f ${target_file} && rm -fr ${project_name}
