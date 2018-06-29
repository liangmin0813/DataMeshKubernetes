.PHONY: deploy status upgrade rollback delete

SHELL := /bin/bash
current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

kube_namespace = cn-north-1-apps
app_name_prefix = dcs-social-fe

deploy :
	@if [ ! -z $(helm list -q | grep ${app_name_prefix}) ] ; then \
		echo "error: ${app_name_prefix} already exists, you may run 'make upgrade VERSION=<new-version>' to upgrade"; \
		exit 1; \
	fi;
	@if [ -z "${VERSION}" ] ; then \
		echo "error: VERSION not set"; \
		exit 1; \
	fi;
	helm install --namespace ${kube_namespace} --name ${app_name_prefix} -f values.yaml ./ --set imageTag=${VERSION}

status :
	helm status ${app_name_prefix}

# You can upgrade to a newer version by specifying a new VERSION.
# However, for other upgrades, change the values.yaml file and run the command with the same VERSION.
upgrade :
	@if [ -z "${VERSION}" ] ; then \
		echo "error: VERSION not set"; \
		exit 1; \
	fi;
	helm upgrade ${app_name_prefix} -f values.yaml ./ --set imageTag=${VERSION}

rollback :
	helm rollback ${app_name_prefix} 1

delete :
	helm delete --purge ${app_name_prefix}
