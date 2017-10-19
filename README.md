# kubernetes_playbook

This project contains a Kubernetes Playbook which provides the following services:

* MongoDB with persistent storage
* MongoDB intialiazer Job
* Simple Node.JS app which queries to MongoDB.

## Generic

### Setup Docker environment

```
eval $(minikube docker-env)
```

### Configure NFS server

```
sudo mkdir -p /var/nfs

sudo chown -R nobody:nogroup /var/nfs
sudo chmod -R a+rX  /var/nfs

echo "/var/nfs 192.168.0.0/16(rw,no_root_squash,no_subtree_check)" >> /etc/exports

sudo systemctl restart nfs-server
```

### Run busybox pod

```
kubectl create -f busybox.yaml

kubectl describe pod busybox

kubectl exec -ti busybox -- echo "TEST"
```

## MongoDB server

### Persisten Volume

```
sudo mkdir -p /var/nfs/mongodb

kubectl create -f mongodb/mongodb-volume.yaml

kubectl describe pv mongodb-volume
```

### MongoDB Volume Claim

```
kubectl create -f mongodb/mongodb-volume-claim.yaml

kubectl describe pvc mongodb-claim
```

### MongoDB Pod

```
kubectl create -f mongodb/mongodb.yaml

kubectl describe pod mongodb-pod

kubectl logs mongodb-pod
```

### MongoDB Service

```
kubectl create -f mongodb/mongodb-service.yaml

kubectl describe service mongodb-service

# Check DNS
kubectl exec -ti busybox -- nslookup mongodb-service.default
```

## MongoDB populator

### Build Image

```
docker build -t mongodb-populator:1.0.0 mongodb-populator/
```

### MongoDB Job

```
kubectl create -f mongodb-populator/mongodb-populator.yaml

POD=$(kubectl get pods --show-all --selector=job-name=mongodb-populator-job --output=jsonpath={.items..metadata.name} | tail -1)
kubectl logs $POD
```

## Simple Node App server

### Build Image

```
docker build -t simple-node-app:1.0.0 simple-node-app/
```

### Simple Node App Pod

```
kubectl create -f simple-node-app/simple-node-app.yaml

kubectl describe pod simple-node-app-pod

kubectl logs simple-node-app-pod
```

### Simple Node App Service

```
kubectl create -f simple-node-app/simple-node-app-service.yaml

kubectl describe service simple-node-app-service

kubectl exec -ti busybox -- curl http://simple-node-app-service.default:8080

minikube service simple-node-app-service
```