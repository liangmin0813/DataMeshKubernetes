.PHONY: dockerimg pushimg

SHELL := /bin/bash

current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.ONESHELL:
dockerimg :
	@if [ -z "${SERVICE}" ] ; then \
		echo "error: SERVICE not set"; \
		exit 1; \
	fi;
	@if [ -z "${BRANCH}" ] ; then \
		echo "error: BRANCH not set"; \
		exit 1; \
	fi;
	@if [ -z "${VERSION}" ] ; then \
		echo "error: VERSION not set"; \
		exit 1; \
	fi;
	@if [ $(SERVICE) = "sso" ] ; then \
		cd ${current_dir}/sso/sso-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "auth" ] ; then \
		cd ${current_dir}/auth/auth-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "billing" ] ; then \
		cd ${current_dir}/billing/common/ && make dockerimg BRANCH=${BRANCH}; \
		cd ${current_dir}/billing/dcs-billing/ && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION}; \
	fi;
	@if [ $(SERVICE) = "dcs-account" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-account && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-accounting-center" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-accounting-center && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-measuring-live" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-measuring-live && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-order" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-order && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-payment-gateway" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-payment-gateway && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "license-generator" ] ; then \
		cd ${current_dir}/license/license-generator/ && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "license-fe" ] ; then \
		cd ${current_dir}/license/license-fe/ && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "go-mail" ] ; then \
		cd ${current_dir}/portal/go-mail && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "portal-fe" ] ; then \
		cd ${current_dir}/portal/portal-fe && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "portal-service" ] ; then \
		cd ${current_dir}/portal/portal-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "social-fe" ] ; then \
		cd ${current_dir}/social/fe-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "share-service" ] ; then \
		cd ${current_dir}/social/share-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-block-service" ] ; then \
		cd ${current_dir}/drive/drive-block-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-image-service" ] ; then \
		cd ${current_dir}/drive/drive-image-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-video-service" ] ; then \
		cd ${current_dir}/drive/drive-video-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-service" ] ; then \
		cd ${current_dir}/drive/drive-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "library-service" ] ; then \
		cd ${current_dir}/library/library-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "library-fe-service" ] ; then \
		cd ${current_dir}/library/library-fe-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "director" ] ; then \
		cd ${current_dir}/director/director && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "director-server" ] ; then \
		cd ${current_dir}/director/director-server && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "director-fe-service" ] ; then \
		cd ${current_dir}/director/director-fe-service && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "digital-assistant" ] ; then \
		cd ${current_dir}/digital-assistant/digital-assistant && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "remote-expert-fe" ] ; then \
		cd ${current_dir}/digital-assistant/remote-expert-fe && make dockerimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
    # no match at all
	echo "Unknown service name, quit.";
	exit 1;

.ONESHELL:
pushimg :
	@if [ -z "${SERVICE}" ] ; then \
		echo "error: SERVICE not set"; \
		exit 1; \
	fi;
	@if [ -z "${VERSION}" ] ; then \
		echo "error: VERSION not set"; \
		exit 1; \
	fi;
	@if [ $(SERVICE) = "sso" ] ; then \
		cd ${current_dir}/sso/sso-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "auth" ] ; then \
		cd ${current_dir}/auth/auth-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "billing" ] ; then \
		cd ${current_dir}/billing/dcs-billing/ && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-account" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-account/ && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-accounting-center" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-accounting-center/ && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-measuring-live" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-measuring-live/ && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-order" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-order/ && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-payment-gateway" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-payment-gateway/ && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "license-generator" ] ; then \
		cd ${current_dir}/license/license-generator && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "license-fe" ] ; then \
		cd ${current_dir}/license/license-fe/ && make pushimg BRANCH=${BRANCH} VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "go-mail" ] ; then \
		cd ${current_dir}/portal/go-mail && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "portal-fe" ] ; then \
		cd ${current_dir}/portal/portal-fe && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "portal-service" ] ; then \
		cd ${current_dir}/portal/portal-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "social-fe" ] ; then \
		cd ${current_dir}/social/fe-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "share-service" ] ; then \
		cd ${current_dir}/social/share-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-block-service" ] ; then \
		cd ${current_dir}/drive/drive-block-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-image-service" ] ; then \
		cd ${current_dir}/drive/drive-image-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-video-service" ] ; then \
		cd ${current_dir}/drive/drive-video-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "drive-service" ] ; then \
		cd ${current_dir}/drive/drive-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "library-service" ] ; then \
		cd ${current_dir}/library/library-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "library-fe-service" ] ; then \
		cd ${current_dir}/library/library-fe-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-account" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-account && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "dcs-payment-gateway" ] ; then \
		cd ${current_dir}/dcs-billing-center/dcs-payment-gateway && make pushimg VERSION=${VERSION};\
		exit 0; \
	fi;
	@if [ $(SERVICE) = "director" ] ; then \
		cd ${current_dir}/director/director && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "director-server" ] ; then \
		cd ${current_dir}/director/director-server && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "director-fe-service" ] ; then \
		cd ${current_dir}/director/director-fe-service && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "digital-assistant" ] ; then \
		cd ${current_dir}/digital-assistant/digital-assistant && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
	@if [ $(SERVICE) = "remote-expert-fe" ] ; then \
		cd ${current_dir}/digital-assistant/remote-expert-fe && make pushimg VERSION=${VERSION};\
		exit 0;\
	fi;
