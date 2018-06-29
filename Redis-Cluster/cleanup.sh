kubectl delete replicasets \
  "redis-1" "redis-2" "redis-3" \
  "redis-4" "redis-5" "redis-6" \
  "redis-7"

kubectl delete services \
  "redis-1" "redis-2" "redis-3" \
  "redis-4" "redis-5" "redis-6" \
  "redis-7" "redis"

kubectl delete configmaps "redis-conf"

gcloud compute disks delete \
  "redis-1" "redis-2" "redis-3" \
  "redis-4" "redis-5" "redis-6" \
  "redis-7"
