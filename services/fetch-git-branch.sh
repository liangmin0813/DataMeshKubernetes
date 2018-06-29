#!/bin/bash

# prepare variable
git_repo="${GIT_REPO:=datamesh-oss}"
git_user="${GIT_USER:=liangminDataMesh}"
git_pass="${GIT_PASS:=datamesh2017}"

work_dir="${WORD_DIR:=$1}"
project_name="${GIT_PROJECT_NAME:=$2}"
branch="${GIT_BRANCH:=$3}"

# check paratemters
if [ -z ${work_dir} ]; then
    echo "Error: work dir not set."
    exit 1
fi

if [ -z ${project_name} ]; then
    echo "Error: project name not set."
    exit 1
fi

if [ -z ${branch} ]; then
    echo "Error: branch not set."
    exit 1
fi

# now fetch

# check if has local branch. if does, checkout to it; if not fetch origin
# if has remote branch, track and make local copy
# see: https://gist.github.com/markSci5/5916003
#      https://stackoverflow.com/questions/9537392/git-fetch-remote-branch
cd ${work_dir}
echo "pulling code...(pwd: `pwd`)"
if [ -d ${project_name}/src ] ; then
	cd ${project_name}/src;
	gbranch=`git branch | sed "s/ //g" | sed "s/*//g" | grep -e "^${branch}$"`
	if [ -z ${gbranch} ]; then
		echo "now fetch origin"
		git fetch origin
		rbranch=`git branch -a | sed "s/ //g" | sed "s/*//g" | grep -e "/${branch}$"`
		if [ -z ${rbranch} ]; then
			echo "Error: remote does not have branch '${branch}'."
			exit 1
			git checkout --track origin/${branch} && git pull
		else
			echo "found remote branch '${rbranch}', now track it"
			git checkout --track origin/${branch} && git pull
		fi
	else
		echo "now switch to known branch '${branch}'"
		git checkout ${branch} && git checkout . && git pull
	fi
else
	mkdir -p ${project_name}/src
	git clone https://${git_user}:${git_pass}@github.com/${git_repo}/${project_name}.git ${project_name}/src
	cd ${project_name}/src && git checkout ${branch}
fi
