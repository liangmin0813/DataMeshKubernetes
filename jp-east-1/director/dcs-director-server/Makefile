.PHONY: deploy status upgrade rollback delete

SHELL := /bin/bash
current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

kube_namespace = jp-east-1-apps
app_name_prefix = dcs-dir-srv-svc

deploy :
	@if [ ! -z $(helm list -q | grep ${app_name_prefix}) ] ; then \
		echo "error: ${app_name_prefix} already exists, you may run 'make upgrade VERSION=<new-version>' to upgrade"; \
		exit 1; \
	fi;
	@if [ -z "${VERSION}" ] ; then \
		echo "error: VERSION not set"; \
		exit 1; \
	fi;
	helm install --namespace ${kube_namespace} --name ${app_name_prefix}-0 -f values.yaml ./ --set imageTag=${VERSION}
	helm install --namespace ${kube_namespace} --name ${app_name_prefix}-1 -f values.yaml ./ --set imageTag=${VERSION}
	helm install --namespace ${kube_namespace} --name ${app_name_prefix}-2 -f values.yaml ./ --set imageTag=${VERSION}
	helm install --namespace ${kube_namespace} --name ${app_name_prefix}-3 -f values.yaml ./ --set imageTag=${VERSION}
	helm install --namespace ${kube_namespace} --name ${app_name_prefix}-4 -f values.yaml ./ --set imageTag=${VERSION}

status :
	helm status ${app_name_prefix}-0
	helm status ${app_name_prefix}-1
	helm status ${app_name_prefix}-2
	helm status ${app_name_prefix}-3
	helm status ${app_name_prefix}-4

# You can upgrade to a newer version by specifying a new VERSION.
# However, for other upgrades, change the values.yaml file and run the command with the same VERSION.
upgrade :
	@if [ -z "${VERSION}" ] ; then \
		echo "error: VERSION not set"; \
		exit 1; \
	fi;
	helm upgrade ${app_name_prefix}-0 -f values.yaml ./ --set imageTag=${VERSION}
	helm upgrade ${app_name_prefix}-1 -f values.yaml ./ --set imageTag=${VERSION}
	helm upgrade ${app_name_prefix}-2 -f values.yaml ./ --set imageTag=${VERSION}
	helm upgrade ${app_name_prefix}-3 -f values.yaml ./ --set imageTag=${VERSION}
	helm upgrade ${app_name_prefix}-4 -f values.yaml ./ --set imageTag=${VERSION}

rollback :
	helm rollback ${app_name_prefix}-0 1
	helm rollback ${app_name_prefix}-1 1
	helm rollback ${app_name_prefix}-2 1
	helm rollback ${app_name_prefix}-3 1
	helm rollback ${app_name_prefix}-4 1

delete :
	helm delete --purge ${app_name_prefix}-0
	helm delete --purge ${app_name_prefix}-1
	helm delete --purge ${app_name_prefix}-2
	helm delete --purge ${app_name_prefix}-3
	helm delete --purge ${app_name_prefix}-4
