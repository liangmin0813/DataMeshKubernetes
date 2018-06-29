# MySQL-StatefulSet

### ConfigMap
```
kubectl create configmap mysql --from-file=mysql-configmap.yaml --namespace test
```
### Create StatefulSet and Services
```
kubectl create -f mysql-services.yaml --namespace test

kubectl create -f mysql-statefulset.yaml --namespace test
```

## Check

```
kubectl describe pod mysql-0 --namespace test
```


### Delete

```
kubectl delete configmap mysql --namespace test

kubectl delete -f mysql-statefulset.yaml --namespace test
 
kubectl delete -f mysql-services.yaml --namespace test
```
