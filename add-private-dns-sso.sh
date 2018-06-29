#!/bin/bash

sleep 5

NS1="cn-north-1-apps"
NS2="dcs-central-apps"
SSO_HOST="40.125.210.247 sso.datamesh.com"
MQ_HOST="40.125.166.148 mq.svc.datamesh.com"
DIR_HOST="40.125.210.247 director-srv.cn-north-1.datamesh.com"

kubectl get pods -o name -n ${NS1} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS1} -- sh -c "echo ${SSO_HOST} | tee -a /etc/hosts"

kubectl get pods -o name -n ${NS1} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS1} cat /etc/hosts | grep "${SSO_HOST}"


kubectl get pods -o name -n ${NS2} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS2} -- sh -c "echo ${SSO_HOST} | tee -a /etc/hosts"

kubectl get pods -o name -n ${NS2} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS2} cat /etc/hosts | grep "${SSO_HOST}"


kubectl get pods -o name -n ${NS1} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS1} -- sh -c "echo ${MQ_HOST} | tee -a /etc/hosts"

kubectl get pods -o name -n ${NS1} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS1} cat /etc/hosts | grep "${MQ_HOST}"


kubectl get pods -o name -n ${NS2} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS2} -- sh -c "echo ${MQ_HOST} | tee -a /etc/hosts"

kubectl get pods -o name -n ${NS2} | grep dcs-auth | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS2} cat /etc/hosts | grep "${MQ_HOST}"


kubectl get pods -o name -n ${NS1} | grep dcs-director-svc | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS1} -- sh -c "echo ${DIR_HOST} | tee -a /etc/hosts"

kubectl get pods -o name -n ${NS1} | grep dcs-director-svc | sed 's/pods\///g' | xargs -n1 -I {} kubectl exec {} -n ${NS1} cat /etc/hosts | grep "${DIR_HOST}"
