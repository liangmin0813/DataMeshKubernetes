# me-social

### ConfigMap
```
kubectl create configmap me-social-conf --from-file=service_conf.toml
```
### Create StatefulSet and Services
```
kubectl create -f me-social-services.yaml

kubectl create -f me-social-statefulset.yaml
```

### Delete

```
kubectl delete service me-social

kubectl delete pod -l app=me-social

kubectl delete statefulset me-social

kubectl delete pvc -l app=me-social

kubectl delete pv -l app=me-social

kubectl delete configmap me-social-conf
```
