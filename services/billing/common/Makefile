.PHONY: pull cleanrepo precheck
SHELL := /bin/bash

# default defs
# if you are building the production version, set BRANCH to your git tag and VERSION also to tag
BRANCH = dev

# internal vars
git_repo = mesh-hololens
git_user = liangmin
git_pass = datamesh2017
project_name = HoloCloud-Common
target_file = common
current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# return 0 for need to pull, otherwise no need to pull
.ONESHELL:
precheck : 
	@if [ -d ${project_name} ] ; then \
		cd ${project_name} && [ $$(git rev-parse HEAD) = $$(git ls-remote $$(git rev-parse --abbrev-ref @{u} | sed 's/\// /g') | cut -f1) ] && echo "already-up-to-date" || echo "need-to-pull" ; \
	else \
		echo "need-to-pull" ;\
	fi;

.ONESHELL:
pull : 
	@echo ${current_dir}
	@echo "pulling code..."
	if [ -d ${project_name} ] ; then \
		cd ${project_name} && git checkout . && git pull; \
	else \
		echo `git clone --depth=1 --branch=${BRANCH}  https://${git_user}:${git_pass}@gitlab.com/${git_repo}/${project_name}.git` \
		git clone --depth=1 --branch=${BRANCH}  https://${git_user}:${git_pass}@gitlab.com/${git_repo}/${project_name}.git; \
		cd ${project_name}; \
		mvn clean && mvn install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true; \
	fi; \

cleanrepo :
	cd ${current_dir} && if [ $$? -ne 0 ] ; then exit 1 ; fi && rm -f ${target_file} && rm -fr template && rm -fr ${project_name}